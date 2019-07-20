"" Auto-Install
let s:cargo_bin = g:xdg_cache_home . '/.cargo/bin'

if executable('rg') || exists('s:cargo_bin')
  let g:rg_highlight = true
  " true: fitde project root from cwd.
  let g:rg_derive_root = true
elseif ! exists('s:cargo_bin')
  call system('curl https://sh.rustup.rs -sSf | sh')
  call system('cargo install ripgrep')
else
  call system('cargo install ripgrep')
endif
