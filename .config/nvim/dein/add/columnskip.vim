" TOML: motion.toml
" Repo: tyru/columnskip.vim

map <space> <sid>
sunmap <space>

map <sid>j <Plug>(columnskip:nonblank:next)
map <sid>k <Plug>(columnskip:nonblank:prev)

" map \ <sid>(first)
" map <sid>(first)j <Plug>(columnskip:first-nonblank:next)
" map <sid>(first)k <Plug>(columnskip:first-nonblank:prev)
