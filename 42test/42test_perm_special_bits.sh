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
test_name="42_test_perm_special_bits"
echo "=========================== "$test_name" ===========================\n";
###1
touch file1 && chmod 0777 file1
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
	echo $red"Test "$nb_test": ls -l with 'touch file1 && chmod 0777 file1'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch file1 && chmod 0777 file1'"$clear;
fi

###2
touch file2 && chmod 1777 file2
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
	echo $red"Test "$nb_test": ls -l with 'touch file2 && chmod 1777 file2'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch file2 && chmod 1777 file2'"$clear;
fi

###3
touch file3 && chmod 2777 file3
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
	echo $red"Test "$nb_test": ls -l with 'touch file3 && chmod 2777 file3'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch file3 && chmod 2777 file3'"$clear;
fi

###4
touch file4 && chmod 3777 file4
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
	echo $red"Test "$nb_test": ls -l with 'touch file4 && chmod 3777 file4'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch file4 && chmod 3777 file4'"$clear;
fi

###5
touch file5 && chmod 4777 file5
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
	echo $red"Test "$nb_test": ls -l with 'touch file5 && chmod 4777 file5'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch file5 && chmod 4777 file5'"$clear;
fi

###6
touch file6 && chmod 5777 file6
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
	echo $red"Test "$nb_test": ls -l with 'touch file6 && chmod 5777 file6'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch file6 && chmod 5777 file6'"$clear;
fi

###7
touch file7 && chmod 6777 file7
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
	echo $red"Test "$nb_test": ls -l with 'touch file7 && chmod 6777 file7'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch file7 && chmod 6777 file7'"$clear;
fi

###8
touch file8 && chmod 7777 file8
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
	echo $red"Test "$nb_test": ls -l with 'touch file8 && chmod 7777 file8'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch file8 && chmod 7777 file8'"$clear;
fi

###9
touch file9 && chmod 0000 file9
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
	echo $red"Test "$nb_test": ls -l with 'touch file9 && chmod 0000 file9'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch file9 && chmod 0000 file9'"$clear;
fi

###10
touch file10 && chmod 1000 file10
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
	echo $red"Test "$nb_test": ls -l with 'touch file10 && chmod 1000 file10'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch file10 && chmod 1000 file10'"$clear;
fi

###11
touch file11 && chmod 2000 file11
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
	echo $red"Test "$nb_test": ls -l with 'touch file11 && chmod 2000 file11'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch file11 && chmod 2000 file11'"$clear;
fi

###12
touch file12 && chmod 3000 file12
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
	echo $red"Test "$nb_test": ls -l with 'touch file12 && chmod 3000 file12'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch file12 && chmod 3000 file12'"$clear;
fi

###13
touch file13 && chmod 4000 file13
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
	echo $red"Test "$nb_test": ls -l with 'touch file13 && chmod 4000 file13'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch file13 && chmod 4000 file13'"$clear;
fi

###14
touch file14 && chmod 5000 file14
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
	echo $red"Test "$nb_test": ls -l with 'touch file14 && chmod 5000 file14'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch file14 && chmod 5000 file14'"$clear;
fi

###15
touch file15 && chmod 6000 file15
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
	echo $red"Test "$nb_test": ls -l with 'touch file15 && chmod 6000 file15'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch file15 && chmod 6000 file15'"$clear;
fi

###16
touch file16 && chmod 7000 file16
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
	echo $red"Test "$nb_test": ls -l with 'touch file16 && chmod 7000 file16'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch file16 && chmod 7000 file16'"$clear;
fi
rm -rf file1 file2 file3 file4 file5 file6 file7 file8 file9 file10 file11 file12 file13 file14 file15 file16



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