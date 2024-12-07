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
alias l="ls -lhF -v"

# PATH configuration
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
