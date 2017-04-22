# zshenv contains important env vars to be made available
# for all types of shell. See http://zsh.sourceforge.net/Intro/intro_3.html
export SCRIPTS="$HOME/scripts"
export PATH=$PATH:$SCRIPTS
export PATH=$PATH:`$SCRIPTS/get-paths`
export PATH=$PATH:"$HOME/lib/appengine/"
export DOTFILES="$HOME/dotfiles"
