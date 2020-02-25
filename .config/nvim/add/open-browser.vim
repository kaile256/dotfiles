" From: web.toml
" Repo: tyru/open-browser.vim
" Another: source/open-browser.vim

command! -range -nargs=* -bar Browser :OpenBrowserSmartSearch <args>

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

" Keymaps "{{{1
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
nmap <space>bB <Plug>(openbrowser-smart-search)
xmap <space>bB <Plug>(openbrowser-smart-search)
" Cursor; Go to Browser with <cWORD>, <c-r><c-a>
nnoremap <space>ba :<c-u>OpenBrowserSmartSearch <c-r><c-a> <cr>
xnoremap <space>ba :OpenBrowserSmartSearch<cr>
" Cursor; GitHub
nnoremap <space>bh :<c-u>OpenBrowserSmartSearch -github <c-r><c-w> <cr>
xnoremap <space>bh :OpenBrowserSmartSearch -github <c-r><c-a> <cr>
" Cursor; Github's repository
nnoremap <space>bH :<c-u>OpenBrowserSmartSearch http://github.com/<c-r><c-f> <cr>
xnoremap <space>bH :OpenBrowserSmartSearch http://github.com/<c-r><c-a> <cr>

" Cursor; Gitlab
nnoremap <space>bl :<c-u>OpenBrowserSmartSearch -gitlab    <c-r><c-w> <cr>
xnoremap <space>bl :OpenBrowserSmartSearch -gitlab    <c-r><c-a> <cr>
" Cursor; Gitlab's repository
nnoremap <space>bL :<c-u>OpenBrowserSmartSearch -gitlab    <c-r><c-f> <cr>
xnoremap <space>bL :OpenBrowserSmartSearch -gitlab    <c-r><c-a> <cr>
" Cursor; Dictionary
" Dictionary; Go to the free dictionary
" Mnemonic: default `K`
nnoremap <space>bK :<c-u>OpenBrowserSmartSearch -dictionary@en <c-r><c-w> <cr>
xnoremap <space>bK :OpenBrowserSmartSearch -dictionary@en <c-r><c-a> <cr>
nnoremap <space>bT :<c-u>OpenBrowserSmartSearch -thesaurus <c-r><c-w> <cr>
xnoremap <space>bT :OpenBrowserSmartSearch -thesaurus <c-r><c-a> <cr>

nnoremap <space>bW :<c-u>OpenBrowserSmartSearch -weblio <c-r><c-w> <cr>
xnoremap <space>bW :OpenBrowserSmartSearch -weblio <c-r><c-a> <cr>
