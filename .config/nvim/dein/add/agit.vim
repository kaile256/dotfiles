" From: git.toml
" Repo: cohama/agit.vim
" Another: source/agit.vim

command! -bar GlogGlobal :Agit
command! -bar Gl         :Agit
command! -bar Glo        :Agit
command! -bar Glog       :Agit

command! -bar GlogLocal  :AgitFile
command! -bar Gll        :AgitFile

nnoremap <silent> <space>gl :<c-u>AgitFile<cr>
nnoremap <silent> <space>gL :<c-u>Agit<cr>
