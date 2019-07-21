"" Auto-Install: ripgrep
let s:cargo_bin = "$HOME/.cargo/bin"

if executable('rg') || exists('s:cargo_bin')
elseif ! exists('s:cargo_bin')
  call system('curl https://sh.rustup.rs -sSf | sh')
  call system('cargo install ripgrep')
else
  call system('cargo install ripgrep')
endif
