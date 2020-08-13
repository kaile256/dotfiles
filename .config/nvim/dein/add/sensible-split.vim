" TOML: private.toml
" Repo: $DEIN_PRIVATE_HOME/vim-sensible-split

" nnoremap <C-w>s <C-w><C-s>
" nnoremap <C-w>v <C-w><C-v>

" nnoremap <silent> <C-w>s :<C-u> SensibleSplit <CR>
" nnoremap <silent> <C-w>v :<C-u> SensibleSplit <CR>
" nnoremap <silent> <C-w>S :<C-u> abo SensibleSplit <CR>
" nnoremap <silent> <C-w>V :<C-u> abo SensibleSplit <CR>

nmap gf <Plug>(sensible-gf)
xmap gf <Plug>(sensible-gf)
nmap <C-w>f <Plug>(sensible-ctrl-w_f)
xmap <C-w>f <Plug>(sensible-ctrl-w_f)

function! s:scratch(open) abort
  "let prefix = '/tmp/foo.'
  let prefix = tempname()
  let ext = expand('%:e')
  let path = prefix .'.'. (empty(ext) ? 'md' : ext)
  exe a:open path
endfunction

nnoremap <silent> <c-w>n :<c-u>call <SID>scratch(sensible#split())<cr>
nmap <c-w><C-n> <c-w>n

