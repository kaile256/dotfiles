function myenv
  ## GO
  set -x GOPATH "$HOME/devEnv/go"
  set -x PATH $PATH "$GOPATH/bin"
  set -x GOENV_ROOT "$HOME/devEnv/.goenv"

  ## Python
  set -x PYENV_ROOT "$HOME/devEnv/.pyenv"
  set -x PATH "$PYENV_ROOT/bin $PATH"
  source (pyenv init - | psub)
end
