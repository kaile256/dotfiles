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
# Prompt Theme; use starship instead in .zshenv
# good on vim-term to two-row prompt to yank.
#zinit ice pick"async.zsh" src"pure.zsh"; zinit light sindresorhus/pure
#zinit ice src"spaceship.zsh"; zinit light denysdovhan/spaceship-prompt
#zinit ice rc"polyglot.plugin.zsh"; zinit light "agkozak/polyglot"

zinit ice wait"!0" atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions
# zinit light zsh-users/zsh-completions
zinit light zdharma/fast-syntax-highlighting

# LS COLOR
zinit ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zinit light trapd00r/LS_COLORS

zinit ice wait'!0'; zinit light vintersnow/anyframe
zinit ice wait'!0'; zinit light b4b4r07/enhancd
# zinit ice wait'!0'; zinit light lukechilds/zsh-nvm
##zinit ice wait'!0'; zinit light greymd/tmux-xpanes
