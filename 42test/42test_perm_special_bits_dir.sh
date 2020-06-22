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
test_name="42_test_perm_special_bits_dir"
echo "=========================== "$test_name" ===========================\n";
###1
mkdir  dir1 && chmod 0777 dir1
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
	echo $red"Test "$nb_test": ls -l with 'mkdir  dir1 && chmod 0777 dir1'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'mkdir  dir1 && chmod 0777 dir1'"$clear;
fi

###2
mkdir  dir2 && chmod 1777 dir2
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
	echo $red"Test "$nb_test": ls -l with 'mkdir  dir2 && chmod 1777 dir2'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'mkdir  dir2 && chmod 1777 dir2'"$clear;
fi

###3
mkdir  dir3 && chmod 2777 dir3
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
	echo $red"Test "$nb_test": ls -l with 'mkdir  dir3 && chmod 2777 dir3'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'mkdir  dir3 && chmod 2777 dir3'"$clear;
fi

###4
mkdir  dir4 && chmod 3777 dir4
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
	echo $red"Test "$nb_test": ls -l with 'mkdir  dir4 && chmod 3777 dir4'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'mkdir  dir4 && chmod 3777 dir4'"$clear;
fi

###5
mkdir  dir5 && chmod 4777 dir5
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
	echo $red"Test "$nb_test": ls -l with 'mkdir  dir5 && chmod 4777 dir5'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'mkdir  dir5 && chmod 4777 dir5'"$clear;
fi

###6
mkdir  dir6 && chmod 5777 dir6
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
	echo $red"Test "$nb_test": ls -l with 'mkdir  dir6 && chmod 5777 dir6'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'mkdir  dir6 && chmod 5777 dir6'"$clear;
fi

###7
mkdir  dir7 && chmod 6777 dir7
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
	echo $red"Test "$nb_test": ls -l with 'mkdir  dir7 && chmod 6777 dir7'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'mkdir  dir7 && chmod 6777 dir7'"$clear;
fi

###8
mkdir  dir8 && chmod 7777 dir8
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
	echo $red"Test "$nb_test": ls -l with 'mkdir  dir8 && chmod 7777 dir8'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'mkdir  dir8 && chmod 7777 dir8'"$clear;
fi

###9
mkdir  dir9 && chmod 0000 dir9
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
	echo $red"Test "$nb_test": ls -l with 'mkdir  dir9 && chmod 0000 dir9'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'mkdir  dir9 && chmod 0000 dir9'"$clear;
fi

###10
mkdir  dir10 && chmod 1000 dir10
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
	echo $red"Test "$nb_test": ls -l with 'mkdir  dir10 && chmod 1000 dir10'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'mkdir  dir10 && chmod 1000 dir10'"$clear;
fi

###11
mkdir  dir11 && chmod 2000 dir11
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
	echo $red"Test "$nb_test": ls -l with 'mkdir  dir11 && chmod 2000 dir11'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'mkdir  dir11 && chmod 2000 dir11'"$clear;
fi

###12
mkdir  dir12 && chmod 3000 dir12
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
	echo $red"Test "$nb_test": ls -l with 'mkdir  dir12 && chmod 3000 dir12'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'mkdir  dir12 && chmod 3000 dir12'"$clear;
fi

###13
mkdir  dir13 && chmod 4000 dir13
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
	echo $red"Test "$nb_test": ls -l with 'mkdir  dir13 && chmod 4000 dir13'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'mkdir  dir13 && chmod 4000 dir13'"$clear;
fi

###14
mkdir  dir14 && chmod 5000 dir14
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
	echo $red"Test "$nb_test": ls -l with 'mkdir  dir14 && chmod 5000 dir14'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'mkdir  dir14 && chmod 5000 dir14'"$clear;
fi

###15
mkdir  dir15 && chmod 6000 dir15
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
	echo $red"Test "$nb_test": ls -l with 'mkdir  dir15 && chmod 6000 dir15'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'mkdir  dir15 && chmod 6000 dir15'"$clear;
fi

###16
mkdir  dir16 && chmod 7000 dir16
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
	echo $red"Test "$nb_test": ls -l with 'mkdir  dir16 && chmod 7000 dir16'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'mkdir  dir16 && chmod 7000 dir16'"$clear;
fi
rm -rf dir1 dir2 dir3 dir4 dir5 dir6 dir7 dir8 dir9 dir10 dir11 dir12 dir13 dir14 dir15 dir16


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