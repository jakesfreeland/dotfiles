#!/bin/sh

script_name="launch.sh"
cpu_flag="-cpu host"
smp_flag="-smp 4"
mem_flag="-m 4096M"
graphics_flag="-vga none"
ssh_flag="-nic user,hostfwd=tcp::2222-:22"
and_flag="&"

show_help() {
cat <<EOF
${0##*/}: Create a script to launch a QEMU virtual machine

Usage:
	${0##*/} [-f IMAGE] [options]

Options:
	-f IMAGE   virtual image file name
	-n SIZE    creates a new qcow2 image
	-i CDROM   boot with cdrom/iso attached
	-s NCPU    symmetric multiprocessor count
	-m MEM     amount of memory allocated
	-v DRIVER  video graphics interface
	-r PORT    SSH server poer
	-R PORT    SPICE server port
	-o NAME    output script name
	-h         prints help information

Example:
	${0##*/} -f alpine.qcow2 -n 32G -i ./alpine-standard-3.15.4-x86_64.iso
	creates a new 32G alpine.qcow2 image and generates ./launch.sh
EOF
}

err() {
	echo "${0##*/}: $1" >&2
	exit 1
}

OS=$(uname)
if [ "$OS" = "Linux" ]; then
	accel_flag="-accel kvm"
	sound_flag="-audiodev pa,id=snd0"
elif [ "$OS" = "Darwin" ]; then
	accel_flag="-accel hvf"
	sound_flag="-audiodev coreaudio,id=snd0"
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
	err "Unsupported hardware platform"
fi

while getopts ":f:n:i:s:m:v:r:R:o:h" opt; do
	case $opt in
		f)
			img="$OPTARG"
			;;
		n)
			img_size="$OPTARG"
			;;
		i)
			iso_flag="-cdrom $OPTARG"
			;;
		s)
			smp_flag="-smp $OPTARG"
			;;
		m)
			mem_flag="-m $OPTARG"
			;;
		v)
			if [ "$OPTARG" = "nographic" ]; then
				graphics_flag="-nographic"
				and_flag=""
			else
				graphics_flag="-vga $OPTARG"
			fi
			;;
		r)
			ssh_flag="-nic user,hostfwd=tcp::$OPTARG-:22"
			;;
		R)
			spice_flag=\
			"-spice port=$OPTARG,disable-ticketing=on \
			 -device virtio-serial-pci \
			 -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 \
			 -chardev spicevmc,id=spicechannel0,name=vdagent"
			;;
		o)
			script_name="$OPTARG"
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

[ -e "$script_name" ] && err "File with name: \"$script_name\" already exists"
[ -z "$img" ] && err "Missing image file. Use -h for help"

if [ -n "$img_size" ]; then
	if [ -e "$img" ]; then
		echo "Image file: \"$img\" already exists. Skipping creation"
	else
		qemu-img create -f qcow2 "$img" $img_size
	fi
fi

cat <<EOF > "$script_name"
$qemu_cmd \\
	-drive file=$img,if=virtio $iso_flag \\
	$cpu_flag $accel_flag \\
	$machine_flag $bios_flag \\
	$smp_flag $mem_flag \\
	$graphics_flag $sound_flag \\
	$ssh_flag $spice_flag \\
	$and_flag
EOF

chmod +x "$script_name"
