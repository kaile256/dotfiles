" From: insert.toml
" Repo: cohama/lexima.vim

let s:default_pumblend = &g:pumblend
let s:default_winblend = &g:winblend
function! s:reset_to_default(opt_name) abort
  " TODO: Adjust options globally.
  call setwinvar(0, '&'. a:opt_name, {'s:default_'. a:opt_name})
endfunction
inoremap <expr> <C--> pumvisible() ? '<Cmd>setlocal pumblend+=5<CR>' : lexima#expand('<C-->', 'i')
inoremap <expr> <C-+> pumvisible() ? '<Cmd>setlocal pumblend-=5<CR>' : lexima#expand('<C-+>', 'i')
inoremap <expr> <C-=> pumvisible() ? '<Cmd>call <SID>reset_to_default("pumblend")<CR>' : lexima#expand('<C-=>', 'i')

nnoremap <C--> <Cmd>setlocal winblend+=5<CR>
nnoremap <C-+> <Cmd>setlocal winblend-=5<CR>
nnoremap <C-=> <Cmd>call <SID>reset_to_default("winblend")<CR>
