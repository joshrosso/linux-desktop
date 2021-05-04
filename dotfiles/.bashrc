PS1='\n\u @ \h (\e[38;5;198m\w\e[0m) [\e[38;5;148m$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\e[0m]\n\$ '

# Environment / Path
#export GOBIN=/home/josh/bin
export SCRIPTS=/home/josh/s
#export GOPATH=/home/josh/f/d/go
export PATH=$PATH:$GOBIN:$SCRIPTS:/home/josh/.local/bin/statusbar

# Load aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

source <(kubectl completion bash)

# History
# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# Append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
export EDITOR=vim

# enables alias expansion when running watch
alias watch='watch '

# use fzf for reverse search
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# Setup ssh-agent
#eval `ssh-agent` &>/dev/null
#ssh-add ~/.ssh/*.pem &>/dev/null

export ZOOM="https://VMware.zoom.us/my/joshrosso"

export FZF_CTRL_R_OPTS='--sort --exact'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
