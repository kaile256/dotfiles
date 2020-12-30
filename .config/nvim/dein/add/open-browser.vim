" From: web.toml
" Repo: tyru/open-browser.vim
" Another: source/open-browser.vim

" Cabbrs {{{1
" Abbr; Search Engine
cnoreabbr <expr> gb (getcmdtype() == ':' && getcmdline() =~ '^gb$')? 'OpenBrowserSmartSearch' : 'gb'
" Engine; Rendering
cnoreabbr <expr> dk (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch dk$')? '-duckduckgo' : 'dk'
cnoreabbr <expr> go (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch go$')? '-google'     : 'go'
" Engine; git
cnoreabbr <expr> gh (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch gh$')? '-github'     : 'gh'
" Engine; Wiki
" Wiki; Archwiki
cnoreabbr <expr> ar (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch ar$')? '-archwiki@en'     : 'wr'
cnoreabbr <expr> aw (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch aw$')? '-archwiki@en'     : 'aw'
cnoreabbr <expr> aj (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch aj$')? '-archwiki@ja'     : 'aj'
" Wiki; Wikipedia
cnoreabbr <expr> wk (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch wk$')? '-wikipedia'  : 'wk'
" Engine; Dictionary
" Dictionary; Weblio
cnoreabbr <expr> wl (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch wl$')? '-weblio'        : 'wl'
" Dictionary; Thesaurus
cnoreabbr <expr> W  (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch W$')?  '-thesaurus'     : 'W'
cnoreabbr <expr> th (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch th$')? '-thesaurus'     : 'th'
" Dictionary; DiCtionary
cnoreabbr <expr> K  (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch K$')?  '-dictionary@en' : 'K'
cnoreabbr <expr> dc (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch dc$')? '-dictionary@en' : 'dc'

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
      \ 'A': 'archwiki@en',
      \ 'B': 'duckduckgo',
      \ 'D': 'duckduckgo',
      \ 'H': 'http://github.com/',
      \ 'K': 'wikipedia',
      \ 'L': 'gitlab',
      \ 'T': 'thesaurus',
      \ 'W': 'weblio',
      \ }
for s:key in keys(s:key2engine)
  exe 'nnoremap <silent>' s:prefix_for_openbrowser . s:key
        \ ':<c-u>call <SID>openbrowser_in(' string(s:key2engine[s:key]) ')<cr>'
  exe 'xnoremap <silent>' s:prefix_for_openbrowser . s:key
        \ ':call <SID>openbrowser_in(' string(s:key2engine[s:key]) ', "x")<cr>'
endfor
unlet s:key s:key2engine s:prefix_for_openbrowser
