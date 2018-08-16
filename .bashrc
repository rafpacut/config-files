[ -z "$PS1" ] && return
# Bash completion
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

#Fire up tmux if it's installed and we are not nesting
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

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

PATH="$PATH:/home/rafal/.local/bin/"
export PATH

#export TERM=xterm-256color
export TERM=konsole-256color

alias ls="\ls"
alias reboot="sudo reboot"
alias la="ls -a"
alias install="apt install"
alias remove="apt remove"
alias search="sudo aptitude search"
alias untargz="tar -zxvf"
alias polsl="cd /home/rafal/inf/polsl/ && vim"

#on start:
#fortune -a


#Most likely incorrect
#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

CPLUS_INCLUDE_PATH="/opt/boost_1_66_0"

#prevents locking the whole terminal when accidentaly hitting Ctrl-s instead of VIM YouCompleteMe Plugin Ctrl-n name autocomplete
stty -ixon


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
