###########################################################
###########################################################
##################### CUSTOM SETTINGS #####################
###########################################################
###########################################################

# History configuration
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Alias configuration
alias l="ls -alhF -v"
alias ll="ls -lhF -v"
alias vim="nvim"

# Initialize ssh-agent
if [ -z "$SSH_AGENT_PID" ]; then
    ssh-add ~/.ssh/github &>/dev/null
fi

# PATH configuration
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
