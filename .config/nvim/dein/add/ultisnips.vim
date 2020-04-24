" TOML: insert.toml
" Repo: SirVer/ultisnips
" Another: source/ultisnips.vim
" Another: post/ultisnips.vim

imap <c-\> <SID>(ultisnips-expand-or-jump)
nmap <c-\> <SID>(ultisnips-expand-or-jump)
smap <c-\> <SID>(ultisnips-expand-or-jump)
xmap <c-\> <SID>(ultisnips-expand-or-jump)

inoremap <silent> <SID>(ultisnips-expand-or-jump) <C-r>=UltiSnips#ExpandSnippetOrJump()<CR>
nnoremap <silent> <SID>(ultisnips-expand-or-jump) :<C-u>call UltiSnips#ExpandSnippetOrJump()<CR>
" Note: :vmap at once returns weird numbers.
snoremap <script> <SID>(ultisnips-expand-or-jump) <Esc><SID>(ultisnips-expand-or-jump)
xnoremap <script> <SID>(ultisnips-expand-or-jump) <Esc><SID>(ultisnips-expand-or-jump)

" WIP:
noremap <silent> <a-s><a-p> :<c-u>UltiSnipsEdit<cr>
