" From: appearance.toml
" Repo: wellle/context.vim
" Another: post/context.vim

let g:context_add_mappings = 0

nnoremap <silent><expr> H context#util#map_H()

nnoremap <silent><expr> zz context#util#map('zz')
nnoremap <silent><expr> zb context#util#map('zb')
nnoremap <silent><expr> zt context#util#map_zt()

nnoremap <silent><expr> <c-e> context#util#map('<C-e>')
nnoremap <silent><expr> <c-y> context#util#map('<C-y>')
nnoremap <silent><expr> <c-u> context#util#map('<C-u>')
nnoremap <silent><expr> <c-d> context#util#map('<C-d>')

