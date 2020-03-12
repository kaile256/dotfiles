# Install zinit if have not
# Ref: https://github.com/zdharma/zinit#installation
# WARNING: no use to install the other directory
. "${XDG_CONFIG_HOME}/zinit/bin/zinit.zsh"

type zinit >/dev/null 2>&1 || sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

#declare -A ZPLGM
#ZPLGM=(
#  ['BIN_DIR']="$HOME/.config/zinit/bin"
#  ['HOME_DIR']="$HOME/.config/zinit"
#  ['PLUGINS_DIR']="$HOME/.config/zinit/plugins"
#  ['COMPLETIONS_DIR']="$HOME/.config/zinit/completions"
#  ['SNIPPETS_DIR']="$HOME/.config/zinit/snippets"
#  ['ZCOMPDUMP_PATH']="$HOME/.config/zinit"
#  ['COMPINIT_OPTS']="$HOME/.config/zinit"
#  ['MUTE_WARNINGS']=0
#)

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
#### End of Zplugin's installer chunk ####

zinit light "mafredri/zsh-async"
# Prompt Theme
# good on vim-term to two-row prompt to yank.
#zinit ice pick"async.zsh" src"pure.zsh"; zinit light sindresorhus/pure
zinit ice rc"polyglot.plugin.zsh"; zinit light "agkozak/polyglot"
#zinit ice src"spaceship.zsh"; zinit light denysdovhan/spaceship-prompt

zinit ice wait"!0" atload"_zsh_autosuggest_start"
zinit light "zsh-users/zsh-autosuggestions"
zinit light "zsh-users/zsh-completions"
zinit light "zdharma/fast-syntax-highlighting"

# FZF
zinit ice from"gh-r" as"program"; zinit load "junegunn/fzf-bin"
# LS COLOR
zinit ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zinit light "trapd00r/LS_COLORS"

zinit ice wait'!0'; zinit light "vintersnow/anyframe"
zinit ice wait'!0'; zinit light "b4b4r07/enhancd"
zinit ice wait'!0'; zinit light "lukechilds/zsh-nvm"
##zinit ice wait'!0'; zinit light "greymd/tmux-xpanes"
#
zinit ice wait"!0" atinit"zpcompinit; zpcdreplay"
zinit light "zsh-users/zsh-syntax-highlighting"


