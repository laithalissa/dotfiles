# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Source a file if it exists
include () {
  [[ -f "$1" ]] && source "$1"
}

export TERM="xterm-256color"
# ZSH_THEME is sourced from here, so that it encapsulate theme specific config
include $HOME/.zshtheme

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE='true'
ENABLE_CORRECTION='true'

plugins=(
  colored-man-pages
  colorize
  docker
  docker-compose
  emoji
  git
 # virtualenvwrapper # Disable while playing with conda
  zsh-syntax-highlighting
  zshmarks
)

# This should give us WORK_NAMESPACE
include ~/.env_namespace
include "$HOME/$WORK_NAMESPACE/source-me"

# Needs to be here so work-only plugin deps are on the path, yet personal
# functions/aliases override oh-my-zsh plugins
source $ZSH/oh-my-zsh.sh
# powerlevel9k's font-awesome sets LC_ALL to '', which breaks perl :/
export LC_ALL="$LANGUAGE"

# Load Laithisms
include "$DOTFILES/.aliases"

# Nasty fat hobbitsis keeps his secret keys here
include "$DOTFILES/.secrets"

# Util function
include "$SCRIPTS/functions/source-me"

# Docker wrapped tools
include "$CODE/docker/source-me"

local os=$(os-name)

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  case $os in
    Linux) export EDITOR='gvim';;
    Mac)   export EDITOR='mvim';;
  esac
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='vim'
fi

###
# Experimental section, should be sorted before committing
###
alias git-cheatsheet='cat ~/.oh-my-zsh/plugins/git/git.plugin.zsh | grep alias | less'
