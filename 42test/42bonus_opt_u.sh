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
test_name="42_bonus_opt_u"
echo "=========================== "$test_name" ===========================\n";
###1
touch a b c d e && touch -at 201212101830.55 c
./ft_ls -1tu 2>&1 > result/r1 2>&1;
ls -1tu 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1tu with 'touch a b c d e && touch -at 201212101830.55 c'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1tu with 'touch a b c d e && touch -at 201212101830.55 c'"$clear;
fi

###2
./ft_ls -1tur 2>&1 > result/r1 2>&1;
ls -1tur 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1tur with 'touch a b c d e && touch -at 201212101830.55 c'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1tur with 'touch a b c d e && touch -at 201212101830.55 c'"$clear;
fi

###3
./ft_ls -1lu 2>&1 > result/r1 2>&1;
ls -1lu 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1lu with 'touch a b c d e && touch -at 201212101830.55 c'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1lu with 'touch a b c d e && touch -at 201212101830.55 c'"$clear;
fi

###4
./ft_ls -1tlu 2>&1 | grep -v result > result/r1 2>&1;
ls -1tlu 2>&1 | grep -v result > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1tlu with 'touch a b c d e && touch -at 201212101830.55 c'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1tlu with 'touch a b c d e && touch -at 201212101830.55 c'"$clear;
fi

<<'comment'
###5
./ft_ls -1tSu 2>&1 > result/r1 2>&1;
ls -1tSu 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1tSu with 'touch a b c d e && touch -at 201212101830.55 c'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1tSu with 'touch a b c d e && touch -at 201212101830.55 c'"$clear;
fi

###6
./ft_ls -1utS 2>&1 > result/r1 2>&1;
ls -1utS 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1utS with 'touch a b c d e && touch -at 201212101830.55 c'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1utS with 'touch a b c d e && touch -at 201212101830.55 c'"$clear;
fi
comment


###7
touch -at 201312101830.55 a && touch -at 201212101830.55 b && touch -at 201412101830.55 c
./ft_ls -1tu 2>&1 > result/r1 2>&1;
ls -1tu 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1tu with 'touch -at 201312101830.55 a && touch -at 201212101830.55 b && touch -at 201412101830.55 c'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1tu with 'touch -at 201312101830.55 a && touch -at 201212101830.55 b && touch -at 201412101830.55 c'"$clear;
fi

###8
./ft_ls -1tur 2>&1 > result/r1 2>&1;
ls -1tur 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1tur with 'touch -at 201312101830.55 a && touch -at 201212101830.55 b && touch -at 201412101830.55 c'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1tur with 'touch -at 201312101830.55 a && touch -at 201212101830.55 b && touch -at 201412101830.55 c'"$clear;
fi

###9
./ft_ls -1lu 2>&1 > result/r1 2>&1;
ls -1lu 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1lu with 'touch -at 201312101830.55 a && touch -at 201212101830.55 b && touch -at 201412101830.55 c'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1lu with 'touch -at 201312101830.55 a && touch -at 201212101830.55 b && touch -at 201412101830.55 c'"$clear;
fi

###10
./ft_ls -1tlu 2>&1 | grep -v result > result/r1 2>&1;
ls -1tlu 2>&1 | grep -v result > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1tlu with 'touch -at 201312101830.55 a && touch -at 201212101830.55 b && touch -at 201412101830.55 c'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1tlu with 'touch -at 201312101830.55 a && touch -at 201212101830.55 b && touch -at 201412101830.55 c'"$clear;
fi
rm -rf a b c d e


###11
touch fileA{1..5} fileB{1..5} fileC{1..5} && touch -at 200012101830.55 fileA{1..5}
./ft_ls -1tu 2>&1 > result/r1 2>&1;
ls -1tu 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1tu with 'touch fileA{1..5} fileB{1..5} fileC{1..5} && touch -at 200012101830.55 fileA{1..5}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1tu with 'touch fileA{1..5} fileB{1..5} fileC{1..5} && touch -at 200012101830.55 fileA{1..5}'"$clear;
fi

###12
./ft_ls -1tur 2>&1 > result/r1 2>&1;
ls -1tur 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1tur with 'touch fileA{1..5} fileB{1..5} fileC{1..5} && touch -at 200012101830.55 fileA{1..5}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1tur with 'touch fileA{1..5} fileB{1..5} fileC{1..5} && touch -at 200012101830.55 fileA{1..5}'"$clear;
fi

###13
./ft_ls -1lu 2>&1 > result/r1 2>&1;
ls -1lu 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1lu with 'touch fileA{1..5} fileB{1..5} fileC{1..5} && touch -at 200012101830.55 fileA{1..5}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1lu with 'touch fileA{1..5} fileB{1..5} fileC{1..5} && touch -at 200012101830.55 fileA{1..5}'"$clear;
fi

###14
./ft_ls -1tlu 2>&1 > result/r1 2>&1;
ls -1tlu 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1tlu with 'touch fileA{1..5} fileB{1..5} fileC{1..5} && touch -at 200012101830.55 fileA{1..5}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1tlu with 'touch fileA{1..5} fileB{1..5} fileC{1..5} && touch -at 200012101830.55 fileA{1..5}'"$clear;
fi
rm -rf fileA{1..5} fileB{1..5} fileC{1..5}

###15
touch -at 201312101830.55 a
touch -at 201212101830.55 b
touch -at 201412101830.55 c
touch -at 201411221830.55 d
touch -at 201405212033.55 e
touch -at 201409221830.55 f
touch -at 202007221830.55 g
touch -at 300012101830.55 h
./ft_ls -1tu 2>&1 > result/r1 2>&1;
ls -1tu 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1tu with many files at other a_time"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1tu with many files at other a_time"$clear;
fi

###16
./ft_ls -1tur 2>&1 > result/r1 2>&1;
ls -1tur 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1tur with many files at other a_time"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1tur with many files at other a_time"$clear;
fi

###17
./ft_ls -1lu 2>&1 > result/r1 2>&1;
ls -1lu 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1lu with many files at other a_time"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1lu with many files at other a_time"$clear;
fi

###18
./ft_ls -1tlu 2>&1 > result/r1 2>&1;
ls -1tlu 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1tlu with many files at other a_time"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1tlu with many files at other a_time"$clear;
fi
rm -rf a b c d e f g h


###19
touch a b c && touch -at 200012101830.55 a
touch -at 201412101830.55 b
ln b d
ln -s c e
ln -s a f
touch -at 300012101830.55 c
./ft_ls -1tu 2>&1 > result/r1 2>&1;
ls -1tu 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1tu with many files and links at other a_time"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1tu with many files and links at other a_time"$clear;
fi

###20
./ft_ls -1tur 2>&1 > result/r1 2>&1;
ls -1tur 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1tur with many files and links at other a_time"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1tur with many files and links at other a_time"$clear;
fi

###21
./ft_ls -1lu 2>&1 > result/r1 2>&1;
ls -1lu 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1lu with many files and links at other a_time"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1lu with many files and links at other a_time"$clear;
fi

###22
./ft_ls -1tlu 2>&1 > result/r1 2>&1;
ls -1tlu 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1tlu with many files and links at other a_time"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1tlu with many files and links at other a_time"$clear;
fi
rm -rf a b c d e f


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
