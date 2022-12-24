package=com.example.app


file=/data/system/users/0/settings_ssaid.xml
curr_id=$(grep "package=\"$package\"" $file | grep -o 'value="[a-zA-Z0-9]*"*' | cut -d '"' -f2)
echo $curr_id
new_id=$(cat /dev/urandom count=256 bs=5 | tr -dc 'a-f0-9' | head -n 1 -c 16 )
echo $new_id
sed -i -e "s/$curr_id/$new_id/g" $file