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
test_name="42_test_hyphen_harder"
echo "=========================== "$test_name" ===========================\n";
###1
touch -- - -- ---
./ft_ls -1 -- -- -- 2>&1 > result/r1 2>&1;
ls -1 -- -- -- 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- -- -- with 'touch -- - -- ---'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- -- -- with 'touch -- - -- ---'"$clear;
fi

###2
./ft_ls -1 - - - 2>&1 > result/r1 2>&1;
ls -1 - - - 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 - - - with 'touch -- - -- ---'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 - - - with 'touch -- - -- ---'"$clear;
fi

###3
./ft_ls -1 -- - -- --- 2>&1 > result/r1 2>&1;
ls -1 -- - -- --- 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- - -- --- with 'touch -- - -- ---'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- - -- --- with 'touch -- - -- ---'"$clear;
fi

###4
./ft_ls -1 - -- --- 2>&1 > result/r1 2>&1;
ls -1 - -- --- 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 - -- --- with 'touch -- - -- ---'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 - -- --- with 'touch -- - -- ---'"$clear;
fi

###5
./ft_ls -1 -- - --- 2>&1 > result/r1 2>&1;
ls -1 -- - --- 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- - --- with 'touch -- - -- ---'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- - --- with 'touch -- - -- ---'"$clear;
fi

###5
./ft_ls -1 -- - --- 2>&1 > result/r1 2>&1;
ls -1 -- - --- 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- - --- with 'touch -- - -- ---'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- - --- with 'touch -- - -- ---'"$clear;
fi
rm -rf - -- --- --

###6
mkdir -- - -- ---
./ft_ls -1 -- -- -- 2>&1 > result/r1 2>&1;
ls -1 -- -- -- 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- -- -- with 'mkdir -- - -- ---'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- -- -- with 'mkdir -- - -- ---'"$clear;
fi

###7
./ft_ls -1 - - - 2>&1 > result/r1 2>&1;
ls -1 - - - 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 - - - with 'mkdir -- - -- ---'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 - - - with 'mkdir -- - -- ---'"$clear;
fi

###8
./ft_ls -1 -- - -- --- 2>&1 > result/r1 2>&1;
ls -1 -- - -- --- 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- - -- --- with 'mkdir -- - -- ---'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- - -- --- with 'mkdir -- - -- ---'"$clear;
fi

###9
./ft_ls -1 - -- --- 2>&1 > result/r1 2>&1;
ls -1 - -- --- 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 - -- --- with 'mkdir -- - -- ---'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 - -- --- with 'mkdir -- - -- ---'"$clear;
fi

###10
./ft_ls -1 -- - --- 2>&1 > result/r1 2>&1;
ls -1 -- - --- 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- - --- with 'mkdir -- - -- ---'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- - --- with 'mkdir -- - -- ---'"$clear;
fi
rm -rf - -- --- --



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