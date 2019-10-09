" From: init.vim

nnoremap <silent> K :<c-u>call among_HML#percent(25)<cr>
nnoremap <silent> J :<c-u>call among_HML#percent(75)<cr>
" TODO: default should operate linewise.
onoremap <silent> K :call among_HML#percent(25)<cr>
onoremap <silent> J :call among_HML#percent(75)<cr>
xnoremap <silent> K <Cmd>call among_HML#percent(25)<cr>
xnoremap <silent> J <Cmd>call among_HML#percent(75)<cr>

nnoremap gK K
nnoremap <space>J J
xnoremap gK K
xnoremap <space>J J

let g:mylib_window_weed_windows = [
      \ 'fugitive:\/\/',
      \ 'twiggy:\/\/',
      \ ]

let g:mylib_keymap_split_list = {
      \ 'edit': '<a-e>',
      \ 'split': '<a-s>',
      \ 'vsplit': '<a-v>',
      \ 'tabe': '<a-t>',
      \ 'float': '<a-f>',
      \ }

augroup MylibCalls
  " TODO: w/o autocmd
  au! VimEnter * call keymap#generater('<space>t', ':te', 'fish')
augroup END

