" TOML: web.toml
" Repo: ka-tsu-mo/at-vim-coder

let g:at_vim_coder_workspace = $MY_DEV .'/atcoder'

" default: 'C++14 (5.4.1)'
" available: 'C++14 (5.4.1)', 'Go (1.6)' or 'Python3 (3.4.3)'; or
" 'C++ (9.2.1)', 'Go (1.14.1)' or 'Python (3.8.2)' to solve problem abc162 or later
" " let g:at_vim_coder_language = ''

command! -bar AtVimCoderTest        :call at_vim_coder#contest#test()
command! -bar AtVimCoderSubmit      :call at_vim_coder#contest#submit()
command! -bar AtVimCoderCheckStatus :call at_vim_coder#contest#check_status()
