#!/bin/sh

if [ -z $1 ]
then
	echo "$1 executable is missing"
	echo "Usage: ./all_test.sh path/to/ft_ls [p]"
	exit 1
fi

./42bonus_ACL.sh $1 $2
echo ""
./42bonus_opt_1.sh $1 $2
echo ""
./42bonus_opt_c.sh $1 $2
echo ""
./42bonus_opt_d.sh $1 $2
echo ""
./42bonus_opt_f.sh $1 $2
echo ""
./42bonus_opt_u.sh $1 $2
