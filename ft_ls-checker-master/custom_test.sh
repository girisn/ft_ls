#!/bin/sh

### All of this is needed, but you can change colors or add variable if you wish to
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

### Creation of the directory that will contain the output of the commands
mkdir -p result;
### Edit the test name below
test_name="42_test_without_opt"
echo "=========================== "$test_name" ===========================\n";
###1
touch aaa bbb ccc
./ft_ls -1 > result/r1 2>&1;
ls -1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 with 'touch aaa bbb ccc'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 with 'touch aaa bbb ccc'"$clear;
fi
rm aaa bbb ccc
###2
touch - file
./ft_ls -1 > result/r1 2>&1;
ls -1 > result/r2 2>&1;
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
rm file
###3
mkdir - dir
./ft_ls -1 > result/r1 2>&1;
ls -1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 with 'mkdir - dir'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 with 'mkdir - dir'"$clear;
fi
rm -rf - dir
###4
mkdir - dir
./ft_ls -1 -- - dir > result/r1 2>&1;
ls -1 -- - dir > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 -- - dir with 'mkdir - dir'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 -- - dir with 'mkdir - dir'"$clear;
fi
rm -rf - dir


nb_test=0;
test_name="42_test_opt_R"
echo "=========================== "$test_name" ===========================\n";
###1
mkdir -p level1_{1..2}/level2_{1..2}/level3_{1..2}
./ft_ls -1R > result/r1 2>&1;
ls -1R > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1R with 'mkdir -p level1_{1..2}/level2_{1..2}/level3_{1..2}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1R with 'mkdir -p level1_{1..2}/level2_{1..2}/level3_{1..2}'"$clear;
fi
rm -rf level1*

###2
mkdir -p level1_{1..3}/level2_{6..8}/level3_{11..13}
./ft_ls -1R > result/r1 2>&1;
ls -1R > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1R with 'mkdir -p level1_{1..3}/level2_{6..8}/level3_{11..13}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1R with 'mkdir -p level1_{1..3}/level2_{6..8}/level3_{11..13}'"$clear;
fi
rm -rf level*

###3
mkdir -p .a .b .c && mkdir -p a b c 
./ft_ls -1R > result/r1 2>&1;
ls -1R > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 with 'mkdir -p .a .b .c && mkdir -p a b c '"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 with 'mkdir -p .a .b .c && mkdir -p a b c '"$clear;
fi
rm -rf .a .b .c a b c

###4
mkdir a b c
chmod 000 b
./ft_ls -1R 2>&1 | grep -v denied > result/r1 2>&1;
ls -1R 2>&1 | grep -v denied > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1R 2>&1 | grep -v denied with 'mkdir a b c | chmod 000 b'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1R 2>&1 | grep -v denied with 'mkdir a b c | chmod 000 b'"$clear;
fi
rm -rf a b c

###5
./ft_ls -1R 2>&1 | grep denied | wc -l | tr -d ' ' | tr -d '\n' > result/r1 2>&1;
ls -1R 2>&1 | grep denied | wc -l | tr -d ' ' | tr -d '\n' > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1R 2>&1 | grep denied | wc -l | tr -d ' ' | tr -d '\n' 2>&1 | grep -v denied with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1R 2>&1 | grep denied | wc -l | tr -d ' ' | tr -d '\n' 2>&1 | grep -v denied with ''"$clear;
fi

###6
mkdir A;
touch A/file;
./ft_ls -1R A a 2>&1 > result/r1 2>&1;
ls -1R A a 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1R A a with 'mkdir A | touch A/file'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1R A a with 'mkdir A | touch A/file'"$clear;
fi
rm -rf A


nb_test=0;
test_name="42_test_sorted"
echo "=========================== "$test_name" ===========================\n";
###1
touch a b c AA BB CC
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
	echo $red"Test "$nb_test": ls -1 with 'touch a b c AA BB CC'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 with 'touch a b c AA BB CC'"$clear;
fi
rm -rf a b c AA BB CC

