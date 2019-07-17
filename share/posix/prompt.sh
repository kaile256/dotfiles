## PROMPT_GIT; Plugin
PROMPT_GIT="${XDG_CACHE_HOME}/bash/repos/github.com/magicmonty/bash-git-prompt/gitprompt.sh"
if [ -e "${PROMPT_GIT}" ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  source "${PROMPT_GIT}"
fi

