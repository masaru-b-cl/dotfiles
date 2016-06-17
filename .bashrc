alias ls='ls --color --show-control-chars'
alias gst="git status"
source ~/bin/git-completion.bash
export PS1="\u@\h \w\[\e[32m\]$(__git_ps1)\[\e[0m\]\n$ "

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi


