filepath=$(realpath SSHRD_Helper.sh)
dirname=$(dirname "$filepath")
cd $dirname
os=$(uname -s)
clear
echo " .--------------------------------------------------."
echo " |          SSHRD Script Helper Utility             |"
echo " |                                                  |"
echo " |   Selections with * sign requires your device    |"
echo " |            already booted a ramdisk.             |"
echo " |                                                  |"
echo " | m -> Make New Ramdisk                            |"
echo " | b -> Boot Ramdisk                                |"
echo " | c -> Clean Up Ramdisk                            |"
echo " | d -> Dump Onboard Blobs *                        |"
echo " | r -> Reboot Device *                             |"
echo " | s -> SSH Into Device *                           |"
echo " | e -> Erase Device *                              |"
echo " | t -> Install TrollStore *                        |"
echo " |                                                  |"
echo " .--------------------------------------------------."
echo "                                                     "
echo "Type a LOWERCASE letter to make a selection: " 
read -r select

if [ "$select" = 'm' ]; then
    verinfo=$(./$os/ideviceinfo -k ProductVersion)
    ./sshrd.sh $verinfo
elif [ "$select" = 'b' ]; then
    ./sshrd.sh boot
elif [ "$select" = 'c' ]; then
    ./sshrd.sh clean
elif [ "$select" = 'd' ]; then
    ./sshrd.sh dump-blobs
elif [ "$select" = 'r' ]; then
    ./sshrd.sh reboot
elif [ "$select" = 's' ]; then
    ./sshrd.sh ssh
elif [ "$select" = 'e' ]; then
    ./sshrd.sh reset
elif [ "$select" = 't' ]; then
    ./sshrd.sh TrollStore
else
    echo "Invalid selection. Please try again."
fi
