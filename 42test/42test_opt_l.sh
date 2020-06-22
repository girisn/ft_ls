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
test_name="42_test_opt_l"
echo "=========================== "$test_name" ===========================\n";
###1
touch a b c
./ft_ls -l 2>&1 > result/r1 2>&1;
ls -l 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -l with 'touch a b c'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch a b c'"$clear;
fi
rm -rf a b c

###2
touch a b c && echo 'coucou' > a &&  echo 'hello world' > b
./ft_ls -l 2>&1 > result/r1 2>&1;
ls -l 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -l with 'touch a b c && echo 'coucou' > a &&  echo 'hello world' > b'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch a b c && echo 'coucou' > a &&  echo 'hello world' > b'"$clear;
fi
rm -rf a b c

###3
touch a b c && echo 'coucou' > a &&  echo 'hello world' > b
mkdir 111 222 333 444 && touch 111/{a,b,c} && echo 'eat pizza' > 111/a
./ft_ls -l 2>&1 > result/r1 2>&1;
ls -l 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -l with 'touch a b c && echo 'coucou' > a &&  echo 'hello world' > b | mkdir 111 222 333 444 && touch 111/{a,b,c} && echo 'eat pizza' > 111/a'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch a b c && echo 'coucou' > a &&  echo 'hello world' > b | mkdir 111 222 333 444 && touch 111/{a,b,c} && echo 'eat pizza' > 111/a'"$clear;
fi
rm -rf a b c 111 222 333 444

###4
<<'comment'
touch .a
dd bs=2 count=14450 if=/dev/random of=.a  >/dev/null 2>&1
ln -s .a b
./ft_ls -l 2>&1 > result/r1 2>&1;
ls -l 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -l with 'touch .a | dd bs=2 count=14450 if=/dev/random of=.a  >/dev/null 2>&1 | ln -s .a b' > 111/a'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch .a | dd bs=2 count=14450 if=/dev/random of=.a  >/dev/null 2>&1 | ln -s .a b'"$clear;
fi
rm -rf .a b
comment

###5
mkdir -p dir/.hdir
touch dir/.hdir/file
./ft_ls -la dir 2>&1 > result/r1 2>&1;
ls -la dir 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -la dir with 'mkdir -p dir/.hdir | touch dir/.hdir/file'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -la dir with 'mkdir -p dir/.hdir | touch dir/.hdir/file'"$clear;
fi
rm -rf dir

###6
mkdir -p dir
touch dir/.file
touch dir/visible
ln dir/.file sym0
ln dir/.file sym1
ln dir/.file sym2
ln dir/.file sym3
ln dir/.file sym4
ln dir/.file sym5
ln dir/.file sym6
ln dir/.file sym7
ln dir/.file sym8
ln dir/.file sym9
ln dir/.file sym10
./ft_ls -l 2>&1 > result/r1 2>&1;
ls -l 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -l with 'mkdir -p dir | touch dir/.file touch dir/visible | ln dir/.file sym{0..10}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'mkdir -p dir | touch dir/.file touch dir/visible | ln dir/.file sym{0..10}'"$clear;
fi
rm -rf dir sym0 sym1 sym2 sym3 sym4 sym5 sym6 sym7 sym8 sym9 sym10

###7
touch -t 999912312459 future
./ft_ls -lt 2>&1 > result/r1 2>&1;
ls -lt 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -lt with 'touch -t 999912312459 future'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -lt with 'touch -t 999912312459 future'"$clear;
fi
rm -rf future




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