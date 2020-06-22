#!/bin/sh

clear="\033[0m"
green="\033[32m"
red="\033[31m"
cyan="\033[36m"
Byellow="\033[33;1m"
pos="\033[60G"
cross="\xE2\x9D\x8C"
tick="\xE2\x9C\x94"
success=0;
nb_test=0;
nb=0;

if [ -z $1 ]
then
	echo "ft_ls executable is missing"
	echo "Usage: ./basic_test.sh path/to/ft_ls [p]"
	exit 1;
fi

cp $1 ./;

mkdir -p result;

nb_test=0;
test_name="42_test_opt_R"
echo "=========================== "$test_name" ===========================\n";
###1
mkdir -p level1_{1..2}/level2_{1..2}/level3_{1..2}
./ft_ls -1R | grep -v r1 | grep -v r2 > result/r1 2>&1;
ls -1R | grep -v r1 | grep -v r2 > result/r2 2>&1;
diff result/r1 result/r2 > result/r3;
	nb_test=$(($nb_test+1))
	nb=$(($nb+1))
if [ -s result/r3 ]
then
	echo $cyan"\n==========\nft_ls:"$clear;
	cat -e result/r1;
	echo $cyan"==========\nls:"$clear;
	cat -e result/r2;
	if [ -n $2 ] && [ "$2" == "p" ]
	then
		echo "\nDiff:";
		cat result/r3;
		echo "";
	fi 	
	echo $red"Test "$nb_test": ls -1R with 'mkdir -p level1_{1..2}/level2_{1..2}/level3_{1..2}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1R with 'mkdir -p level1_{1..2}/level2_{1..2}/level3_{1..2}'"$clear;
fi
rm -rf level1*

###2
mkdir -p level1_{1..3}/level2_{6..8}/level3_{11..13}
./ft_ls -1R > result/r1 2>&1;
ls -1R > result/r2 2>&1;
diff result/r1 result/r2 > result/r3;
	nb_test=$(($nb_test+1))
	nb=$(($nb+1))
if [ -s result/r3 ]
then
	echo $cyan"\n==========\nft_ls:"$clear;
	cat -e result/r1;
	echo $cyan"==========\nls:"$clear;
	cat -e result/r2;
	if [ -n $2 ] && [ "$2" == "p" ]
	then
		echo "\nDiff:";
		cat result/r3;
		echo "";
	fi 	
	echo $red"Test "$nb_test": ls -1R with 'mkdir -p level1_{1..3}/level2_{6..8}/level3_{11..13}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1R with 'mkdir -p level1_{1..3}/level2_{6..8}/level3_{11..13}'"$clear;
fi
rm -rf level*

###3
mkdir -p .a .b .c && mkdir -p a b c 
./ft_ls -1R > result/r1 2>&1;
ls -1R > result/r2 2>&1;
diff result/r1 result/r2 > result/r3;
	nb_test=$(($nb_test+1))
	nb=$(($nb+1))
if [ -s result/r3 ]
then
	echo $cyan"\n==========\nft_ls:"$clear;
	cat -e result/r1;
	echo $cyan"==========\nls:"$clear;
	cat -e result/r2;
	if [ -n $2 ] && [ "$2" == "p" ]
	then
		echo "\nDiff:";
		cat result/r3;
		echo "";
	fi 	
	echo $red"Test "$nb_test": ls -1 with 'mkdir -p .a .b .c && mkdir -p a b c '"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 with 'mkdir -p .a .b .c && mkdir -p a b c '"$clear;
fi
rm -rf .a .b .c a b c

###4
mkdir a b c
chmod 000 b
./ft_ls -1R 2>&1 | grep -v denied > result/r1 2>&1;
ls -1R 2>&1 | grep -v denied > result/r2 2>&1;
diff result/r1 result/r2 > result/r3;
	nb_test=$(($nb_test+1))
	nb=$(($nb+1))
if [ -s result/r3 ]
then
	echo $cyan"\n==========\nft_ls:"$clear;
	cat -e result/r1;
	echo $cyan"==========\nls:"$clear;
	cat -e result/r2;
	if [ -n $2 ] && [ "$2" == "p" ]
	then
		echo "\nDiff:";
		cat result/r3;
		echo "";
	fi 	
	echo $red"Test "$nb_test": ls -1R 2>&1 | grep -v denied with 'mkdir a b c | chmod 000 b'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1R 2>&1 | grep -v denied with 'mkdir a b c | chmod 000 b'"$clear;
fi
rm -rf a b c

###5
./ft_ls -1R 2>&1 | grep denied | wc -l | tr -d ' ' | tr -d '\n' > result/r1 2>&1;
ls -1R 2>&1 | grep denied | wc -l | tr -d ' ' | tr -d '\n' > result/r2 2>&1;
diff result/r1 result/r2 > result/r3;
	nb_test=$(($nb_test+1))
	nb=$(($nb+1))
if [ -s result/r3 ]
then
	echo $cyan"\n==========\nft_ls:"$clear;
	cat -e result/r1;
	echo $cyan"==========\nls:"$clear;
	cat -e result/r2;
	if [ -n $2 ] && [ "$2" == "p" ]
	then
		echo "\nDiff:";
		cat result/r3;
		echo "";
	fi 	
	echo $red"Test "$nb_test": ls -1R 2>&1 | grep denied | wc -l | tr -d ' ' | tr -d '\n' 2>&1 | grep -v denied with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1R 2>&1 | grep denied | wc -l | tr -d ' ' | tr -d '\n' 2>&1 | grep -v denied with ''"$clear;
fi

###6
mkdir A;
touch A/file;
./ft_ls -1R A a 2>&1 > result/r1 2>&1;
ls -1R A a 2>&1 > result/r2 2>&1;
diff result/r1 result/r2 > result/r3;
	nb_test=$(($nb_test+1))
	nb=$(($nb+1))
if [ -s result/r3 ]
then
	echo $cyan"\n==========\nft_ls:"$clear;
	cat -e result/r1;
	echo $cyan"==========\nls:"$clear;
	cat -e result/r2;
	if [ -n $2 ] && [ "$2" == "p" ]
	then
		echo "\nDiff:";
		cat result/r3;
		echo "";
	fi 	
	echo $red"Test "$nb_test": ls -1R A a with 'mkdir A | touch A/file'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1R A a with 'mkdir A | touch A/file'"$clear;
fi
rm -rf A

printf $Byellow"\nEnd of "$test_name" tests\n"$clear;
if [ $success -eq $nb ]
then
	echo $green"Congratulation ! You passed all the tests."$clear;
else
	printf $cyan"%d test succeed, " "$success";
	success=$(($nb-$success));
	printf "%d test failed\n"$clear "$success";
fi
rm -rf result;