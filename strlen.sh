#!ban/bash

# task number 2.5 string lenght
function strlen {
	echo "$1" | awk '{print length}'
}
