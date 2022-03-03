first="\/\*"
last="\*\/"
sed -i "/$first/,/$last/d" $1
sed -i "s/$first.*$last//g" $1
sed -i '/^\//d' $1 # deleting single line comment if start with //