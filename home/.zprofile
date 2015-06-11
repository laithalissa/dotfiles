# zshenv contains important env vars to be made available
# for all types of shell. See http://zsh.sourceforge.net/Intro/intro_3.html
export CODE_DIR="$HOME/code"
export SCRIPTS="$HOME/scripts"
export USER_BINARIES="$HOME/bin"

# Golang paths
export GO_BINS="$HOME/go/bin"
export GO_PATH="$HOME/go/"

#export PATH=$PATH:$SCRIPTS:$USER_BINARIES
export PATH=$SCRIPTS:$USER_BINARIES:$GO_BINS:$PATH
[[ -f "$SCRIPTS/get-paths" ]] && export PATH=$PATH:`$SCRIPTS/get-paths`
[[ -f "$SCRIPTS/functions/source-me" ]] && source "$SCRIPTS/functions/source-me"

export BREW_PREFIX='/opt/homebrew/opt'
# GNU coreutils
export PATH="$BREW_PREFIX/bin:$PATH"
#export PATH="$BREW_PREFIX/opt/grep/libexec/gnubin:$PATH"
export PATH="$BREW_PREFIX/opt/grep/libexec/gnubin:$PATH"
export PATH="$BREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"
# GNU find for OSX
export PATH="$BREW_PREFIX/opt/findutils/libexec/gnubin:$PATH"
# GNU sed for OSX
export PATH="$BREW_PREFIX/opt/gnu-sed/libexec/gnubin:$PATH"
# Add Homebrew's python, then homebrew's default binary dir to the path
#export PATH="/usr/local/opt/python@3.10/bin:/usr/local/bin:${PATH}"
# Add homebrew's default binary dir to the path
#export PATH="/opt/homebrew/opt/"
#export PATH="/usr/local/bin:${PATH}"
#export PATH="/usr/local/opt/python/libexec/bin
#export PATH="/usr/local/opt/python/libexec/bin:/usr/local/bin:${PATH}"
export PATH="${PATH}:${SCRIPTS}:${USER_BINARIES}"
[[ -f "$SCRIPTS/get-paths" ]] && export PATH=$PATH:$($SCRIPTS/get-paths)
export PATH="${PATH}:${HOME}/npm/bin"
#export NODE_PATH="$NODE_PATH:$HOME/npm/lib/node_modules"

#export DOTFILES="$CODE_DIR/dotfiles/home"
export DOTFILES="$HOME/.homesick/repos/dotfiles/home"
export DOCKER_SHARE="/docker-share"

## Nodenv
#export PATH="$HOME/.nodenv/bin:$PATH"
#eval "$(nodenv init -)"

# Colours
export RED=$(echo -en '\033[00;31m')
export GREEN=$(echo -en '\033[00;32m')
export LIGHT_BLUE=$(echo -en '\033[00;94m')
export BLUE=$(echo -en '\033[00;34m')
export MAGENTA=$(echo -en '\033[00;35m')
export LIGHT_MAGENTA=$(echo -en '\033[00;95m')
export YELLOW=$(echo -en '\033[00;33m')
export WHITE=$(echo -en '\033[01;37m')
export BOLD=$(echo -en '\e[31m')
export RESET_COLOUR=$(echo -en '\033[0m')

# Virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/code
export VIRTUALENVWRAPPER_PYTHON=/opt/homebrew/bin/python3
# source /opt/homebrew/bin/virtualenvwrapper.sh

# Krew: Package manager for k8s
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

[[ -f "$HOME/vars.sh" ]] && . "$HOME/vars.sh"
# [[ -f /lxhome/alissala/.virtualenvs/w/bin/activate ]] && . /lxhome/alissala/.virtualenvs/w/bin/activate
[[ -f "$HOME/bin/z.sh" ]] && . "$HOME/bin/z.sh"
. "$HOME/.cargo/env"
