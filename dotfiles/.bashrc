#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## bash history file location
HISTFILE="$HOME/.config/shell/bash_history"
## don't duplicate lines in history file
HISTCONTROL=ignoreboth
## append to the history file, don't overwrite it
shopt -s histappend


## for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

## check the window size after each command and update values for columns
shopt -s checkwinsize

# color prompt enable/disable
color_prompt=yes

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions file
if [ -f ~/.config/shell/aliases ]; then
    . ~/.config/shell/aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH=$PATH:/home/ayman/.local/bin
export EDITOR=vim
export LANG=en_US.UTF-8

# vi mode
set -o vi

## Archive extraction
ex ()
{
if [ -f $1 ]; then
	case $1 in
	*.tar.bz2)	tar xjf $1	;;
	*.tar.gz)	tar xzf $1	;;
	*.bz2)		bunzip2 $1	;;
	*.gz)		gunzip $1	;;
	*.rar)		unrar x $1	;;
	*.tar)		tar xf $1	;;
	*.tbz2)		tar xjf $1	;;
	*.tgz)		tar xzf $1	;;
	*.zip)		unzip $1	;;
	*.Z)		uncompress $1	;;
	*.7z)		7z x $1		;;
	*.deb)		ar x $1		;;
	*.tar.xz)	tar xf $1	;;
	*.tar.zst)	unzstd $1	;;
	*)		echo "'$1' cannot be extracted via ex()" ;;

    esac
else
    echo "'$1'is not a valid file"
fi
}

# set PS1 prompt and make it pretty
if [ "$color_prompt" = yes ]; then
    PS1='\
\[\033[01;33m\]\u\
\[\033[01;31m\]  \
\[\033[01;34m\]\h\
\[\033[01;00m\]:\
\[\033[01;33m\]\w\
\[\033[00m\]\$ '
else
    PS1='[\u@\h \W]\$ '
fi

#PS1='[\u@\h \W]\$ '