###2
mkdir -p a b c AA BB CC
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
	echo $red"Test "$nb_test": ls -1 with 'mkdir -p a b c AA BB CC'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 with 'mkdir -p a b c AA BB CC'"$clear;
fi
rm -rf a b c AA BB CC

###3
mkdir -p da db dc dAA dBB dCC && touch fa fb fc fAA fBB fCC
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
	echo $red"Test "$nb_test": ls -1 with 'mkdir -p da db dc dAA dBB dCC && touch fa fb fc fAA fBB fCC'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 with 'mkdir -p da db dc dAA dBB dCC && touch fa fb fc fAA fBB fCC'"$clear;
fi
rm -rf da db dc dAA dBB dCC fa fb fc fAA fBB fCC


nb_test=0;
test_name="42_test_multiple_dir"
echo "=========================== "$test_name" ===========================\n";
###1
mkdir mydir mydir2 && touch mydir/{aaa,bbb,ccc} && touch mydir2/{111,222,333}
./ft_ls -1 mydir mydir2 2>&1 > result/r1 2>&1;
ls -1 mydir mydir2 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 mydir mydir2 with 'mkdir mydir mydir2 && touch mydir/{aaa,bbb,ccc} && touch mydir2/{111,222,333}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 mydir mydir2 with 'mkdir mydir mydir2 && touch mydir/{aaa,bbb,ccc} && touch mydir2/{111,222,333}'"$clear;
fi
rm -rf mydir mydir2

###2
mkdir mydir mydir2 && touch mydir/file{10..20} && touch mydir2/file{30..40}
./ft_ls -1 mydir mydir2 2>&1 > result/r1 2>&1;
ls -1 mydir mydir2 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 mydir mydir2 with 'mkdir mydir mydir2 && touch mydir/file{10..20} && touch mydir2/file{30..40}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 mydir mydir2 with 'mkdir mydir mydir2 && touch mydir/file{10..20} && touch mydir2/file{30..40}'"$clear;
fi
rm -rf mydir mydir2

###3
mkdir mydir{1..7} && touch mydir{1..7}/file{1..11}
./ft_ls -1 mydir{1..7} 2>&1 > result/r1 2>&1;
ls -1 mydir{1..7} 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 mydir{1..7} with 'mkdir mydir{1..7} && touch mydir{1..7}/file{1..11}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 mydir{1..7} with 'mkdir mydir{1..7} && touch mydir{1..7}/file{1..11}'"$clear;
fi
rm -rf mydir{1..7}

###4
mkdir mydir && touch mydir/a
./ft_ls -1 mydir 2>&1 > result/r1 2>&1;
ls -1 mydir 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 mydir with 'mkdir mydir && touch mydir/a'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 mydir with 'mkdir mydir && touch mydir/a'"$clear;
fi
rm -rf mydir

###5
mkdir ./mydir && touch ./mydir/{a,b,c}
./ft_ls -1 ./mydir 2>&1 > result/r1 2>&1;
ls -1 ./mydir 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 ./mydir with 'mkdir ./mydir && touch ./mydir/{a,b,c}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 ./mydir with 'mkdir ./mydir && touch ./mydir/{a,b,c}'"$clear;
fi
rm -rf ./mydir





nb_test=0;
test_name="42_test_opt_a"
echo "=========================== "$test_name" ===========================\n";
###1
mkdir .a a
./ft_ls -1a 2>&1 > result/r1 2>&1;
ls -1a 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1a with 'mkdir .a a'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1a with 'mkdir .a a'"$clear;
fi
rm -rf a .a

###2
mkdir .hiddendir{1..10} dir{1..10} && touch .hiddenfile{1..10} file{1..10}
./ft_ls -1a 2>&1 > result/r1 2>&1;
ls -1a 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1a with 'mkdir .hiddendir{1..10} dir{1..10} && touch .hiddenfile{1..10} file{1..10}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1a with 'mkdir .hiddendir{1..10} dir{1..10} && touch .hiddenfile{1..10} file{1..10}'"$clear;
fi
rm -rf .hiddendir* dir* .hiddenfile{1..10} file{1..10}


