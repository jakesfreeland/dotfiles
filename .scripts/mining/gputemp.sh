while getopts ":lh" opt; do
	case $opt in
		l)
			while true; do
				nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader
				sleep 300
			done
			;;
		h)
			printf "options:\n  -h  help\n  -l  loop\n"
			;;
		\?)
			echo "invalid option: -$OPTARG"
			;;
	esac
done

if [ $OPTIND -eq 1 ]; then
	nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader
fi
