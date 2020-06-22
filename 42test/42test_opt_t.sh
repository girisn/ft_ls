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
test_name="42_test_opt_t"
echo "=========================== "$test_name" ===========================\n";
###1
touch a b c d e && touch -t 201212101830.55 c
./ft_ls -1t 2>&1 | grep -v result > result/r1 2>&1;
ls -1t 2>&1 | grep -v result > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1t with 'touch a b c d e && touch -t 201212101830.55 c'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1t with 'touch a b c d e && touch -t 201212101830.55 c'"$clear;
fi
rm -rf a b c d e

###2
touch -t 201312101830.55 a && touch -t 201212101830.55 b && touch -t 201412101830.55 c
./ft_ls -1t 2>&1 > result/r1 2>&1;
ls -1t 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1t with 'touch -t 201312101830.55 a && touch -t 201212101830.55 b && touch -t 201412101830.55 c'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1t with 'touch -t 201312101830.55 a && touch -t 201212101830.55 b && touch -t 201412101830.55 c'"$clear;
fi
rm -rf a b c

###3
touch fileA{1..5} fileB{1..5} fileC{1..5} && touch -t 200012101830.55 fileA{1..5}
./ft_ls -1t 2>&1 > result/r1 2>&1;
ls -1t 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1t with 'touch fileA{1..5} fileB{1..5} fileC{1..5} && touch -t 200012101830.55 fileA{1..5}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1t with 'touch fileA{1..5} fileB{1..5} fileC{1..5} && touch -t 200012101830.55 fileA{1..5}'"$clear;
fi
rm -rf fileA{1..5} fileB{1..5} fileC{1..5}

###4
touch -t 201312101830.55 a
touch -t 201212101830.55 b
touch -t 201412101830.55 c
touch -t 201411221830.55 d
touch -t 201405212033.55 e
touch -t 201409221830.55 f
touch -t 202007221830.55 g
touch -t 300012101830.55 h
./ft_ls -1t 2>&1 > result/r1 2>&1;
ls -1t 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1t with 'touch -t ... a b c d e f g h'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1t with 'touch -t ... a b c d e f g h'"$clear;
fi
rm -rf a b c d e f g h

###5
touch -t 200012101830.55 a
touch -t 201412101830.55 b
ln b d
ln -s c e
ln -s a f
touch -t 300012101830.55 c
./ft_ls -1t 2>&1 > result/r1 2>&1;
ls -1t 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1t with 'touch -t 200012101830.55 a | touch -t 201412101830.55 b | ln b d | ln -s c e | ln -s a f | touch -t 300012101830.55 c'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1t with 'touch -t 200012101830.55 a | touch -t 201412101830.55 b | ln b d | ln -s c e | ln -s a f | touch -t 300012101830.55 c'"$clear;
fi
rm -rf a b c d e f g h

###6
touch -t 201312101830.55 B
touch -t 201312101830.55 a
./ft_ls -1t 2>&1 > result/r1 2>&1;
ls -1t 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1t with 'touch -t 201312101830.55 B | touch -t 201312101830.55 a'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1t with 'touch -t 201312101830.55 B | touch -t 201312101830.55 a'"$clear;
fi
rm -rf B a

###7
touch C && touch -t 201212101830.55 c && mkdir -p sbox sbox1
touch -t 201312101830.55 B
touch -t 201312101830.55 a
./ft_ls -1t a C B sbox sbox1 2>&1 > result/r1 2>&1;
ls -1t a C B sbox sbox1 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1t a C B sbox sbox1 with 'touch C && touch -t 201212101830.55 c && mkdir -p sbox sbox1 | touch -t 201312101830.55 B | touch -t 201312101830.55 a'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1t a C B sbox sbox1 with 'touch C && touch -t 201212101830.55 c && mkdir -p sbox sbox1 | touch -t 201312101830.55 B | touch -t 201312101830.55 a'"$clear;
fi
rm -rf C c sbox sbox1 B a

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