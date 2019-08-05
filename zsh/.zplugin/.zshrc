# no .zshenv; use only .profile.

. "${ZDOTDIR}/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin

type zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

## Common Config
source ~/.config/bash/.bashrc

## Prompt Theme
zplugin ice wait'!0'
zplugin snippet OMZ::themes/steeef.zsh-theme

## Lazy Plugins
zplugin ice wait'!0'
zplugin light zsh-users/zsh-autosuggestions
zplugin ice wait'!0'
zplugin light zsh-users/zsh-completions
zplugin ice wait'!0'
zplugin light zdharma/fast-syntax-highlighting
zplugin ice wait'!0'
zplugin light junegunn/fzf

zpcompinit -C

#this must be at the end of the file for SDKMAN to work!!!
export SDKMAN_DIR="/home/ktigre/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"
