#!/usr/bin/env zsh

SourceFile=(
  # CAUTION: xdg.sh should be sourced BEFORE path.sh.
  #zplugin.zsh
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

# share with the other terminals
setopt share_history

# no duplicated history
setopt histignorealldups

# cd only with dir name
setopt auto_cd

# fix command failure
setopt correct

# disable <C-s> and <C-q>
setopt no_flow_control
