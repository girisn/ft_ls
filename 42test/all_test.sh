#!/bin/sh

if [ -z $1 ]
then
	echo "$1 executable is missing"
	echo "Usage: ./all_test.sh path/to/ft_ls [p]"
	exit 1
fi

./42test_error_handling.sh $1 $2
echo ""
./42test_hyphen_hard.sh $1 $2
echo ""
./42test_hyphen_harder.sh $1 $2
echo ""
./42test_multiple_dir.sh $1 $2
echo ""
./42test_multiple_files.sh $1 $2
echo ""
#./42test_no_groupname.sh $1 $2
#echo ""
./42test_no_username.sh $1 $2
echo ""
./42test_opt_a.sh $1 $2
echo ""
./42test_opt_aR.sh $1 $2
echo ""
./42test_opt_aRl.sh $1 $2
echo ""
./42test_opt_l.sh $1 $2
echo ""
./42test_opt_mix.sh $1 $2
echo ""
./42test_opt_R.sh $1 $2
echo ""
./42test_opt_t.sh $1 $2
echo ""
./42test_opt_tR.sh $1 $2
echo ""
./42test_perm_special_bits.sh $1 $2
echo ""
./42test_perm_special_bits_dir.sh $1 $2
echo ""
./42test_permissions.sh $1 $2
echo ""
./42test_single_file.sh $1 $2
echo ""
./42test_sorted.sh $1 $2
echo ""
./42test_symlink.sh $1 $2
echo ""
./42test_without_opt.sh $1 $2
