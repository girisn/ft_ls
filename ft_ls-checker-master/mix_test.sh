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

if [ -z $1 ]
then
	echo "ft_ls executable is missing"
	echo "Usage: ./basic_test.sh path/to/ft_ls [p]"
	exit 1;
fi

cp $1 ./;

mkdir -p result;
echo "=========================== mix tests ===========================\n";
<<'comment'
./ft_ls -lR /usr/bin 2>&1 | grep -v "ls:" | grep -v "treereg" > result/r1 2>&1;
ls -lR /usr/bin 2>&1 | grep -v "ls:" | grep -v "treereg" > result/r2 2>&1;
diff result/r1 result/r2 > result/r3;
	((nb_test+=1))
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
	echo $red"Test "$nb_test": [ft_ls -lR /usr/bin]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -lR /usr/bin]"$pos$pos$tick$clear;
fi
comment

./ft_ls -lt /usr > result/r1 2>&1;
ls -lt /usr > result/r2 2>&1;
diff result/r1 result/r2 > result/r3;
	((nb_test+=1))
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
	echo $red"Test "$nb_test": [ft_ls -lt /usr]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -lt /usr]"$pos$pos$tick$clear;
fi

mkdir tests;
touch tests/files{0..1000};
./ft_ls -l tests > result/r1 2>&1;
ls -l tests > result/r2 2>&1;
diff result/r1 result/r2 > result/r3;
	((nb_test+=1))
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
	echo $red"Test "$nb_test": [ft_ls -l] with many files"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -l] with many files"$pos$pos$tick$clear;
fi
rm -rf tests;

./ft_ls -l /var/ | grep -v "@" > result/r1 2>&1;
ls -l /var/ | grep -v "@" > result/r2 2>&1;
diff result/r1 result/r2 > result/r3;
	((nb_test+=1))
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
	echo $red"Test "$nb_test": [ft_ls -l /var/run/]"$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": [ft_ls -l /var/run/]"$pos$pos$tick$clear;
fi
rm -rf tests/file*;
rm -rf tests;

mkdir -p level1/level2/level3/level4;
touch level1/level2/file{1..5};
./ft_ls -1 level1/../level1/level2/././level3/level4/./../../ > result/r1 2>&1;
ls -1 level1/../level1/level2/././level3/level4/./../../ > result/r2 2>&1;
diff result/r1 result/r2 > result/r3;
	((nb_test+=1))
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
	echo $red"Test "$nb_test": Path with ./ and ../ "$pos$cross$clear;
else
	((success+=1));
	echo $green"Test "$nb_test": Path with ./ and ../ "$pos$pos$tick$clear;
fi
rm -rf level1;
rm -rf tests;

printf $Byellow"\nEnd of mix tests\n"$clear;
if [ $success -eq $nb_test ]
then
	echo $green"Congratulation ! You passed all the tests."$clear;
else
	printf $cyan"%d test succeed, " "$success";
	((success=$nb_test-$success));
	printf "%d test failed\n"$clear "$success";
fi
rm -rf result;