test_name="42_test_opt_r"
echo "=========================== "$test_name" ===========================\n";
###1
touch a b c AA BB CC
./ft_ls -1r 2>&1 > result/r1 2>&1;
ls -1r 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1r with 'touch a b c AA BB CC'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1r with 'touch a b c AA BB CC'"$clear;
fi
rm -rf a b c AA BB CC

###2
mkdir -p a b c AA BB CC
./ft_ls -1r 2>&1 > result/r1 2>&1;
ls -1r 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1r with 'mkdir -p a b c AA BB CC'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1r with 'mkdir -p a b c AA BB CC'"$clear;
fi
rm -rf a b c AA BB CC

###3
mkdir -p POP mok POPO liu && touch PIP mik PIPI lui
./ft_ls -1r 2>&1 > result/r1 2>&1;
ls -1r 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1r with 'mkdir -p POP mok POPO liu && touch PIP mik PIPI lui'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1r with 'mkdir -p POP mok POPO liu && touch PIP mik PIPI lui'"$clear;
fi
rm -rf POP mok POPO liu PIP mik PIPI lui



nb_test=0;
test_name="42_test_opt_rR"
echo "=========================== "$test_name" ===========================\n";
###1
mkdir -p level1_{1..2}/level2_{1..2}
./ft_ls -1rR 2>&1 > result/r1 2>&1;
ls -1rR 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1rR with 'mkdir -p level1_{1..2}/level2_{1..2}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1rR with 'mkdir -p level1_{1..2}/level2_{1..2}'"$clear;
fi
rm -rf level1_{1..2}

###2
mkdir -p level1_{1..2}/level2_{1..2}/level3_{1..2}
./ft_ls -1rR 2>&1 > result/r1 2>&1;
ls -1rR 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1rR with 'mkdir -p level1_{1..2}/level2_{1..2}/level3_{1..2}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1rR with 'mkdir -p level1_{1..2}/level2_{1..2}/level3_{1..2}'"$clear;
fi
rm -rf level1_{1..2}

###3
mkdir -p level1_{1..3}/level2_{6..8}/level3_{11..13}
./ft_ls -1rR 2>&1 > result/r1 2>&1;
ls -1rR 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1rR with 'mkdir -p level1_{1..3}/level2_{6..8}/level3_{11..13}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1rR with 'mkdir -p level1_{1..3}/level2_{6..8}/level3_{11..13}'"$clear;
fi
rm -rf level1_{1..3}

###4
mkdir -p .a .b .c && mkdir -p a b c 
./ft_ls -1rR 2>&1 > result/r1 2>&1;
ls -1rR 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1rR with 'mkdir -p .a .b .c && mkdir -p a b c '"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1rR with 'mkdir -p .a .b .c && mkdir -p a b c '"$clear;
fi
rm -rf a b c .a .b .c



nb_test=0;
test_name="42_test_opt_t"
echo "=========================== "$test_name" ===========================\n";
###1
touch a b c d e && touch -t 201212101830.55 c
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



nb_test=0;
test_name="42_test_opt_tR"
echo "=========================== "$test_name" ===========================\n";
###1
mkdir -p sbox/level1_{1..2}/level2_{1..2}/level3_{1..2}
mkdir -p sbox1/level1_{1..2}/level2_{1..2}/level3_{1..2}
mkdir -p sbox/level1_1 sbox/level1_1/level2_1
touch -t 201212101830.55 sbox/c_lvl1
touch -t 201212101830.55 sbox/level1_1/c_lvl2
touch -t 201212101830.55 sbox/level1_1/level2_1/c_lvl3
./ft_ls -1tR 2>&1 > result/r1 2>&1;
ls -1tR 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1tR with 'mkdir -p sbox/level1_{1..2}/level2_{1..2}/level3_{1..2} | mkdir -p sbox1/level1_{1..2}/level2_{1..2}/level3_{1..2} | mkdir -p sbox/level1_1 sbox/level1_1/level2_1 | touch -t 201212101830.55 sbox/c_lvl1 | touch -t 201212101830.55 sbox/level1_1/c_lvl2 | touch -t 201212101830.55 sbox/level1_1/level2_1/c_lvl3'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1tR with 'mkdir -p sbox/level1_{1..2}/level2_{1..2}/level3_{1..2} | mkdir -p sbox1/level1_{1..2}/level2_{1..2}/level3_{1..2} | mkdir -p sbox/level1_1 sbox/level1_1/level2_1 | touch -t 201212101830.55 sbox/c_lvl1 | touch -t 201212101830.55 sbox/level1_1/c_lvl2 | touch -t 201212101830.55 sbox/level1_1/level2_1/c_lvl3'"$clear;
fi
rm -rf sbox sbox1


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


