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
test_name="42_bonus_opt_p"
echo "=========================== "$test_name" ===========================\n";
###1
mkdir mydir mydir2 && touch mydir/{aaa,bbb,ccc} && touch mydir2/{111,222,333}
./ft_ls -1pR 2>&1 | grep -v result | grep -v r1 | grep -v r2 > result/r1 2>&1;
ls -1pR 2>&1 | grep -v result | grep -v r1 | grep -v r2 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1pR with 'mkdir mydir mydir2 && touch mydir/{aaa,bbb,ccc} && touch mydir2/{111,222,333}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1pR with 'mkdir mydir mydir2 && touch mydir/{aaa,bbb,ccc} && touch mydir2/{111,222,333}'"$clear;
fi
rm -rf mydir mydir2

###2
mkdir mydir{1..7} && touch mydir{1..7}/file{1..11}
./ft_ls -1pR 2>&1 > result/r1 2>&1;
ls -1pR  2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1pR with 'mkdir mydir{1..7} && touch mydir{1..7}/file{1..11}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1pR with 'mkdir mydir{1..7} && touch mydir{1..7}/file{1..11}'"$clear;
fi
rm -rf mydir{1..7}

###3
./ft_ls -lp /usr 2>&1 > result/r1 2>&1;
ls -lp /usr 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -lp /usr with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -lp /usr with ''"$clear;
fi

###4
./ft_ls -lp /bin 2>&1 > result/r1 2>&1;
ls -lp /bin 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -lp /bin with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -lp /bin with ''"$clear;
fi

<<'comment'
###4
./ft_ls -lp /usr/bin 2>&1 | grep -v c++filt | grep -v clang-6.0 | grep -v g3topbm > result/r1 2>&1;
ls -lp /usr/bin 2>&1 | grep -v c++filt | grep -v clang-6.0 | grep -v g3topbm > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -lp /usr/bin with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -lp /usr/bin with ''"$clear;
fi

###5
mkdir mydir mydir2 && touch mydir/file{10..20} && touch mydir2/file{30..40}
./ft_ls -1p /usr/bin 2>&1 | grep -v c++filt | grep -v clang-6.0 | grep -v g3topbm > result/r1 2>&1;
ls -1p /usr/bin 2>&1 | grep -v c++filt | grep -v clang-6.0 | grep -v g3topbm > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1p /usr/bin with 'mkdir mydir mydir2 && touch mydir/file{10..20} && touch mydir2/file{30..40}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1p /usr/bin with 'mkdir mydir mydir2 && touch mydir/file{10..20} && touch mydir2/file{30..40}'"$clear;
fi
rm -rf mydir mydir2
comment

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