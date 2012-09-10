#!/bin/bash

echo "configuring shell"
mv .bashrc $HOME/
source ~/.bashrc

#checking whether necessary programs are installed:
name1=keepassx
name2=opera
name3=git
name4=lsscsi
name5=soundconverter
name6=pidgin

for i in {name1..name6}
do
	command -v $i >/dev/null && echo "$i exists" || install $i
done

echo "Download keepassx database"
xdg-open 'https://sites.google.com/site/rafalpacut/'
echo "are you done? [y/n]"
read trigger

#my own PATH dir
echo "making .local/bin"
mkdir $HOME/.local/bin

#my own inf file
echo "making inf file"
mkdir $HOME/inf

echo "configurating git: "

your_name='.'
your_name2=','
while [ $your_name != $your_name2 ]; do
	echo "enter your name: "
	read your_name
	echo "please enter your name once more: "
	read your_name2
done
git config --global user.name '$your_name'

your_email='.'
your_email2=','
while [ $your_email != $your_email2 ];do
	echo "enter your email: "
	read your_email
	echo "please enter your email once more: "
	read your_email2
done
git config --global user.email '$your_email'
echo "configuring git connection via ssh: "
echo "do you want to continue?[y/n]"
read flag
if [ $flag='y' ]; then

	if [ -d ~/.ssh ]; then
		mkdir ~/.ssh/key_backup
		cp id_rsa* ~/.ssh/key_backup
		rm ~/.ssh/id_rsa*
	fi
	ssh-keygen -t rsa -C '$your_email'
fi
echo "add your public key to git: "
nano ~/.ssh.id_rsa.pub
xdg-open 'https://github.com/login'
echo "are you done? [y/n]"
read trigger

echo "installing to-do manager:"
instal_dir=$HOME/inf/sh-todo
path_dir=$HOME/.local/bin

git clone git@github.com:asb/sh-todo.git $instal_dir
mv .sh-todo $HOME/
mkdir $instal_dir/files
mkdir $path_dir/sh-todo
cp $instal_dir/todo $path_dir/sh-todo/
cp $instal_dir/todone $path_dir/sh-todo/

echo "configuring fluxbox"
instal_dir=$HOME/.fluxbox

mv init $instal_dir/
mv keys $instal_dir/
mv startup $instal_dir/

echo "copying scripts:"
echo " background randomizer, "
path_dir=$HOME/.local/bin

mv random_welcoming_screen $path_dir/
echo " time popup, "
mv time-popup $path_dir/
echo " swap ctrl and caps lock "
mv .Xmodmap $HOME/
echo "reminding script,"
mv remind $path_dir/
