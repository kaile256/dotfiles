" From: tool.toml
" Help: openbrowser

" OpenBrowser; Let {{{
let g:openbrowser_browser_commands = [
      \ {'name': 'qutebrowser', 'args': ['{browser}', '{uri}']},
      \ {'name': 'w3m',         'args': ['{browser}', '{uri}']}
      \ ]

" 0: go to the browser.
" 1: stay on vim.
let g:openbrowser_force_foreground_after_open = 1

""" Search Engine
let g:openbrowser_default_search = 'duckduckgo'

let g:openbrowser_search_engines = {
      \ 'alc': 'http://eow.alc.co.jp/{query}/UTF-8/',
      \ 'archwiki@en': 'https://wiki.archlinux.org/index.php?search={query}',
      \ 'archwiki@ja': 'https://wiki.archlinux.jp/index.php?search={query}',
      \ 'askubuntu': 'http://askubuntu.com/search?q={query}',
      \ 'baidu': 'http://www.baidu.com/s?wd={query}&rsv_bp=0&rsv_spt=3&inputT=2478',
      \ 'blekko': 'http://blekko.com/ws/+{query}',
      \ 'cpan': 'http://search.cpan.org/search?query={query}',
      \ 'devdocs': 'http://devdocs.io/#q={query}',
      \ 'duckduckgo': 'http://duckduckgo.com/?q={query}',
      \ 'github': 'http://github.com/search?q={query}',
      \ 'google': 'http://google.com/search?q={query}',
      \ 'google-code': 'http://code.google.com/intl/en/query/#q={query}',
      \ 'php': 'http://php.net/{query}',
      \ 'python': 'http://docs.python.org/dev/search.html?q={query}&check_keywords=yes&area=default',
      \ 'dictionary@en': 'https://www.thefreedictionary.com/{query}',
      \ 'thesaurus': 'https://www.freethesaurus.com/{query}',
      \ 'twitter-search': 'http://twitter.com/search/{query}',
      \ 'twitter-user': 'http://twitter.com/{query}',
      \ 'verycd': 'http://www.verycd.com/search/entries/{query}',
      \ 'vim': 'http://www.google.com/cse?cx=partner-pub-3005259998294962%3Abvyni59kjr1&ie=ISO-8859-1&q={query}&sa=Search&siteurl=www.vim.org%2F#gsc.tab=0&gsc.q={query}&gsc.page=1',
      \ 'weblio': 'https://ejje.weblio.jp/content/{query}?erl=true',
      \ 'wikipedia': 'http://en.wikipedia.org/wiki/{query}',
      \ 'wikipedia-ja': 'http://ja.wikipedia.org/wiki/{query}',
      \ 'yahoo': 'http://search.yahoo.com/search?p={query}',
      \ }
"}}}

" Keymap; Open Current File {{{
"" Current File; Command!
"command! CurrentFileOnBrowser exe 'OpenBrowser' 'ftp:///' . expand('%:p:gs?\\?/?')
command! CurrentFileOnBrowser exe 'OpenBrowser' . expand('%:p:gs?\\?/?')

"" Current File; Get Current file
nnoremap <silent> g% :<c-u>CurrentFileOnBrowser<cr>
nnoremap <silent> g5 :<c-u>CurrentFileOnBrowser<cr>
"}}}

" Keymap; Open words/url under Cursor "{{{
"" Cursor; 'Go to Browser'
" Notice: `smart-search` detects whether it is URI or not.
nmap gb <Plug>(openbrowser-smart-search)
vmap gb <Plug>(openbrowser-smart-search)
" Cursor; Go to Browser with <cWORD>
nmap gB :<c-u>OpenBrowserSmartSearch <c-r><c-a> <cr>
vmap gB :<c-u>OpenBrowserSmartSearch <c-r><c-a> <cr>

"" Cursor; Wiki {{{
""" Wiki; wikiPedia
"nmap gp :<c-u>OpenBrowserSmartSearch -wikipedia <c-r><c-w> <cr>
"vmap gp :<c-u>OpenBrowserSmartSearch -wikipedia <c-r><c-a> <cr>

""" Wiki; Archwiki @en
"nmap ga :<c-u>OpenBrowserSmartSearch -archwiki@en <c-r><c-w> <cr>
"vmap ga :<c-u>OpenBrowserSmartSearch -archwiki@en <c-r><c-a> <cr>

""" Wiki; Archwiki @ja
"nmap gj :<c-u>OpenBrowserSmartSearch -archwiki@ja <c-r><c-w> <cr>
"vmap gj :<c-u>OpenBrowserSmartSearch -archwiki@ja <c-r><c-a> <cr>
"}}}

