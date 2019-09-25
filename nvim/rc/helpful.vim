" From: tool.toml
" Repo: tweekmonster/helpful.vim

command! -nargs=+ -complete=help Version call helpful#lookup('<args>')
