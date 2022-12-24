l=$(sed '1!d' /sdcard/l.txt) 
let l=$l
s=$(sed $l'!d' /sdcard/fp.txt)
fp=$(echo $s | cut -d "=" -f 2)
m=$(echo $s | cut -d ":" -f 3 | cut -d "=" -f 1)
b1=$(echo $s | cut -d ":" -f 2)
b=$(echo $fp | cut -d "/" -f 1)
n=$(echo $fp | cut -d "/" -f 2)
a=$(echo $fp | cut -d ":" -f 2 | cut -d "/" -f 1)
bid=$(echo $fp | cut -d ":" -f 2 | cut -d "/" -f 2)
inc=$(echo $fp | cut -d ":" -f 2 | cut -d "/" -f 3)
echo ro.build.fingerprint=$b/$n/$n:$a/$bid/$inc:user/release-keys >> /sdcard/system.prop
echo ro.bootimage.build.fingerprint=$b/$n/$n:$a/$bid/$inc:user/release-keys >> /sdcard/system.prop
echo ro.build.description=$n'-user '$a' '$bid' '$inc' release-keys' >> /sdcard/system.prop
echo ro.product.brand=$b >> /sdcard/system.prop
echo ro.product.name=$n >> /sdcard/system.prop
echo ro.product.device=$n >> /sdcard/system.prop
echo ro.build.version.release=$a >> /sdcard/system.prop
echo ro.build.id=$bid >> /sdcard/system.prop
echo ro.build.version.incremental=$inc >> /sdcard/system.prop
echo ro.build.display.id=$n'-user '$a' '$bid' '$inc' release-keys' >> /sdcard/system.prop
echo ro.product.manufacturer=$b1 >> /sdcard/system.prop
echo ro.product.model=''$m'' >> /sdcard/system.prop
echo ro.serialno=$(cat /dev/urandom count=256 bs=5 | tr -dc 'a-f0-9' | head -n 1 -c 10 ) >> /sdcard/system.prop
let l=$l+1
echo $l > /sdcard/l.txt 
su -c cp /sdcard/system.prop /data/adb/modules/MagiskHidePropsConf/