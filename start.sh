#!/bin/bash
echo "configuring shell"
mv .bashrc $HOME/
echo "installing to-do manager:"
git clone git@github.com:asb/sh-todo.git
mv .sh-todo $HOME/
echo "configuring fluxbox"
mv init $HOME/.fluxbox/
mv keys $HOME/.fluxbox/
mv startup $HOME/.fluxbox/
echo "making .local/bin"
mkdir $HOME/.local/bin
echo "copying scripts:"
echo " background randomizer, "
mv random_welcoming_screen $HOME/.local/bin/
echo " time popup, "
mv time-popup $HOME/.local/bin/
echo " swap ctrl and caps lock "
mv .Xmodmap $HOME/
