#!bin/bash

# task number 2.4 reverce
function reverse {
        if ! [ -f "$1"]
	then
	echo "первый файл отсутствует!" >&2
	fi
	tac $1 > $2
	cat $2
}
