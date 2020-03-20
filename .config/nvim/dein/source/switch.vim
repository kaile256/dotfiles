" TOML: motion.toml
" Repo: AndrewRadev/switch.vim
" Another: add/switch.vim

"let g:switch_find_smallest_match = 0

" override to suppress default one
let g:switch_mapping = ''
" let g:switch_reverse_mapping = ''

" \<foo\> doesn't work well; return '<foo>'(with '<>') when '\<foo\>'
" it doesn't seem to expect regexp
" let g:switch_custom_definitions = [ ]

if exists('#mySwitchAdd')
  au! mySwitchAdd
endif
augroup mySwitchAdd
  au FileType vim      call s:switch_vim()
  au FileType java     call s:switch_java()
  au FileType markdown call s:switch_markdown()
augroup END

let g:switch_custom_definitions = [
      \ ['next', 'prev'],
      \ ]

function! s:switch_vim() "{{{1
  let b:switch_custom_definitions = [
        \ ['noremap',  'nnoremap', 'xnoremap'],
        \ ['inoremap', 'cnoremap', 'tnoremap'],
        \ ['<silent>', '<script>'],
        \ ['==', '!='],
        \ ]
endfunction

function! s:switch_java() "{{{1
  let b:switch_custom_definitions = [
        \   [0, 'null'],
        \   ['private', 'protected', 'public']
        \ ]
endfunction

function! s:switch_markdown() "{{{1
  let b:switch_custom_definitions = [
        \ ['first', 'second', 'third']
        \ ]
endfunction
