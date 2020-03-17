" TOML: insert.toml
" Repo: mattn/vim-sonictemplate
" Another: source/sonictemplate.vim
" Else: data/sonictemplate

" intelligent asks which template to use in command line
" the difference than <Plug>(sonictemplate) is the completion
" Note: Vim regards <C-S-_> as <C-_>
imap <C-S-_> <Plug>(sonictemplate-intelligent)
nmap <C-S-_> <Plug>(sonictemplate-intelligent)

imap <c-=> <Plug>(sonictemplate-postfix)
nmap <c-=> <Plug>(sonictemplate-postfix)
