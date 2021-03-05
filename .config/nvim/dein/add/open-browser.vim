" From: web.toml
" Repo: tyru/open-browser.vim
" Another: source/open-browser.vim

function! s:openbrowser_in(engine, ...) abort "{{{1
  let engine = a:engine =~# '/$'
        \ ? a:engine
        \ : '-'. a:engine .' '

  let words = get(a:, 1, '') ==# 'x'
        \ ? getline('.')[col("'<") - 1 : col("'>") - 1]
        \ : engine =~# '/$'
        \   ? expand('<cfile>')
        \   : expand('<cword>')

  let args = engine . words

  echo 'OpenBrowserSmartSearch '. args
  exe  'OpenBrowserSmartSearch '. args
endfunction

let s:prefix_for_openbrowser = '<space>b'
let s:key2engine = {
      \ 'H': 'http://github.com/',
      \ 'Y': 'duckduckgo&year',
      \ 'M': 'duckduckgo&month',
      \ 'W': 'duckduckgo&week',
      \ 'D': 'duckduckgo&day',
      \
      \ 'd': 'duckduckgo',
      \ 'a': 'archwiki@en',
      \ 'k': 'wikipedia',
      \ 'l': 'gitlab',
      \ 't': 'thesaurus',
      \ 'w': 'weblio',
      \ }
for s:key in keys(s:key2engine)
  exe 'nnoremap <silent>' s:prefix_for_openbrowser . s:key
        \ ':<c-u>call <SID>openbrowser_in(' string(s:key2engine[s:key]) ')<cr>'
  exe 'xnoremap <silent>' s:prefix_for_openbrowser . s:key
        \ ':call <SID>openbrowser_in(' string(s:key2engine[s:key]) ', "x")<cr>'
endfor
unlet s:key s:key2engine s:prefix_for_openbrowser
