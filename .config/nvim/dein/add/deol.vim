" TOML: shell.toml
" Repo: Shougo/deol.nvim
" Another: source/deol.vim
" Another: post/deol.vim

nnoremap <SID>(deol-insert) <Cmd>Deol <bar> DeolEdit<CR>

nnoremap <script><silent> <A-t>e :<C-u>     <SID>(deol-insert)<CR>
nnoremap <script><silent> <A-t>s :<C-u>sp   <bar>   <SID>(deol-insert)<CR>
nnoremap <script><silent> <A-t>v :<C-u>vs   <bar>   <SID>(deol-insert)<CR>
nnoremap <script><silent> <A-t>t :<C-u>tabe <bar>   <SID>(deol-insert)<CR>
nnoremap <script><silent> <A-t>b :<C-u>bot  sp<bar> <SID>(deol-insert)<CR>

nmap <A-t><A-e> <A-t>e
nmap <A-t><A-s> <A-t>s
nmap <A-t><A-v> <A-t>v
nmap <A-t><A-b> <A-t>b
