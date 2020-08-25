" TOML: public.toml
" Repo: kaile256/vim-doppelganger

if &ft !~# 'react$' | finish | endif

let b:doppelganger_pairs = [
      \ [' = styled\..*`$', '^\s*`;\?$']
      \ ]
