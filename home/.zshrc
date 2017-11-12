# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME='robbyrussell'

# Put a theme name in .zshtheme and we'll use it
if [ -f ~/.zshtheme ] ; then
  ZSH_THEME=`cat ~/.zshtheme`
fi

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE='true'

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION='true'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages
  colorize
  docker
  docker-compose
  git
  virtualenvwrapper
  zsh-syntax-highlighting
)

# User configuration
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='vim'
else
 export EDITOR='mvim'
fi

if [ -f ~/scripts/docker-functions ]; then
  . ~/scripts/docker-functions
fi

if [ -f ~/.zshrc_personal ]; then
  . ~/.zshrc_personal
fi

# Needs to be here so work-only plugin deps are on the path
source $ZSH/oh-my-zsh.sh

source ~/.aliases
