# zshenv contains important env vars to be made available
# for all types of shell. See http://zsh.sourceforge.net/Intro/intro_3.html
export SCRIPTS="$HOME/scripts"
export CODE="$HOME/Code"
export PATH=$PATH:$SCRIPTS
if [ -f "$SCRIPTS/get-paths" ]; then
  export PATH=$PATH:`$SCRIPTS/get-paths`
fi
export DOTFILES="$HOME"
export WORKON_HOME=~/.virtualenvs
