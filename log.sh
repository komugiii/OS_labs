#!bin/bash

# task number 2.6

function log {
	warning="$(cat /var/log/anaconda/X.log | awk '{if($3 == "(WW)") print $0}')"
	inf="$(cat /var/log/anaconda/X.log | awk '{if($3 == "(II)") print $0}')"
	echo -e "${warning//"(WW)"/"\e[33mWarning\e[0m"}"
	echo -e "${inf//"(II)"/"\e[36mInformatiom\e[0m"}"
}
