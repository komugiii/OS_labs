#!/bin/bash
datetime=$(date +"%d-%m-%y-%H-%M")
mkdir ~/test && echo "catalog test was created seccessfully" >> ~/report && touch ~/test/$datetime
ping www.net_nikogo.ru || echo "$datetime error" >> ~/report
