" TOML: motion.toml
" Repo: deris/vim-shot-f
" Another: source/shot-f.vim

if len(mapcheck('f', 'n')) != 0 | finish | endif

map f <Plug>(shot-f-f)
map F <Plug>(shot-f-F)
map t <Plug>(shot-f-t)
map T <Plug>(shot-f-T)
sunmap f
sunmap F
sunmap t
sunmap T

" function! s:shot(f) abort
"   " FIXME: <Plug>(shot-f-f) will invoke but finish without waiting input.

"   let s:save_concealcursor = &concealcursor
"   set concealcursor=
"   augroup myShot-restore
"     au!
"     au CursorMoved * ++once let &concealcursor = s:save_concealcursor
"     au CursorMoved * ++once unlet s:save_concealcursor
"   augroup END
"   exe "norm \<Plug>(shot-f-". a:f .')'
" endfunction
