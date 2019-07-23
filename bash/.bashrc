#### From: '.profile'

umask 022

source ~/.config/bash/preinstall.sh
source ~/.config/bash/xdg.sh
source ~/.config/bash/env.sh

export BASH_HOME="$HOME/.config/bash"

source "${BASH_HOME}/path.sh"
source "${BASH_HOME}/alias.sh"
