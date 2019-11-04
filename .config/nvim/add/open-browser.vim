" From: web.toml
" Repo: tyru/open-browser.vim
" Another: source/open-browser.vim

command! -nargs=* -bar Browser :OpenBrowserSmartSearch <args>
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

" Keymap; Open Current File
" Current File; Command!
"command! CurrentFileOnBrowser exe 'OpenBrowser' 'ftp:///' . expand('%:p:gs?\\?/?')
command! CurrentFileOnBrowser exe 'OpenBrowser' . expand('%:p:gs?\\?/?')
" Current File; Get Current file
nnoremap <silent> <space>b% :<c-u>CurrentFileOnBrowser<cr>
nnoremap <silent> <space>b5 :<c-u>CurrentFileOnBrowser<cr>

" Keymap; Open Words/URL under Cursor
" Cursor; 'Go to Browser'
" Notice: `smart-search` detects whether it is URI or not.
nmap <space>bb <Plug>(openbrowser-smart-search)
vmap <space>bb <Plug>(openbrowser-smart-search)
" Cursor; Go to Browser with <cWORD>
nmap <space>bB :<c-u>OpenBrowserSmartSearch <c-r><c-a> <cr>
vmap <space>bB :<c-u>OpenBrowserSmartSearch <c-r><c-a> <cr>
" Cursor; GitHub
nmap <space>bh :<c-u>OpenBrowserSmartSearch -github <c-r><c-w> <cr>
vmap <space>bh :<c-u>OpenBrowserSmartSearch -github <c-r><c-w> <cr>
" Cursor; Github's repository
nmap <space>bH :<c-u>OpenBrowserSmartSearch http://github.com/<c-r><c-f> <cr>
vmap <space>bH :<c-u>OpenBrowserSmartSearch http://github.com/<c-r><c-f> <cr>
"}}}
" Cursor; Gitlab
nmap <space>bl :<c-u>OpenBrowserSmartSearch -gitlab    <c-r><c-w> <cr>
vmap <space>bl :<c-u>OpenBrowserSmartSearch -gitlab    <c-r><c-w> <cr>
" Cursor; Gitlab's repository
nmap <space>bL :<c-u>OpenBrowserSmartSearch -gitlab    <c-r><c-f> <cr>
vmap <space>bL :<c-u>OpenBrowserSmartSearch -gitlab    <c-r><c-f> <cr>
" Cursor; Dictionary
" Dictionary; Go to the free dictionary
" Mnemonic: default `K`
nmap <space>bK :<c-u>OpenBrowserSmartSearch -dictionary@en <c-r><c-w> <cr>
vmap <space>bK :<c-u>OpenBrowserSmartSearch -dictionary@en <c-r><c-a> <cr>
" Dictionary; Get Words on thesaurus
nmap <space>bW :<c-u>OpenBrowserSmartSearch -thesaurus <c-r><c-w> <cr>
vmap <space>bW :<c-u>OpenBrowserSmartSearch -thesaurus <c-r><c-a> <cr>
