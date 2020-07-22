# From: .zshrc
# Repo: zdharma/zinit
# Ref: $HOME/.zinit

# Install zinit if have not
type zinit >/dev/null 2>&1 || \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

source $HOME/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light mafredri/zsh-async
# Prompt Theme; use starship instead in .zshenv
# good on vim-term to two-row prompt to yank.
#zinit ice pick"async.zsh" src"pure.zsh"; zinit light sindresorhus/pure
#zinit ice src"spaceship.zsh"; zinit light denysdovhan/spaceship-prompt
#zinit ice rc"polyglot.plugin.zsh"; zinit light "agkozak/polyglot"

# zinit-zsh/zinit-console depends on zsh/curses
zinit ice id-as"zsh" atclone"./.preconfig
CFLAGS='-I/usr/include -I/usr/local/include -g -O2 -Wall' \
LDFLAGS='-L/usr/lib -L/usr/local/lib' ./configure --prefix='$ZPFX'" \
atpull"%atclone" run-atpull make"install" pick"/dev/null"
zinit load zsh-users/zsh
zinit wait lucid for zinit-zsh/zinit-console

zinit ice wait"!0" atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions
# zinit light zsh-users/zsh-completions
zinit light zdharma/fast-syntax-highlighting

# FZF
zinit ice from"gh-r" as"program"; zinit load junegunn/fzf-bin
# LS COLOR
zinit ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zinit light trapd00r/LS_COLORS

zinit ice wait'!0'; zinit light vintersnow/anyframe
zinit ice wait'!0'; zinit light b4b4r07/enhancd
# zinit ice wait'!0'; zinit light lukechilds/zsh-nvm
##zinit ice wait'!0'; zinit light greymd/tmux-xpanes

zinit ice wait"!0" atinit"zpcompinit; zpcdreplay"
# zinit light zsh-users/zsh-syntax-highlighting
