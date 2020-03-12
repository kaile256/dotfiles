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
  source ~/.config/zsh/$i
done

zpcompinit -C
