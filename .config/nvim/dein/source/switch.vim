" TOML: motion.toml
" Another: add/switch.vim

"let g:switch_find_smallest_match = 0

" override to suppress default one
let g:switch_mapping = ''
" let g:switch_reverse_mapping = ''

" \<foo\> doesn't work well; return '<foo>'(with '<>') when '\<foo\>'
" it doesn't seem to expect regexp
" let g:switch_custom_definitions = [ ]

augroup mySwitchSourceOnFileType
  au!
  au FileType java call s:switch_java()
augroup END

function! s:switch_java() "{{{1
  let b:switch_custom_definitions = [
        \   [0, 'null'],
        \   ['public', 'private', 'protected']
        \ ]
endfunction
