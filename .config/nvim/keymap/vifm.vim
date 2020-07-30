" From: init.vim
" Ref: open_terminal.vim
" Another: rc/vifm.vim

" Note: keep Vifm in rc/vifm.vim because it uses local function.
nnoremap <silent> <A-x><space> :<C-u>vert top 35 Vifm<CR>

nnoremap <silent> <A-x><A-e> :<C-u>     Vifm<CR>
nnoremap <silent> <A-x><A-s> :<C-u>bel  Vifm<CR>
nnoremap <silent> <A-x><A-b> :<C-u>bot  Vifm<CR>
nnoremap <silent> <A-x><A-t> :<C-u>tab  Vifm<CR>
nnoremap <silent> <A-x><A-v> :<C-u>vert Vifm<CR>

nmap <A-x>e <A-x><A-e>
nmap <A-x>s <A-x><A-s>
nmap <A-x>b <A-x><A-b>
nmap <A-x>v <A-x><A-v>
nmap <A-x>t <A-x><A-t>

