"" Auto-Install: fzf
if executable('fzf')
  if executable('apt')
  call system('sudo apt install fzf')
  if executable('pacman')
  call system('sudo pacman -Sy fzf')
endif
