## Provided by NS, seemingly makes sure GPT_TTY is the _current_ shell
if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx GPG_TTY (tty)
end

## ASDF stuff
source /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.fish

## direnv
direnv hook fish | source

## Jump
jump shell fish | source

## Set path
fish_add_path /home/laith/.local/bin /home/laith/scripts/files/ /home/laith/scripts /home/laith/scripts/fish /home/laith/scripts/kubernetes/

# Hishtory Config:
export PATH="$PATH:/home/laith/.hishtory"
source /home/laith/.hishtory/config.fish
