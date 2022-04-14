PS1='\n\u @ \h (\e[38;5;198m\w\e[0m) [\e[38;5;148m$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\e[0m]\n\$ '

# Environment / Path
#export GOBIN=/home/josh/bin
export SCRIPTS=/home/josh/s
#export GOPATH=/home/josh/f/d/go


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
#HISTCONTROL=ignoreboth
## keep unlimited shell history because it's very useful
#export HISTFILESIZE=-1
#export HISTSIZE=-1
#shopt -s histappend   # don't overwrite history file after each session

# on every prompt, save new history to dedicated file and recreate full history
# by reading all files, always keeping history from current session on top.
#update_history () {
  #history -a ${HISTFILE}.$$
  #history -c
  #history -r  # load common history file
  ## load histories of other sessions
  #for f in `ls ${HISTFILE}.[0-9]* 2>/dev/null | grep -v "${HISTFILE}.$$\$"`; do
    #history -r $f
  #done
  #history -r "${HISTFILE}.$$"  # load current session history
#}

#if [[ "$PROMPT_COMMAND" != *update_history* ]]; then
  #export PROMPT_COMMAND="update_history; $PROMPT_COMMAND"
#fi

## merge session history into main history file on bash exit
#merge_session_history () {
  #if [ -e ${HISTFILE}.$$ ]; then
    #cat ${HISTFILE}.$$ >> $HISTFILE
    #\rm ${HISTFILE}.$$
  #fi
#}
#trap merge_session_history EXIT

export EDITOR=vim

# enables alias expansion when running watch
alias watch='watch '

# use fzf for reverse search
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

export ZOOM="https://VMware.zoom.us/my/joshrosso"

export FZF_CTRL_R_OPTS='--sort --exact'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
