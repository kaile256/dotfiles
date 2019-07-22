## PROMPT_GIT; Plugin
PROMPT_GIT="${XDG_CACHE_HOME}/bash/repos/github.com/magicmonty/bash-git-prompt/gitprompt.sh"
if [ -e "${PROMPT_GIT}" ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  source "${PROMPT_GIT}"
fi


# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

#### Prompt
### Color
#export   black="\[\033[0;90m\]"
#export     red="\[\033[0;91m\]"
#export   green="\[\033[0;92m\]"
#export  yellow="\[\033[0;93m\]"
#export    blue="\[\033[0;94m\]"
#export  purple="\[\033[0;95m\]"
#export    cyan="\[\033[0;96m\]"
#export   white="\[\033[0;97m\]"
#
### Bold
#export   bcyan="\[\033[1;96m\]"
#
### Dim color
#export  dgreen="\[\033[0;32m\]"
#export dyellow="\[\033[0;33m\]"
#export   dcyan="\[\033[0;36m\]"
#export  dwhite="\[\033[0;37m\]"
#
### Info
#export      user="\u"
#export  hostname="\h"
#export  shortPWD="\w"
#export gitBranch='$(__git_ps1)'
#
### Prompt Form
##export PS1="\[\033[0;91m\]\u \[\033[0;97m\]@ \[\033[0;95m\]\h \[\033[0;92m\]\W\[\033[0;96m\] $(__git_ps1)  \n\[\033[0;97m\]\$\[\033[0;96m\] "
##export PS1="${red}${user} ${white}@ ${purple}${hostname} ${green}${shortPWD}${cyan}${gitBranch} \n${white}\$${cyan} "
#
##if [ "$color_prompt" = yes ]; then
##    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
##else
##    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
##fi
#unset color_prompt force_color_prompt
#
