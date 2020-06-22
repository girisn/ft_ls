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
test_name="42_test_hyphen_hard"
echo "=========================== "$test_name" ===========================\n";
###1.1
touch - file
./ft_ls -1 2>&1 > result/r1 2>&1;
ls -1 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 with 'touch - file'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 with 'touch - file'"$clear;
fi
rm -rf file

###1.2
touch - file
./ft_ls -1 - 2>&1 > result/r1 2>&1;
ls -1 - 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 - with 'touch - file'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 - with 'touch - file'"$clear;
fi
rm -rf file

###1.3
touch - file
./ft_ls -1 -- 2>&1 > result/r1 2>&1;
ls -1 -- 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- with 'touch - file'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- with 'touch - file'"$clear;
fi
rm -rf file

###2
touch -
./ft_ls -1 -- - 2>&1 > result/r1 2>&1;
ls -1 -- - 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- - with 'touch -'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- - with 'touch -'"$clear;
fi

###3.1
touch - -- ---
./ft_ls -1 -- -- 2>&1 > result/r1 2>&1;
ls -1 -- -- 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- -- with 'touch - -- ---'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- -- with 'touch - -- ---'"$clear;
fi
rm -rf -- ---

###3.2
touch - -- ---
./ft_ls -1 -- --- 2>&1 > result/r1 2>&1;
ls -1 -- --- 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- --- with 'touch - -- ---'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- --- with 'touch - -- ---'"$clear;
fi
rm -rf -- ---

###3.3
touch - -- ---
./ft_ls -1 -- . 2>&1 > result/r1 2>&1;
ls -1 -- . 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- . with 'touch - -- ---'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- . with 'touch - -- ---'"$clear;
fi
rm -rf -- ---

###4.1
mkdir -- -file --file ---file
./ft_ls -1 -- -file 2>&1 > result/r1 2>&1;
ls -1 -- -file 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- -file with 'mkdir -- -file --file ---file'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- -file with 'mkdir -- -file --file ---file'"$clear;
fi
rm -rf -- -file --file ---file

###4.2
mkdir -- -file --file ---file
./ft_ls -1 -- --file 2>&1 > result/r1 2>&1;
ls -1 -- --file 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- --file with 'mkdir -- -file --file ---file'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- --file with 'mkdir -- -file --file ---file'"$clear;
fi
rm -rf -- -file --file ---file

###4.1
mkdir -- -file --file ---file
./ft_ls -1 -- ---file 2>&1 > result/r1 2>&1;
ls -1 -- ---file 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- ---file with 'mkdir -- -file --file ---file'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- ---file with 'mkdir -- -file --file ---file'"$clear;
fi
rm -rf -- -file --file ---file

###5.1
mkdir -
./ft_ls -1 2>&1 > result/r1 2>&1;
ls -1 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 with 'mkdir -'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 with 'mkdir -'"$clear;
fi
rm -rf -

###5.2
mkdir -
./ft_ls -1 - 2>&1 > result/r1 2>&1;
ls -1 - 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 - with 'mkdir -'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 - with 'mkdir -'"$clear;
fi
rm -rf -

###6
mkdir -
./ft_ls -1 -- - 2>&1 > result/r1 2>&1;
ls -1 -- - 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- - with 'mkdir -'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- - with 'mkdir -'"$clear;
fi
rm -rf -

###7.1
mkdir - -- ---
./ft_ls -1 -- -- 2>&1 > result/r1 2>&1;
ls -1 -- -- 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- -- with 'mkdir - -- ---'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- -- with 'mkdir - -- ---'"$clear;
fi
rm -rf - -- ---

###7.2
mkdir - -- ---
./ft_ls -1 -- --- 2>&1 > result/r1 2>&1;
ls -1 -- --- 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- --- with 'mkdir - -- ---'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- --- with 'mkdir - -- ---'"$clear;
fi
rm -rf - -- ---

###7.3
mkdir - -- ---
./ft_ls -1 -- . 2>&1 > result/r1 2>&1;
ls -1 -- . 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- . with 'mkdir - -- ---'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- . with 'mkdir - -- ---'"$clear;
fi
rm -rf - -- ---

###8.1
mkdir -- -dir --dir ---dir
./ft_ls -1 -- -dir 2>&1 > result/r1 2>&1;
ls -1 -- -dir 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- -dir with 'mkdir -- -dir --dir ---dir'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- -dir with 'mkdir -- -dir --dir ---dir'"$clear;
fi
rm -rf -- -dir --dir ---dir

###8.2
mkdir -- -dir --dir ---dir
./ft_ls -1 -- --dir 2>&1 > result/r1 2>&1;
ls -1 -- --dir 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- --dir with 'mkdir -- -dir --dir ---dir'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- --dir with 'mkdir -- -dir --dir ---dir'"$clear;
fi
rm -rf -- -dir --dir ---dir

###8
mkdir -- -dir --dir ---dir
./ft_ls -1 -- ---dir 2>&1 > result/r1 2>&1;
ls -1 -- ---dir 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- ---dir with 'mkdir -- -dir --dir ---dir'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- ---dir with 'mkdir -- -dir --dir ---dir'"$clear;
fi
rm -rf -- -dir --dir ---dir




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