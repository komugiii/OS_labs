#!bin/bash

# task number 2.4 reverce
function reverse {
        tac $1 > $2
	cat $2
}
