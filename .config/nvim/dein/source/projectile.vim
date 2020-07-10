" TOML: denite.toml
" Repo: dunstontc/projectile.nvim

if executable('rg')
  let g:projectile#search_prog = 'rg'
endif

let g:projectile#enable_devicons = 2 " 0 to disable; 1 for devicon; 2 for unicode-icon
