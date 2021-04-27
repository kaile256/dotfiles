" From: insert.toml
" Repo: cohama/lexima.vim

let s:default_pumblend = &pumblend
function! s:reset_to_default(opt_name) abort
  call setbufvar(0, '&'. a:opt_name, {'s:default_'. a:opt_name})
endfunction
inoremap <expr> <C--> pumvisible() ? '<Cmd>setlocal pumblend+=5<CR>' : lexima#expand('<C-->', 'i')
inoremap <expr> <C-+> pumvisible() ? '<Cmd>setlocal pumblend-=5<CR>' : lexima#expand('<C-+>', 'i')
inoremap <expr> <C-=> pumvisible() ? '<Cmd>call <SID>reset_to_default("pumblend")<CR>' : lexima#expand('<C-=>', 'i')
