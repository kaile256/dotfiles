" From: appearance.toml
" Repo: wellle/context.vim
" Another: source/context.vim
" Another: post/context.vim

nnoremap <silent><expr> H context#util#map_H()

nnoremap <silent><expr> zz context#util#map('zz')
nnoremap <silent><expr> zb context#util#map('zb')
nnoremap <silent><expr> zt context#util#map_zt()

nnoremap <silent><expr> <c-e> context#util#map('<C-e>')
nnoremap <silent><expr> <c-y> context#util#map('<C-y>')

