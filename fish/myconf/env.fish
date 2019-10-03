set -x DEVROOT "$HOME/dev"
# GO
set -x GOPATH "$DEVROOT/go"
set -x PATH "$GOPATH/bin" $PATH
set -x GOENV_ROOT "$GOPATH/env/.goenv"

# Python
set -x PYENV_ROOT "$DEVROOT/env/.pyenv"
set -x PATH "$PYENV_ROOT/bin $PATH"
source (pyenv init - | psub)
