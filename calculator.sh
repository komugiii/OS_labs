#!bin/bash
# task number 2.2 calculator

function calculator {
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
		result=$[ $2 / $3 ]
		echo $result
	;;
	esac
}
