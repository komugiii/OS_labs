#!bin/bash

# task number 2.9 interactive

function interactive {
	echo -e "a - калькулятор\nb - рекурсивный поиск\nс - в обратном порядке записывает содержимое файла\nd - длина строки\ne - информационные сообщения и предупреждения из log файла\nf - выход\ng - помощь"
	read value
	case $value in
	"a")
	echo "введите операцию и два числа с которыми вы хотите эту операцию проделать"
	read arg1 arg2 arg3
	source ./calculator.sh
	calculator "$arg1" "$arg2" "$arg3"
	interactive
	;;
	"b")
	echo "введите директорию и регулярное выражение"
	read arg1 arg2
	source ./search.sh
	search "$arg1" "$arg2"
	interactive
	;;
	"c")
	echo "введите два имени файла"
	read arg1 arg2
	source ./reverse.sh
	reverse "$arg1" "$arg2"
	interactive
	;;
	"d")
	echo "введите строку"
	read arg1
	source ./strlen.sh
	strlen "$arg1"
	interactive
	;;
	"e")
	source ./log.sh
	log
	interactive
	;;
	esac
}
