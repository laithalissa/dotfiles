# zshenv contains important env vars to be made available
# for all types of shell. See http://zsh.sourceforge.net/Intro/intro_3.html
export CODE_DIR="$HOME/code"
export SCRIPTS="$HOME/scripts"
export PATH=$PATH:$SCRIPTS
[[ -f "$SCRIPTS/get-paths" ]] && export PATH=$PATH:`$SCRIPTS/get-paths`
export DOTFILES="$CODE_DIR/dotfiles/home"

# Virtual environments
export WORKON_HOME=~/.virtualenvs
## Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
source $HOME/.rvm/scripts/rvm
## Nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"
