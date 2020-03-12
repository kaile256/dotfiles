#### Install Zplugin if have not ####
# Ref: https://github.com/zdharma/zplugin#installation
# WARNING: no use to install the other directory
. "${XDG_CONFIG_HOME}/zplugin/bin/zplugin.zsh"
type zplugin >> /dev/null || sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/mod-install.sh)"

declare -A ZPLGM
ZPLGM=(
  ['BIN_DIR']="$HOME/.config/zplugin/bin"
  ['HOME_DIR']="$HOME/.config/zplugin"
  ['PLUGINS_DIR']="$HOME/.config/zplugin/plugins"
  ['COMPLETIONS_DIR']="$HOME/.config/zplugin/completions"
  ['SNIPPETS_DIR']="$HOME/.config/zplugin/snippets"
  ['ZCOMPDUMP_PATH']="$HOME/.config/zplugin"
  ['COMPINIT_OPTS']="$HOME/.config/zplugin"
  ['MUTE_WARNINGS']=0
)

autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
#### End of Zplugin's installer chunk ####

zplugin light "mafredri/zsh-async"
# Prompt Theme
# good on vim-term to two-row prompt to yank.
#zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure
zplugin ice rc"polyglot.plugin.zsh"; zplugin light "agkozak/polyglot"
#zplugin ice src"spaceship.zsh"; zplugin light denysdovhan/spaceship-prompt

zplugin ice wait"!0" atload"_zsh_autosuggest_start"
zplugin light "zsh-users/zsh-autosuggestions"
zplugin light "zsh-users/zsh-completions"
zplugin light "zdharma/fast-syntax-highlighting"

# FZF
zplugin ice from"gh-r" as"program"; zplugin load "junegunn/fzf-bin"
# LS COLOR
zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zplugin light "trapd00r/LS_COLORS"

zplugin ice wait'!0'; zplugin light "vintersnow/anyframe"
zplugin ice wait'!0'; zplugin light "b4b4r07/enhancd"
zplugin ice wait'!0'; zplugin light "lukechilds/zsh-nvm"
##zplugin ice wait'!0'; zplugin light "greymd/tmux-xpanes"
#
zplugin ice wait"!0" atinit"zpcompinit; zpcdreplay"
zplugin light "zsh-users/zsh-syntax-highlighting"


