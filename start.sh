#!/bin/bash

echo "configuring shell"
mv .bashrc $HOME/

#checking whether necessary programs are installed:
name1=keepassx
name2=opera
name3=git
name4=lsscsi
name5=soundconverter

for i in {name1..name5}
do
	command -v $i >/dev/null && echo "$i exists" || install $i
done

#my own PATH dir
echo "making .local/bin"
mkdir $HOME/.local/bin

#my own inf file
echo "making inf file"
mkdir $HOME/inf

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
