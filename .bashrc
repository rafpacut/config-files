[ -z "$PS1" ] && return
# Bash completion
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

cd () 
{
  if [ -n "$1" ]; then
	builtin cd "$@" && ~/inf/watching/./lsc
  else
	builtin cd "$@" && ~/inf/watching/./lsc
  fi
}

#The color thing
if [ "$TERM" != dumb ]; then
	[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
	[ -e "$DIR_COLORS" ] || DIR_COLORS=""
	eval "`dircolors -b $DIR_COLORS`"

fi

PATH=$PATH:/home/rafal/inf/watching/
PATH=$PATH:/home/rafal/.local/bin/
export PATH

alias ls="~/inf/watching/./lsc"
alias mvcd="mv $1 $2 && cd $2"
alias musb="sudo mount /dev/sdb/ /media/"
alias po="sudo poweroff"
alias la="ls -a"
alias install="sudo apt-get install"
alias remove="sudo apt-get remove"
alias vol="amixer set Master"
alias emacs="emacs --fullscreen --no-splash"
alias mplayer="mplayer -msglevel all=0"

#on start:
#fortune -a
#~/inf/bash/reminder/./reminder.sh