#!/usr/bin/env bash

set -Ceu

PYENV="/usr/local/pyenv"
sudo git clone git://github.com/yyuu/pyenv.git ${PYENV}
sudo mkdir -p ${PYENV}/versions ${PYENV}/shims

sudo git clone git://github.com/yyuu/pyenv-virtualenv.git ${PYENV}/plugins

PYENV_SH=/etc/profile.d/pyenv.sh
if ! [ -f ${PYENV_SH} ]; then

  echo 'export PYENV_ROOT="${PYENV}"' |
  sudo tee -a "${PYENV_SH}"
  echo 'export PATH="${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${PATH}"' |
  sudo tee -a "${PYENV_SH}"

  source ${PYENV_SH}
  pyenv --version
fi
