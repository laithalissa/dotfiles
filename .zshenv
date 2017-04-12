# zshenv contains important env vars to be made available
# for all types of shell. See http://zsh.sourceforge.net/Intro/intro_3.html
export SCRIPTS="$HOME/scripts"
export PATH=$PATH:$SCRIPTS
export PATH=$PATH:`$SCRIPTS/get-paths`
export PATH=$PATH:"$HOME/lib/appengine/"
export DOTFILES="$HOME/dotfiles"
# Source boxen stuff here so it's available in other places (e.g. vim)
. /opt/boxen/env.sh
# Golang
export PATH=$PATH:/opt/boxen/homebrew/opt/go/libexec/bin
# Docker
export DOCKER_VOLUMES='/Users/laithal/docker-share'
export JIRA_URL='https://greenmangaming.atlassian.net'
