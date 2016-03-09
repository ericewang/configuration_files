
# load aliases if available
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

export EDITOR=vim

# Tell ls to be colourful
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
#export LSCOLORS=GxFxCxDxBxegedabagaced

#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\] 🍔  "
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

#alias ls='ls -GFh'

# # Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'


EDITOR=/usr/bin/vim
alias sublime='/usr/bin/sublime-text'
alias vi='vim'

# Git branch in prompt.

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

# show branch in prommpt version
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[m\]\$ "

alias u='osascript ~/Documents/IncreaseVolume.scpt'
alias d='osascript ~/Documents/DecreaseVolume.scpt'
alias m='osascript ~/Documents/ToggleMuteVolume.scpt'
alias g='osascript -e "get volume settings"'

# for adding sml to path
export PATH="$PATH:/usr/local/smlnj/bin"
