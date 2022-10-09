#!/bin/sh

if ! command -v qemu-kvm > /dev/null 2>&1; then
  echo "$0: QEMU was not found in your path. Ensure that QEMU is installed with kvm capability" >&2
  exit 1
fi

show_help() {
echo \
"${0##*/}: Launch a kvm accelerated virtual machine using QEMU and SPICE

Usage:
  ${0##*/} [-fnmcgsih] [option] ...

Flags:
  -f        image file name
  -n        creates a new qcow2 image with [-n SIZE]
  -m        amount of memory allocated
  -c        number of CPU cores allocated
  -g        graphics interface
  -s        SPICE server port
  -i        boot with iso file
  -h        prints help information

Example:
  qemu_launch.sh -f alpine.qcow2 -i ./alpine-standard-3.15.4-x86_64.iso -n 32G
  creates a new qcow2 image with the name alpine.qcow2 and boots into the alpine-standard iso"
}

img=""
img_size=""

mem_flag="-m 4096M"
cpu_flag="-smp 4"
graphics_flag="-vga qxl"
spice_flag="-spice port=5930,disable-ticketing=on"
iso_flag=""

while getopts ":f:n:m:c:g:s:i:h" opt; do
	case $opt in
    f)
      img=$OPTARG
      ;;
    n)
      img_size=$OPTARG
      ;;
    m)
      mem_flag="-m $OPTARG"
			;;
    c)
      cpu_flag="-smp $OPTARG"
			;;
    g)
      graphics_flag="-vga $OPTARG"
      ;;
    s)
      spice_flag="-spice port=$OPTARG,disable-ticketing=on"
      ;;
    i)
      iso_flag="-cdrom $OPTARG"
      ;;
    h)
      show_help
      exit 1
      ;;
		\?)
      echo "${0##*/}: invalid option: -$OPTARG" >&2
      exit 1
			;;
	esac
done

if [ -z "$img" ]; then
  echo "${0##*/}: Missing image file. Use ${0##*/} -h for help" >&2
  exit 1 
fi

if [ ! -z "$img_size" ]; then
  qemu-img create -f qcow2 "$img" $img_size
fi

qemu-system-x86_64 \
  $iso_flag \
  -drive file=$img,if=virtio,aio=native,cache.direct=on \
  -cpu host \
  -enable-kvm \
  $mem_flag \
  $cpu_flag \
  $graphics_flag \
  -device virtio-serial-pci \
  $spice_flag \
  -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 \
  -chardev spicevmc,id=spicechannel0,name=vdagent \
  -audiodev pa,id=snd0 \
  -net nic \
  -net user,hostfwd=tcp::2222-:22 \
  &

exit 0