"" Cursor; GitHub "{{{
nmap gh :<c-u>OpenBrowserSmartSearch -github <c-r><c-w> <cr>
vmap gh :<c-u>OpenBrowserSmartSearch -github <c-r><c-a> <cr>

""" Github; Github's Repository
nmap gr :<c-u>OpenBrowserSmartSearch http://github.com/<c-r><c-f> <cr>
vmap gr :<c-u>OpenBrowserSmartSearch http://github.com/<c-r><c-f> <cr>
"}}}

"" Cursor; Dictionary "{{{
""" Dictionary; Go to the free dictionary
" Mnemonic: default `K`
nmap gK :<c-u>OpenBrowserSmartSearch -dictionary@en <c-r><c-w> <cr>
vmap gK :<c-u>OpenBrowserSmartSearch -dictionary@en <c-r><c-a> <cr>

""" Dictionary; Get Words on thesaurus
nmap gw :<c-u>OpenBrowserSmartSearch -thesaurus <c-r><c-w> <cr>
vmap gw :<c-u>OpenBrowserSmartSearch -thesaurus <c-r><c-a> <cr>

"""" Dictionary; webLio
nmap gL :<c-u>OpenBrowserSmartSearch -weblio    <c-r><c-w> <cr>
vmap gL :<c-u>OpenBrowserSmartSearch -weblio    <c-r><c-a> <cr>
"}}}
"}}}

"" Commandline; Prompt {{{
" Mnemonic: Go to Browser
" CAUTION: c_^b is conflicted on Emacs-like keybind.
nnoremap <a-g><a-b> :<c-u>OpenBrowserSmartSearch<space>
nnoremap <a-g>b     :<c-u>OpenBrowserSmartSearch<space>
cnoremap <a-g><a-b> :<c-u>OpenBrowserSmartSearch<space>
cnoremap <a-g>b     :<c-u>OpenBrowserSmartSearch<space>
"}}}

" Abbr; Search Engine {{{
cnoreabbr <expr> gb (getcmdtype() == ':' && getcmdline() =~ '^gb$')? 'OpenBrowserSmartSearch' : 'gb'

cnoreabbr <expr> gh (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch gh$')? '-github'     : 'gh'
cnoreabbr <expr> dk (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch dk$')? '-duckduckgo' : 'dk'
cnoreabbr <expr> go (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch go$')? '-google'     : 'go'

"" Engine; Wiki
""" Wiki; Archwiki
cnoreabbr <expr> ar (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch ar$')? '-archwiki@en'     : 'wr'
cnoreabbr <expr> aw (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch aw$')? '-archwiki@en'     : 'aw'
cnoreabbr <expr> aj (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch aj$')? '-archwiki@ja'     : 'aj'

""" Wiki; Wikipedia
cnoreabbr <expr> wk (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch wk$')? '-wikipedia'  : 'wk'

"" Engine; Dictionary
""" Dictionary; Weblio
cnoreabbr <expr> wl (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch wl$')? '-weblio'     : 'wl'

""" Dictionary; Thesaurus
cnoreabbr <expr> gw (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch gw$')? '-thesaurus'     : 'gw'
cnoreabbr <expr> th (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch th$')? '-thesaurus'     : 'th'

""" Dictionary; DiCtionary
cnoreabbr <expr> dc (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch dc$')? '-dictionary@en'     : 'dc'
cnoreabbr <expr> K (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch K$')? '-dictionary@en'     : 'K'

" Note: You can apply Only a pair of abbribiations for each set of characters respectively.
"cnoreabbr <expr> gh (getcmdtype() == ':' && getcmdline() =~ '^gh$')? 'OpenBrowserSmartSearch  -github'     : 'gh'
"cnoreabbr <expr> dk (getcmdtype() == ':' && getcmdline() =~ '^dk$')? 'OpenBrowserSmartSearch  -duckduckgo' : 'dk'
"cnoreabbr <expr> wk (getcmdtype() == ':' && getcmdline() =~ '^wk$')? 'OpenBrowserSmartSearch  -wikipedia'  : 'wk'
"cnoreabbr <expr> wl (getcmdtype() == ':' && getcmdline() =~ '^wl$')? 'OpenBrowserSmartSearch  -weblio'     : 'wl'
"cnoreabbr <expr> go (getcmdtype() == ':' && getcmdline() =~ '^go$')? 'OpenBrowserSmartSearch -google'     : 'go'
"}}}
