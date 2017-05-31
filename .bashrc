[ -z "$PS1" ] && return
# Bash completion
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

cd () 
{
  if [ -n "$1" ]; then
	builtin cd "$@" && \ls
  else
	builtin cd "$@" && \ls
  fi
}

#The color thing
if [ "$TERM" != dumb ]; then
	[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
	[ -e "$DIR_COLORS" ] || DIR_COLORS=""
	eval "`dircolors -b $DIR_COLORS`"

fi

opencvg++ ()
{
	g++ -Wall -std=c++11 $1 `pkg-config opencv --cflags --libs`
}

opencvgdebug++ ()
{
	g++ -ggdb -g3 -Wall -std=c++11 $1 `pkg-config opencv --cflags --libs`
}

opencvGtestg++ ()
{
	g++ -Wall -std=c++11 $1 `pkg-config opencv --cflags --libs` -lgtest -pthread 
}

PATH=$PATH:/home/rafal/.local/bin/
export PATH

export TERM=xterm-256color

alias ls="\ls"
alias mvcd="mv $1 $2 && cd $2"
alias musb="sudo mount /dev/sdb/ /media/"
alias po="sudo poweroff"
alias reboot="sudo reboot"
alias la="ls -a"
alias install="sudo aptitude install"
alias remove="sudo apt-get remove"
alias battery="acpi&&while sleep 2m; do acpi; done"
alias search="sudo aptitude search"
alias eg++='g++ -std=c++11 -I/usr/include/eigen3'
alias g++='g++ -std=c++11'
alias ocvg++=opencvg++
alias ocvdg++=opencvgdebug++
alias gtestg++=opencvGtestg++
alias untargz="tar -zxvf"

#on start:
#fortune -a


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
