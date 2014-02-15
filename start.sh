#!/bin/bash

echo "configuring shell"
mv .bashrc $HOME/
source ~/.bashrc
echo " swap ctrl and caps lock "
mv .Xmodmap $HOME/
xmodmap $HOME/.Xmodmap

#checking whether necessary programs are installed:
declare -a applications=( curl keepassx firefox git vlc pidgin fluxboxlvim colibri conky )

sudo apt-get update
sudo apt-get upgrade

for i in ${applications[@]}
do
#	command -v $i >/dev/null && echo "$i exists" || install $i
	if [ `which $i` ];then
			echo "$i exists"
		else
			echo "$i doesn't exist"
			sudo apt-get install --assume-yes $i
	fi
done

#pathogen for vim
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
	curl -Sso ~/.vim/autoload/pathogen.vim \
	    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

#NERDTree
(cd ~/.vim/bundle; git clone https://github.com/scrooloose/nerdtree.git)

echo "Download keepassx database"
#xdg-open 'https://sites.google.com/site/rafalpacut/'
wget -O ~/.Rafal.kdb "https://sites.google.com/site/rafalpacut/home/files/.Rafal.kdb?attredirects=0&d=1" 
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
	echo "enter your username: "
	read your_name
	echo "please enter your username once more: "
	read your_name2
done
git config --global user.name "$your_name"

your_email='.'
your_email2=','
while [ $your_email != $your_email2 ];do
	echo "enter your email: "
	read your_email
	echo "please enter your email once more: "
	read your_email2
done
git config --global user.email "$your_email"
echo "configuring git connection via ssh: "
echo "do you want to continue?[y/n]"
read flag
if [ $flag='y' ]; then

	if [ -d ~/.ssh ]; then
		mkdir ~/.ssh/key_backup
		cp ~/.ssh/id_rsa* ~/.ssh/key_backup
		rm ~/.ssh/id_rsa*
	fi
	ssh-keygen -t rsa -C "$your_email"
fi
echo "add your public key to git: "
nano ~/.ssh/id_rsa.pub
keepassx &
xdg-open 'https://github.com/login'
echo "are you done? [y/n]"
read trigger

echo "configuring fluxbox"
mkdir ~/.fluxbox
instal_dir=$HOME/.fluxbox

mv init $instal_dir/
mv keys $instal_dir/
mv startup $instal_dir/


hTtps://sites.google.com/site/rafalpacut/home/files/.Rafal.kdb?attredirects=0&d=1
#when using KDE, it's popup menager disables libnotify, just install colibri and enable it
echo " time popup, "
mv time-popup $path_dir/
echo "reminding script,"
mv remind $path_dir/
echo " wallpaper clock script, "
mv wallpaperclock $path_dir/ 

echo "Opera/Firefox preferences, conky settings and wallpapers available on drive.google.com"
