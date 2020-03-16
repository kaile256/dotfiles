" TOML: insert.toml
" Repo: mattn/vim-sonictemplate
" Another: source/sonictemplate.vim
" Else: data/sonictemplate

" intelligent asks which template to use in command line
" the difference than <Plug>(sonictemplate) is the completion
imap <c-_> <Plug>(sonictemplate-intelligent)
nmap <c-_> <Plug>(sonictemplate-intelligent)

imap <c-=> <Plug>(sonictemplate-postfix)
nmap <c-=> <Plug>(sonictemplate-postfix)
