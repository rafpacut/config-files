#Always ls after cd
cd () 
{
  if [ -n "$1" ]; then
	builtin cd "$@" && \ls
  else
	builtin cd "$@" && \ls
  fi
}

#Simple trash
trash()
{
	mv "$@" "$HOME/.trash/"
}

trashls()
{
	ls "$HOME/.trash"
}

trashempty()
{
	rm "$HOME/.trash/"*
}

#The color thing
if [ "$TERM" != dumb ]; then
	[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
	[ -e "$DIR_COLORS" ] || DIR_COLORS=""
	eval "`dircolors -b $DIR_COLORS`"

fi

function mvcd ()
{
     num_of_files=$(($# - 1))
     for i in $(eval echo {1..$num_of_files})
     do
         eval mv \${$i} \${$#}
     done
     eval cd \${$#}
}

function cpcd ()
{
     num_of_files=$(($# - 1))
     for i in $(eval echo {1..$num_of_files})
     do
         eval cp -r \${$i} \${$#}
     done
     eval cd \${$#}
}


alias ls="\ls"
alias la="ls -a"
alias untargz="tar -zxvf"
alias untar="tar xzf"

#on start:

#prevents locking the whole terminal when accidentaly hitting Ctrl-s instead of VIM YouCompleteMe Plugin Ctrl-n name autocomplete
stty -ixon


