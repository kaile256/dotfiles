" TOML: insert.toml
" Repo: Ron89/thesaurus_query.vim

nnoremap <silent> <space>bT :<c-u>ThesaurusQueryReplaceCurrentWord<cr>

" TODO: get the last word before cursor
" inoremap <expr><silent> <c-x><c-t>
"      \ 0 == thesaurus_query#Thesaurus_Query_Lookup(matchstr(getline('.'), '\S\+\ze\%#'), 0)
"      \ ? '' : ''
