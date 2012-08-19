#!/bin/bash
echo "configuring shell"
mv .bashrc $HOME/
echo "configuring fluxbox"
mv init $HOME/.fluxbox/
mv keys $HOME/.fluxbox/
mv startup $HOME/.fluxbox/
echo "making .local/bin"
mkdir $HOME/.local/bin
echo "copying scripts:"
mv random_welcoming_screen $HOME/.local/bin/
mv time-popup $HOME/.local/bin/
mv .Xmodmap $HOME/
echo "removing misc"
cd ..
rm -rf .
