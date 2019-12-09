# zshenv contains important env vars to be made available
# for all types of shell. See http://zsh.sourceforge.net/Intro/intro_3.html
export CODE_DIR="$HOME/code"
export SCRIPTS="$HOME/scripts"
export USER_BINARIES="$HOME/bin"
export PATH=$PATH:$SCRIPTS:$USER_BINARIES
[[ -f "$SCRIPTS/get-paths" ]] && export PATH=$PATH:`$SCRIPTS/get-paths`
export PATH="$PATH:$HOME/npm/bin"
export NODE_PATH="$NODE_PATH:$HOME/npm/lib/node_modules"
#export DOTFILES="$CODE_DIR/dotfiles/home"
export DOTFILES="$HOME/.homesick/repos/dotfiles/home"
export DOCKER_SHARE="/docker-share"

# Virtual environments
export WORKON_HOME=~/.virtualenvs
## Nodenv
#export PATH="$HOME/.nodenv/bin:$PATH"
#eval "$(nodenv init -)"

# Colours
export RED=$(echo -en '\033[00;31m')
export GREEN=$(echo -en '\033[00;32m')
export YELLOW=$(echo -en '\033[00;33m')
export WHITE=$(echo -en '\033[01;37m')
export BOLD=$(echo -en '\e[31m')
export RESET_COLOUR=$(echo -en '\033[0m')