nb_test=0;
test_name="42_test_opt_l"
echo "=========================== "$test_name" ===========================\n";
###1
./ft_ls -1aR 2>&1 > result/r1 2>&1;
ls -1aR 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1aR with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": 1aR -lt with ''"$clear;
fi

###2
mkdir aRdir1 .aRhdir1
touch .aRhdir1/file1 .aRhdir1/.hfile1
./ft_ls -1aR 2>&1 > result/r1 2>&1;
ls -1aR 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1aR with 'mkdir aRdir1 .aRhdir1 | touch .aRhdir1/file1 .aRhdir1/.hfile1'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1aR with 'mkdir aRdir1 .aRhdir1 | touch .aRhdir1/file1 .aRhdir1/.hfile1'"$clear;
fi
rm -rf aRdir1 .aRhdir1



nb_test=0;
test_name="42_test_opt_aRl"
echo "=========================== "$test_name" ===========================\n";
###1
mkdir .hdir
./ft_ls -lRa 2>&1 | grep -v r1 | grep -v r2  > result/r1 2>&1;
ls -lRa 2>&1 | grep -v r1 | grep -v r2 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -lRa with 'mkdir .hdir'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -lRa with 'mkdir .hdir'"$clear;
fi
rm -rf .hdir



nb_test=0;
test_name="42_test_single_file"
echo "=========================== "$test_name" ===========================\n";
###1
touch aaa
./ft_ls -l aaa 2>&1 > result/r1 2>&1;
ls -l aaa 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -l aaa with 'touch aaa'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l aaa with 'touch aaa'"$clear;
fi
rm -rf aaa




nb_test=0;
test_name="42_test_permissions"
echo "=========================== "$test_name" ===========================\n";
###1
touch a b c
chmod 644 a
chmod 755 b
chmod 311 c
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
	echo $red"Test "$nb_test": ls -l with 'touch a b c | chmod 644 a | chmod 755 b | chmod 311 c'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'touch a b c | chmod 644 a | chmod 755 b | chmod 311 c'"$clear;
fi
rm -rf a b c

###2
mkdir a b c
chmod 644 a
chmod 755 b
chmod 311 c
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
	echo $red"Test "$nb_test": ls -l with 'mkdir a b c | chmod 644 a | chmod 755 b | chmod 311 c'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l with 'mkdir a b c | chmod 644 a | chmod 755 b | chmod 311 c'"$clear;
fi
rm -rf a b c





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
./ft_ls -lR . \"\" . 2>&1 | grep -v "r1" | grep -v "r2" > result/r1 2>&1;
ls -lR . \"\" . 2>&1 | grep -v "r1" | grep -v "r2" > result/r2 2>&1;
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







nb_test=0;
test_name="42_test_symlink"
echo "=========================== "$test_name" ===========================\n";
###1
mkdir mydir && ln -s mydir symdir && touch mydir/file{1..5}
./ft_ls -1 symdir 2>&1 > result/r1 2>&1;
ls -1 symdir 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 symdir with 'mkdir mydir && ln -s mydir symdir && touch mydir/file{1..5}'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 symdir with 'mkdir mydir && ln -s mydir symdir && touch mydir/file{1..5}'"$clear;
fi
rm -rf mydir symdir

