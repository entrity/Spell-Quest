for i in `seq 1 100`; do
	printf "Pipe %2d contains " $i
	if (( $RANDOM % 2 )); then
		echo filth
	else
		shuf -n1 /usr/share/dict/british-english
	fi
done