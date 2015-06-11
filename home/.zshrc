# Uncomment this and zprof at the end to profile
#zmodload zsh/zprof
# now, simply add these two lines in your ~/.zshrc

## Plugin manager
# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load
## End Plugin manager

## Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
## Initialization code that may require console input (password prompts, [y/n]
## confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Source a file if it exists
include () {
  [[ -f "$1" ]] && source "$1"
}

# XXX: Disable this to attempt to fix tmux clors
#export TERM="xterm-256color"


# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE='true'
ENABLE_CORRECTION='false'

plugins=(
  aws
  colored-man-pages
  colorize
  common-aliases
# Causing new shells to hang??
#  docker
#  docker-compose
  emoji
  git
  kubectl
  terraform
 # virtualenvwrapper
#  tmux
#  zsh-completions
#  zsh-kubectl-prompt
#  zsh-syntax-highlighting
#  zshmarks
)

# ZSH_THEME is sourced from here, so that it encapsulate theme specific config
# include $HOME/.zshtheme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#include ~/powerlevel10k/powerlevel10k.zsh-theme

# This should give us WORK_NAMESPACE
#include ~/.env_namespace
#include "$HOME/$WORK_NAMESPACE/source-me"

# Needs to be here so work-only plugin deps are on the path, yet personal
# functions/aliases override oh-my-zsh plugins
source $ZSH/oh-my-zsh.sh
# powerlevel9k's font-awesome sets LC_ALL to '', which breaks perl :/
export LC_ALL="$LANGUAGE"

# Load Laithisms
include "$DOTFILES/.aliases"

# Nasty fat hobbitsis keeps his secret keys here
include "$DOTFILES/.secrets"
include "$HOME/.secrets"

# Util function
include "$SCRIPTS/functions/source-me"

# Docker wrapped tools
include "$CODE/docker/source-me"


os-name() {
  if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo 'Linux'
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo 'Mac'
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo 'Windows' # POSIX compatibility layer and Linux environment emulation for Windows
  else
    echo 'Unknown'
  fi
}
local os=$(os-name)

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  case $os in
    Linux)
      export EDITOR='gvim'
      # vimx Starts gvim in "Vi" mode similar to "vim"
      # but with additional features like xterm clipboard support
      alias vim=vimx
      ;;
    Mac)   export EDITOR='mvim';;
  esac
fi
export EDITOR='vim'

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='vim'
fi

include $HOME/.zshrc_personal

# Turn off clippy-esque correction suggestions
unsetopt correct_all

# For zsh-completions
# autoload -U compinit && compinit
# For kubectl completion
source <(kubectl completion zsh)


###
# Experimental section, should be sorted before committing
###

#export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/Devel
#source /usr/local/bin/virtualenvwrapper.sh

# Tmux plugin for omz
ZSH_TMUX_AUTOSTART=true

# alias tmux="tmux -2"
# Trying to fix path issue
export PATH="/lxhome/alissala/bin/:$PATH"

# NVM paths
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

#zprof
#source ~/.gsr-functions

# Flux completions
. <(flux completion zsh)

compdef kubecolor=kubectl

# Hishtory Config:
export PATH="$PATH:/home/laith/.hishtory"
source /home/laith/.hishtory/config.zsh
