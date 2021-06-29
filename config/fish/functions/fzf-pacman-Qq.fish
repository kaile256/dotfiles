function fzf-pacman-Qq -d "Fuzzy-find installed package"
  pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)' --bind 'alt-x:execute(sudo pacman -Rs {})'
end
