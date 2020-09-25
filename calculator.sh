#!bin/bash
# task number 2.2 calculator

function calculator {
	reg='^[+-]?[0-9]+$'
	if ! [[ $2 =~ $reg && $3 =~ $reg ]]
	then
	echo "один из введенных параметров не является целым числом!" >&2
	exit 0
	fi
	case $1 in
	"sum")
		result=$[ $2 + $3 ]
		echo $result
	;;
	"sub")
		result=$[ $2 - $3 ]
		echo $result
	;;
	"mul")
		result=$[ $2 * $3 ]
		echo $result
	;;
	"div")
		if [ $3 == 0 ]
		then
		echo "на ноль делить нельзя!" >&2
		exit 0
		fi
		result=$[ $2 / $3 ]
		echo $result
	;;
	*)
		echo "вы ввели неверно параметр действия в калькуляторе" >&2
	esac
}
