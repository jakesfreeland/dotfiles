#!/bin/sh

show_help() {
cat <<EOF
${0##*/}: Create a script to launch a QEMU virtual machine

Usage:
	${0##*/} <ncpu> <mem> [options] <disk image>

Options:
	-n SIZE    creates a new qcow2 disk image
	-i CDROM   attach cdrom/iso
	-v DRIVER  graphics card
	-d TYPE    type of display
	-s PORT    SSH server port
	-S PORT    SPICE server port
	-o NAME    output script name
	-h         prints help information
EOF
}

err() {
	echo "${0##*/}: $1" >&2
	exit 1
}

if [ "$#" -lt 3 ]; then
	show_help
	exit 1
fi

OS=$(uname)
if [ "$OS" = "Linux" ]; then
	accel_flag="-accel kvm"
elif [ "$OS" = "Darwin" ]; then
	accel_flag="-accel hvf"
else
	echo "Proceeding without acceleration, expect slowdowns"
fi

MACHINE=$(uname -m)
if [ "$MACHINE" = "x86_64" ]; then
	qemu_cmd="qemu-system-x86_64"
elif [ "$MACHINE" = "arm64" ]; then
	qemu_cmd="qemu-system-aarch64"
	machine_flag="-M virt"
	bios_flag="-bios edk2-aarch64-code.fd"
else
	err "Unsupported hardware architecture. Exiting."
fi

for img; do true; done

script_name="launch.sh"
cpu_flag="-cpu host"
smp_flag="-smp $1"
mem_flag="-m $2"
and_flag="&"

OPTIND=3
while getopts ":n:i:v:d:s:S:o:h" opt; do
	case $opt in
		n)
			if [ -e "$img" ]; then
				echo "Image file: \"$img\" already exists. Skipping creation"
			else
				qemu-img create -f qcow2 "$img" "$OPTARG"
			fi
			;;
		i)
			iso_flag="-cdrom $OPTARG"
			;;
		v)
			if [ "$OPTARG" = "nographic" ]; then
				vga_flag="-nographic"
				and_flag=""
			else
				vga_flag="-vga $OPTARG"
			fi
			;;
		d)
			display_flag="-display $OPTARG"
			if [ "$OPTARG" = "curses" ]; then
				and_flag=""
			fi
			;;
		s)
			ssh_flag="-nic user,hostfwd=tcp::$OPTARG-:22"
			;;
		S)
			spice_flag=\
			"-spice port=$OPTARG,disable-ticketing=on \
			 -device virtio-serial-pci \
			 -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 \
			 -chardev spicevmc,id=spicechannel0,name=vdagent"
			;;
		o)
			script_name="$OPTARG"
			if [ -e "$script_name" ]; then
				err "File with name: \"$script_name\" already exists"
			fi
			;;
		h)
			show_help
			exit 1
			;;
		\?)
			err "Invalid option: -$OPTARG"
			;;
	esac
done

cat <<EOF > "$script_name"
$qemu_cmd \\
	-drive file=$img,if=virtio $iso_flag \\
	$cpu_flag $accel_flag \\
	$machine_flag $bios_flag \\
	$smp_flag $mem_flag \\
	$vga_flag $display_flag \\
	$ssh_flag $spice_flag \\
	$and_flag
EOF

chmod +x "$script_name"
