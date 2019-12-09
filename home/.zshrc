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

vmware-mount-path() {
  host_path="${1?:Usage: vmware-mount <host_path> <guest_path>}"
  guest_path="${2?:Usage: vmware-mount <host_path> <guest_path>}"
  /usr/bin/vmhgfs-fuse .host:$host_path $guest_path -o subtype=vmhgfs-fuse,allow_other -o uid=1000 -o gid=1000 -o umask=0033
}

vmware-mount() {
  echo 'No mounts declared'
#  vmware-mount-path code /home/la/code
}


include $HOME/.zshrc_personal

# Turn off clippy-esque correction suggestions
unsetopt correct_all

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/la/npm/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/la/npm/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/la/npm/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/la/npm/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/la/npm/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /home/la/npm/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh