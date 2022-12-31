#!/bin/sh

qemu_cmd="qemu-system-x86_64"
accel_flag="-accel kvm"
cpu_flag="-cpu host"
smp_flag="-smp 4"
mem_flag="-m 4096M"
ssh_flag="-nic user,hostfwd=tcp::2222-:22"

if [ "$(uname)" = "Darwin" ]; then
	qemu_cmd="qemu-system-aarch64"
	accel_flag="-accel hvf"
	machine_flag="-M virt"
	bios_flag="-bios edk2-aarch64-code.fd"
fi

show_help() {
echo \
"$0: Launch a virtual machine using QEMU

Usage:
	$0 [-f IMAGE] [options]

Options:
	-f IMAGE   virtual image file name
	-n SIZE    creates a new qcow2 image
	-i CDROM   boot with cdrom/iso attached
	-a ACCEL   acceleration framework
	-M MACH    machine specification
	-b BIOS    bios file
	-c CPU     cpu to emulate
	-s NCPU    symmetric multiprocessor count
	-m MEM     amount of memory allocated
	-g DRIVER  graphics interface
	-r PORT    SSH server poer
	-S PORT    SPICE server port
	-h         prints help information

Example:
	qemu_launch.sh -f alpine.qcow2 -n 32G -i ./alpine-standard-3.15.4-x86_64.iso
	creates a new 32G qcow2 image with the name alpine.qcow2 and boots into the alpine-standard iso"
}

while getopts ":f:n:i:a:M:b:c:s:m:g:o:r:S:h" opt; do
	case $opt in
		f)
			img=$OPTARG ;;
		n)
			img_size=$OPTARG ;;
		i)
			iso_flag="-cdrom $OPTARG" ;;
		a)
			accel_flag="-accel $OPTARG" ;;
		M)
			machine_flag="-M $OPTARG" ;;
		b)
			bios_flag="-bios $OPTARG" ;;
		c)
			cpu_flag="-cpu $OPTARG" ;;
		s)
			smp_flag="-smp $OPTARG" ;;
		m)
			mem_flag="-m $OPTARG" ;;
		g)
			graphics_flag="-vga $OPTARG" ;;
		o)
			sound_flag="-audiodev $OPTARG,id=snd0" ;;
		r)
			ssh_flag="-nic user,hostfwd=tcp::$OPTARG-:22" ;;
		S)
			spice_flag=\
			"-spice port=$OPTARG,disable-ticketing=on \
			 -device virtio-serial-pci \
			 -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 \
			 -chardev spicevmc,id=spicechannel0,name=vdagent"
			;;
		h)
			show_help
			exit 1
			;;
		\?)
			echo "$0: invalid option: -$OPTARG" >&2
			exit 1
			;;
	esac
done

if [ -z "$img" ]; then
	echo "$0: Missing image file. Use -h for help" >&2
	exit 1
fi

if [ -n "$img_size" ]; then
	qemu-img create -f qcow2 "$img" $img_size
fi

$qemu_cmd \
	$iso_flag \
	$accel_flag \
	$cpu_flag \
	$machine_flag \
	$bios_flag \
	$smp_flag \
	$mem_flag \
	$graphics_flag \
	$sound_flag \
	$ssh_flag \
	$spice_flag \
	-drive file=$img,if=virtio \
	&
