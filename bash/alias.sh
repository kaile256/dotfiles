#!/usr/bin/env bash

## From: .bashrc
## CAUTION: Write, in xdg.sh, alias for XDG Base Repository specification.
set -Cu

export 'LS_OPTION'='--color=auto'
alias ls="ls --color=auto"
alias la="ls --color=auto -A"
alias ll="ls --color=auto -l"
alias  l="ls --color=auto -lA"

### w3m
type w3m > /dev/null && alias w3m="w3m https://duckduckgo.com/?q="
