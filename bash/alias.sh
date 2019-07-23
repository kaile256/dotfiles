#!/usr/bin/env bash

set -Ceu

## By bashrc
## CAUTION: Write, in xdg.sh, alias for XDG Base Repository specification.
export 'LS_OPTION'='--color=auto'
alias ls="ls $LS_OPTION"
alias la="ls $LS_OPTION -A"
alias ll="ls $LS_OPTION -l"
alias  l="ls $LS_OPTION -lA"
