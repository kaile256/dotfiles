# no .zshenv; use only .profile.
## Common Config

#### Ref: https://github.com/zdharma/zplugin#installation
## NOTICE: should be read at first.
. "${ZDOTDIR}/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
type zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

SourceFile=(
# CAUTION: xdg.sh should be sourced BEFORE path.sh.
xdg.sh
env.sh
path.sh
alias.sh
)
for i in ${SourceFile[@]}; do
  source ~/.config/bash/$i
done
#source ~/.config/bash/xdg.sh
#source ~/.config/bash/env.sh
#source ~/.config/bash/path.sh
#source ~/.config/bash/alias.sh
#source ~/.config/bash/prompt.sh

## Prompt Theme
# good on vim-term to two-row prompt to yank.
zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure

zplugin light zsh-users/zsh-autosuggestions
#zplugin light zsh-users/zsh-completions
zplugin light zdharma/fast-syntax-highlighting

# FZF
zplugin ice from"gh-r" as"program"; zplugin load junegunn/fzf-bin

## LS COLOR
zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zplugin light trapd00r/LS_COLORS

zpcompinit -C
