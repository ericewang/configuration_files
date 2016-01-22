# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

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

EDITOR=/usr/bin/vim
#alias sublime='/usr/bin/sublime-text'
alias vi='vim'
#alias vim='/usr/bin/vim'

# Git branch in prompt.

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

# show branch in prommpt version
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[m\]\$ "

# old version
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\] 🍔  "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


alias c='clear'

# ls aliases
alias ls='ls --color=auto -F --group-directories-first'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsd='ls -d */'

# git aliases
alias gg='git grep -n'
alias gsr='git svn rebase'
alias gme='git log --author=ericwang'
alias gb='git branch'
alias gc='git checkout'
alias gs='git show'
alias gd='git diff --color-words'
alias gca='git commit --amend'
alias gl='git log -p --stat'

# cd aliases
alias cdm='cd ~/co/manage'
alias cdr='cd ~/co/router'
alias cdk='cd ~/co/router/meraki'
alias cdh='cd ~/co/router/hostap'
alias cdb='cd ~/co/router/base'
alias cdmr='cd ~/co/manage-released'
alias cdd='cd /var/local/meraki/manage-devel'
alias cdj='cd ~/co/manage/private/react'
alias cdsu='cd ~/co/manage/scala/support/src/main/scala'
alias cdg='cd ~/co/manage/scala/grabbers/src/main/scala'
alias cdt='cd ~/co/manage/scala/grabbers/src/test/scala'
alias cdl='cd ~/co/manage/scala/lt/src/main/scala'
alias cdlt='cd ~/co/manage/scala/lt/src/test/scala'
alias cdclt='cd ~/co/manage/cpp/little_table'
alias cdcltt='cd ~/co/manage/cpp/little_table/test'
alias cdc='cd ~/co/manage/cpp'
alias cdcltg='cd ~/co/manage/cpp/little_table_gtest'

function cds {
  if [ -z $1 ]; then
    cd ~/co/manage/scala
  else
    cd ~/co/manage/scala/$1/src/main/scala
  fi
}

function cdst {
  if [ -z $1 ]; then
    echo "You suck, you gotta specify a scala test directory"
  else
    cd ~/co/manage/scala/$1/src/test/scala
  fi
}

# run console
alias dco='~/co/manage/script/console'

# sbt alias
alias sbt='LD_LIBRARY_PATH=/home/ericwang/co/manage/scala/support/lib/i386 sbt'

# run server
alias ss='~/co/manage/script/server --debug'
# run livebroker
alias lb='cdm; ./script/live_broker/live_broker.rb --skip-running-procs'

# sql related aliases
alias dspsql='psql -U www-data meraki_shard_development -h shard-development-db.meraki.com'
alias personaltestsql='psql -U meraki_test_helper -h development-db.meraki.com -d meraki_test_ericwang'
alias tpsql='psql -U www-data-test -d meraki_test -h development-db'
alias sqltd='~/co/manage/cpp/sqlt/sqlt development-lt 5458'
alias tsqltd='~/co/manage/cpp/sqlt/sqlt development-lt 5658'
alias mysqltd='~/co/manage/cpp/sqlt/sqlt localhost 10002'
alias mylt='~/co/manage/cpp/little_table/server -c 500 -t 200 -p 10002 ~/local_lt'

# ssh-agent aliases setup
alias dssh='ssh-add ~/.ssh/dev_rsa'

# svnmerge aliases : svna, svnm, svnprep, svnm_auto
if [ -f ~/co/manage/script/svnmerge_helpers.sh ]; then
    source ~/co/manage/script/svnmerge_helpers.sh
fi
alias svnc='svn commit -F svnmerge-commit-message.txt'

PATH=$PATH:$HOME/bin
MANPATH=$MANPATH:$HOME/share/man

export PATH="$PATH:/usr/bin:/usr/local/bin/"

# for compiling of openwrt build
#export OPENWRT_HOSTCC=gcc-4.7

# installing ruby versions
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

alias sob='source ~/.bashrc'
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# random useful aliases
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'
alias tm='ps -ef | grep'
alias myip='curl ip.appspot.com'
alias howcool='git log --author="ericwang" --pretty=tformat: --numstat | gawk '"'"'{ add += $1; subs += $2; loc += $1-$2 } END {printf "added lines: %s removed lines: %s total lines: %s\n", add, subs, loc }'"'"
alias hownot='git log --author="Eric Wang" --pretty=tformat: --numstat | gawk '"'"'{ add += $1; subs += $2; loc += $1-$2 } END {printf "added lines: %s removed lines: %s total lines: %s\n", add, subs, loc }'"'"
function gitstats {
    echo "Stats for: $1"
    git log --author="$1" --pretty=tformat: --numstat | gawk '{ add += $1; subs += $2; loc += $1-$2 } END {printf "added lines: %s removed lines: %s total lines: %s\n", add, subs, loc }'
}
function gr { grep -rnIi "$1" . --color; }
pe ()
{
    perl -e "\$result = $*; printf \"%s\n0x%08x\n\", \$result, \$result;"
}
# alias for power supply
alias apc='telnet 10.3.13.133'
alias cr='/home/ericwang/co/manage/script/cr'
alias gitbro="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

# temp Gtest thing
GTEST_DIR=/home/ericwang/googletest/googletest