###2
touch a
ln -s a b
./ft_ls -1 b 2>&1 > result/r1 2>&1;
ls -1 b 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 b with 'touch a | ln -s a b'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 b with 'touch a | ln -s a b'"$clear;
fi
rm -rf a b

###3
mkdir a
ln -s a b
rm -rf a
./ft_ls -1 b 2>&1 > result/r1 2>&1;
ls -1 b 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 b with 'mkdir a | ln -s a b | rm -rf a'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 b with 'mkdir a | ln -s a b | rm -rf a'"$clear;
fi
rm -rf b

###4
mkdir a
ln -s a b
rm -rf a
./ft_ls -l b 2>&1 > result/r1 2>&1;
ls -l b 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -l b with 'mkdir a | ln -s a b | rm -rf a'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l b with 'mkdir a | ln -s a b | rm -rf a'"$clear;
fi
rm -rf b




nb_test=0;
test_name="42_test_no_username"
echo "=========================== "$test_name" ===========================\n";
###1
./ft_ls -l /usr/local/bin/node 2>&1 > result/r1 2>&1;
ls -l /usr/local/bin/node 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -l /usr/local/bin/node with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l /usr/local/bin/node with ''"$clear;
fi




nb_test=0;
test_name="42_test_no_groupname"
echo "=========================== "$test_name" ===========================\n";
###1
./ft_ls -l /usr/share/doc 2>&1 > result/r1 2>&1;
ls -l /usr/share/doc 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -l /usr/share/doc with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -l /usr/share/doc with ''"$clear;
fi






nb_test=0;
test_name="42_test_multiple_files"
echo "=========================== "$test_name" ===========================\n";
###1
./ft_ls -1 . . 2>&1 > result/r1 2>&1;
ls -1 . . 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 . . with ''"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 . . with ''"$clear;
fi

###2
touch a b C D
./ft_ls -1 ./ . 2>&1 > result/r1 2>&1;
ls -1 ./ . 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 ./ . with 'touch a b C D'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 ./ . with 'touch a b C D'"$clear;
fi
rm -rf a b C D

###3
touch a c z
mkdir b d
ln -s a e && ln -s a f
./ft_ls -1 z b a c d f e 2>&1 > result/r1 2>&1;
ls -1 z b a c d f e 2>&1 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -1 z b a c d f e with 'touch a c z | mkdir b d | ln -s a e && ln -s a f'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -1 z b a c d f e with 'touch a c z | mkdir b d | ln -s a e && ln -s a f'"$clear;
fi
rm -rf a c z b d e f





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




nb_test=0;
test_name="42_test_opt_mix"
echo "=========================== "$test_name" ===========================\n";
###1
mkdir dir1 .hdir1
touch dir1/file{1..5} dir1/.hfile{1..5}
touch .hdir1/file{1..5} .hdir1/.hfile{1..5}
touch .hdir1/file{1..5} .hdir1/.hfile{1..5}
touch a && ln -s a symlink
./ft_ls -lR . 2>&1 | grep -v r1 | grep -v r2 > result/r1 2>&1;
ls -lR . 2>&1 | grep -v r1 | grep -v r2 > result/r2 2>&1;
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
	echo $red"Test "$nb_test": ls -lR . with 'mkdir dir{1..5} .hdir{1..5} | touch dir1/file{1..5} dir1/.hfile{1..5} | touch .hdir1/file{1..5} .hdir1/.hfile{1..5} | touch .hdir1/file{1..5} .hdir1/.hfile{1..5} | touch a && ln -s a symlink'"$clear;
else
	success=$(($success+1))
	echo $green"Test "$nb_test": ls -lR . with 'mkdir dir{1..5} .hdir{1..5} | touch dir1/file{1..5} dir1/.hfile{1..5} | touch .hdir1/file{1..5} .hdir1/.hfile{1..5} | touch .hdir1/file{1..5} .hdir1/.hfile{1..5} | touch a && ln -s a symlink'"$clear;
fi
rm -rf dir1 .hdir1 a symlink



















### To add another test, just copy paste the previous pattern and edit it

### End of all test, this will print your result.
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
