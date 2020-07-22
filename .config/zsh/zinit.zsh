#!/usr/bin/env zsh

# From: .zshrc
# Repo: zdharma/zinit
# Ref: $HOME/.zinit

# Install zinit if have not
type zinit >/dev/null 2>&1 || \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

source $HOME/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Excerpt: (zdharma/zinit)
# 'lucid': Skip `Loaded ...` msg for `wait`, etc.
# 'silent': Addition to 'lucid', mute `stderr` & `stdout` of plugins/snippets.
#
# 'as': `as`"program" (or `as"command` as the alias) will add the
#       scripts/programs to `$PATH`, instead of sourcing the programs.

zinit light mafredri/zsh-async

zinit ice lucid from"gh-r" \
  as"command" pick"starship" \
  atload"!eval \$(starship init zsh)"
zinit light starship/starship

zinit ice lucid wait"!0" \
  atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit ice lucid wait \
  atpull"zinit creinstall -q ."
zinit light zsh-users/zsh-completions

zinit ice lucid wait"!1" \
  atinit"zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

# LS COLOR
zinit ice lucid wait"!1" \
  pick"c.zsh" nocompile'!' \
  atclone"dircolors -b LS_COLORS > c.zsh" \
  atpull'%atclone'
zinit light trapd00r/LS_COLORS

zinit ice lucid wait'!0'; zinit light vintersnow/anyframe
zinit ice lucid wait'!0'; zinit light b4b4r07/enhancd

zinit ice lucid wait"0" \
  as"command" pick"bin/git-fuzzy"
zinit light bigH/git-fuzzy
