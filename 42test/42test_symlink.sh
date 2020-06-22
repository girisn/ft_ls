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
test_name="42_test_symlink"
echo "=========================== "$test_name" ===========================\n";
###1
mkdir mydir && ln -s mydir symdir && touch mydir/file{1..5}
./ft_ls -1 symdir 2>&1 > result/r1 2>&1;
ls -1 symdir 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 symdir with 'mkdir mydir && ln -s mydir symdir && touch mydir/file{1..5}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 symdir with 'mkdir mydir && ln -s mydir symdir && touch mydir/file{1..5}'"$clear;
fi
rm -rf mydir symdir

###2
touch a
ln -s a b
./ft_ls -1 b 2>&1 > result/r1 2>&1;
ls -1 b 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 b with 'touch a | ln -s a b'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 b with 'touch a | ln -s a b'"$clear;
fi
rm -rf a b

###3
mkdir a
ln -s a b
rm -rf a
./ft_ls -1 b 2>&1 > result/r1 2>&1;
ls -1 b 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 b with 'mkdir a | ln -s a b | rm -rf a'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 b with 'mkdir a | ln -s a b | rm -rf a'"$clear;
fi
rm -rf b

###4
mkdir a
ln -s a b
rm -rf a
./ft_ls -l b 2>&1 > result/r1 2>&1;
ls -l b 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -l b with 'mkdir a | ln -s a b | rm -rf a'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l b with 'mkdir a | ln -s a b | rm -rf a'"$clear;
fi
rm -rf b


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