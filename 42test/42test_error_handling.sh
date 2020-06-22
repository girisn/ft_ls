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
test_name="42_test_error_handling"
echo "=========================== "$test_name" ===========================\n";
###1
./ft_ls -1 does_not_exist 2>&1 > result/r1 2>&1;
ls -1 does_not_exist 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 does_not_exist with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 does_not_exist with ''"$clear;
fi

###2
mkdir -p not_allowed_file
chmod 000 not_allowed_file
./ft_ls -1 not_allowed_file 2>&1 > result/r1 2>&1;
ls -1 not_allowed_file 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 not_allowed_file with 'mkdir -p not_allowed_file | chmod 000 not_allowed_file'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 not_allowed_file with 'mkdir -p not_allowed_file | chmod 000 not_allowed_file'"$clear;
fi
rm -rf not_allowed_file

###3
./ft_ls -W_this_option_does_not_exist 2>&1 > result/r1 2>&1;
ls -W_this_option_does_not_exist 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -Z_this_option_does_not_exist with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -Z_this_option_does_not_exist with ''"$clear;
fi

###4
./ft_ls -la--t 2>&1 > result/r1 2>&1;
ls -la--t 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -la--t with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -la--t with ''"$clear;
fi

<<comment
###5
./ft_ls --a 2>&1 > result/r1 2>&1;
ls --a 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls --a with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls --a with ''"$clear;
fi
comment

###6
./ft_ls \"\" 2>&1 > result/r1 2>&1;
ls \"\" 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls \"\" with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls \"\" with ''"$clear;
fi

###7
./ft_ls '' 2>&1 > result/r1 2>&1;
ls '' 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls '' with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls '' with ''"$clear;
fi

###8
touch a b
./ft_ls a '' b 2>&1 > result/r1 2>&1;
ls a '' b 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls a '' b with 'touch a b'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls a '' b with 'touch a b'"$clear;
fi
rm -rf a b

###9
./ft_ls -lWYX243 2>&1 > result/r1 2>&1;
ls -lWYX243 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -lZWYX243 with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -lZWYX243 with ''"$clear;
fi

###10
./ft_ls a b 2>&1 > result/r1 2>&1;
ls a b 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls a b with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls a b with ''"$clear;
fi

###11
mkdir b
./ft_ls -1 a b 2>&1 > result/r1 2>&1;
ls -1 a b 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 a b with 'mkdir b'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 a b with 'mkdir b'"$clear;
fi
rm -rf b

###12
mkdir adir zdir
touch afile zfile
ln -s adir asymdir
ln -s adir zsymdir
ln -s afile asymfile
ln -s afile zsymfile
./ft_ls -1 adir zdir aNotExist zNotExistB afile zfile asymdir zsymdir asymfile zsymfile 2>&1 > result/r1 2>&1;
ls -1 adir zdir aNotExist zNotExistB afile zfile asymdir zsymdir asymfile zsymfile 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 adir zdir aNotExist zNotExistB afile zfile asymdir zsymdir asymfile zsymfile with 'mkdir adir zdir | touch afile zfile | ln -s adir asymdir | ln -s adir zsymdir | ln -s afile asymfile | ln -s afile zsymfile'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 adir zdir aNotExist zNotExistB afile zfile asymdir zsymdir asymfile zsymfile with 'mkdir adir zdir | touch afile zfile | ln -s adir asymdir | ln -s adir zsymdir | ln -s afile asymfile | ln -s afile zsymfile'"$clear;
fi
rm -rf adir zdir afile zfile asymdir zsymdir asymfile zsymfile

###13
touch K j l
./ft_ls -1r a c b l K j 2>&1 > result/r1 2>&1;
ls -1r a c b l K j 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1r a c b l K j with 'touch K j l'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1r a c b l K j with 'touch K j l'"$clear;
fi
rm -rf K j l

###14
./ft_ls -1 \"\" 2>&1 > result/r1 2>&1;
ls -1 \"\" 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 \"\" with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 \"\" with ''"$clear;
fi

###15
./ft_ls -l \\\"\\\" 2>&1 > result/r1 2>&1;
ls -l \\\"\\\" 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -l \\\"\\\" with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l \\\"\\\" with ''"$clear;
fi

###16
./ft_ls -l '' 2>&1 > result/r1 2>&1;
ls -l '' 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -l '' with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l '' with ''"$clear;
fi

###17
./ft_ls -l \"\" -R 2>&1 > result/r1 2>&1;
ls -l \"\" -R 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -l \"\" -R with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l \"\" -R with ''"$clear;
fi

###18
<<'tupit'
./ft_ls -lR . \"\" . 2>&1 | grep -v "r1" | grep -v "r2" | grep -v total > result/r1 2>&1;
ls -lR . \"\" . 2>&1 | grep -v "r1" | grep -v "r2" | grep -v total > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -lR . \"\" . with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -lR . \"\" . with ''"$clear;
fi
tupit

###19
./ft_ls -~ \"\" 2>&1 > result/r1 2>&1;
ls -~ \"\" 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -~ \"\" with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -~ \"\" with ''"$clear;
fi

###20
./ft_ls \"\" -~ 2>&1 > result/r1 2>&1;
ls \"\" -~ 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls \"\" -~ with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls \"\" -~ with ''"$clear;
fi

###21
./ft_ls aa \"\" bb 2>&1 > result/r1 2>&1;
ls aa \"\" bb 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls aa \"\" bb with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls aa \"\" bb with ''"$clear;
fi

###22
./ft_ls \"\" aa bb 2>&1 > result/r1 2>&1;
ls \"\" aa bb 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls \"\" aa bb with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls \"\" aa bb with ''"$clear;
fi

###23
./ft_ls aa bb \"\" 2>&1 > result/r1 2>&1;
ls aa bb \"\" 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls aa bb \"\" with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls aa bb \"\" with ''"$clear;
fi

###24
./ft_ls a \"\" b 2>&1 > result/r1 2>&1;
ls a \"\" b 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls a \"\" b with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls a \"\" b with ''"$clear;
fi

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
