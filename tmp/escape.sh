#### From: pkgm.sh

#### LANGUAGE
### Python
type python3 || {
  echo "Installing python3..."
  sudo $INSTALL python3
}

#type python3 || {
#  echo "Installing python3..."
#  sudo pacman -S python3
#} || {
#  type apt && {
#  echo "Installing python3..."
#  sudo apt install python3
#}
#}
#}

## pip
type pip3 || {
  type pacman && {
  echo "Installing pip3..."
  sudo pacman -S pip3
} || {
  type apt && {
  echo "Installing pip3..."
  sudo apt install pip3
}
}
}

### pyenv
#type pyenv || {
#  type pacman && {
#  echo "Installing pyenv..." 
#  sudo pacman -S pyenv 
#} || {
#  echo "Installing pyenv..."
#  curl https://pyenv.run | bash
#  eval "$(pyenv init -)"
#  eval "$(pyenv virtualenv-init -)"
#  echo "Done!"
#}
#}

### Ruby
type ruby || {
  type pacman && {
  echo "Installing ruby..."
  sudo pacman -S ruby
} || {
  type apt && {
  echo "Installing ruby..."
  sudo apt install ruby
}
}
}

### Rust
## Cargo
#&& [ ! -d /data/data/com.termux  # ???
type cargo || {
  echo "Installing cargo..."
  type pacman && sudo pacman -S cargo || {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
      source ~/.local/share/cargo/env
      ## TODO: del lines including '.cargo' in .profile.
      echo "Done"
    }
}

### Go
type go || {
  type pacman && {
  echo "Installing go..."
  sudo pacman -S go
} || {
  type apt && {
  echo "Installing go..."
  sudo apt install go
}
}
}

## ghq
type ghq || {
  echo "Installing ghq..."
  go get github.com/motemen/ghq
}


### Nodejs
## npm
#type npm || {
#  echo "Installing npm..."
#  sudo apt install npm
#  ## LSP
#  npm i -g bash-language-server
#}

## yarn
type yarn || {
  type pacman && {
  echo "Installing yarn..."
  sudo pacman -S yarn
  #type apt && {
  #  echo "Installing yarn..."
  #  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  #  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  #  echo "Update apt for yarn!"
  #  sudo apt update && sudo apt install yarn
  #  echo "Done! Yarn is Ready!!"
  #}
}

# Neovim
yarn global add neovim
# LSP
yarn global add bash-language-server
}

### Anyenv
type anyenv || {
  type pacman && {
  echo "Installing anyenv..."
  sudo pacman -S anyenv
} || {
  type yay && {
  echo "Installing anyenv..."
  sudo yay -S anyenv
}
}
} && {
  type pyenv || {
  type pacman && {
  echo "Installing pyenv..." 
  sudo pacman -S pyenv 
} || {
  echo "Installing pyenv..."
  curl https://pyenv.run | bash
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  echo "Done!"
}
} && {
  type pipenv || {
  type pacm a

