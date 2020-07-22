#!/usr/bin/env zsh

SourceFile=(
  # CAUTION: xdg.sh should be sourced BEFORE path.sh.
  #env.zsh # includes init XDGs
  #xdg.zsh
  #path.zsh
  alias.zsh
  zinit.zsh
)
for i in ${SourceFile[@]}; do
  source "$HOME/.config/zsh/$i"
done

bindkey -e

setopt appendhistory # instead of overwriting
setopt share_history # share with the other terminals
setopt histignorealldups # no duplicated cmd history (remove older)
setopt auto_cd # cd just with a dir path
setopt correct # Auto correct command failure
setopt no_flow_control # disable <C-s> and <C-q>
setopt nobeep
