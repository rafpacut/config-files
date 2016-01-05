#add on boot up command
#/etc/rc.local is a file containing commands executed on boot up
dir="$(pwd)"
path_to_db="$dir/db.txt"

touch $path_to_db

#next commands need to be run as root
su
sed -i "/# By default this script does nothing/a date +%s >> $path_to_db" /etc/rc.local


#add on shutdown command
#/ect/rc0.d/ is a directory containing symlinks to executable files
on_shutdown="date +%s >> $path_to_db"
echo $on_shutdown > $dir/on_shutdown.sh

chmod +x $dir/on_shutdown.sh
ln -s $dir/on_shutdown.sh /etc/rc0.d/K99time_spent_tracker.sh 

