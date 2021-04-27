" From: insert.toml
" Repo: cohama/lexima.vim

let s:default_pumblend = &g:pumblend
let s:default_winblend = &g:winblend
function! s:reset_to_default(opt_name) abort
  for winnr in [1, winnr('$')]
    call setwinvar(winnr, '&'. a:opt_name, {'s:default_'. a:opt_name})
  endfor
endfunction
inoremap <expr> <C--> pumvisible() ? '<Cmd>setlocal pumblend+=5<CR>' : lexima#expand('<C-->', 'i')
inoremap <expr> <C-+> pumvisible() ? '<Cmd>setlocal pumblend-=5<CR>' : lexima#expand('<C-+>', 'i')
inoremap <expr> <C-=> pumvisible() ? '<Cmd>call <SID>reset_to_default("pumblend")<CR>' : lexima#expand('<C-=>', 'i')

inoremap <expr> <C-0>   pumvisible() ? '<Cmd>setlocal pumblend=100<CR>'   : lexima#expand('<C-0>',   'i')
inoremap <expr> <C-S-_> pumvisible() ? '<Cmd>setlocal pumblend=0<CR>' : lexima#expand('<C-S-_>', 'i')

nnoremap <C--> <Cmd>setlocal winblend+=5<CR>
nnoremap <C-+> <Cmd>setlocal winblend-=5<CR>
nnoremap <C-=> <Cmd>call <SID>reset_to_default("winblend")<CR>

nnoremap <C-0>   <Cmd>setlocal winblend=100<CR>
nnoremap <C-S-_> <Cmd>setlocal winblend=0<CR>
