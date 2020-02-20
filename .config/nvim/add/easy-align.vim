" From: motion.toml
" Repo: junegunn/vim-easy-align

" Excerpt:
" * Filter
"   1.in interactive mode <c-f>: type g/pat/ or v/pat/
"   2.in command-line, after :EasyAlign,
"      put `{'filter': 'g/pat/'}`, or g/pat/ or v/pat/
"      (just type only '/'; no need to type '\/')

" Note: type <c-g> (as ignore-Group) at times required
"let g:easy_align_ignore_groups = ['String'] " default: ['Comment', 'String']

"nnoremap <silent> <Plug>(easy-align-keeping-cursor) :keepjumps<cr><Plug>(EasyAlign)

" Mnemonic: Queue Up!
nmap \q <Plug>(EasyAlign)
xmap \q <Plug>(EasyAlign)

" TODO: not limited to cursorline, but let it behave as an operatopr
nnoremap <silent> <Plug>(EasyAlign-on-space) 0:EasyAlign<cr>$*<space>
xnoremap <silent> <Plug>(EasyAlign-on-space) 0:EasyAlign<cr>$*<space>
nmap \Q <Plug>(EasyAlign-on-space)
xmap \Q <Plug>(EasyAlign-on-space)

"augroup myEasyAlignAdd
"  au FileType vim   call s:keymap_easyalign_vim()
"  au FileType *sql* call s:keymap_easyalign_sql()
"augroup END
"
"function! s:keymap_easyalign_vim() abort "{{{1
"  nnoremap <silent><buffer><expr> <Plug>(EasyAlign-dict)
"        \ getline('.') =~# '^\s*\'
"        \   ? '<Plug>(EasyAlign)i{<cr>2<space>'
"        \   : '<Plug(EasyAlign)i{'
"  xnoremap <silent><buffer><expr> <Plug>(EasyAlign-dict)
"        \ getline("'>") =~# '^\s*\'
"        \   ? '<Plug>(EasyAlign)i{<cr>2<space>'
"        \   : '<Plug(EasyAlign)i{'
"  nmap <buffer> \qi{<space> <Plug>(EasyAlign-dict)
"  xmap <buffer> \qi}<space> <Plug>(EasyAlign-dict)
"endfunction
"
""function! s:keymap_easyalign_sql() abort "{{{1
""  nmap <buffer> \q <Plug>(EasyAlign)i{<cr><space>
""  nmap <buffer> \q <Plug>(EasyAlign)i}<cr><space>
""endfunction
"
