"""" From: tool.toml
"""" Help: openbrowser

" OpenBrowser; Let {{{
let g:openbrowser_force_foreground_after_open = 0

""" Search Engine
let g:openbrowser_default_search = 'duckduckgo'

let g:openbrowser_browser_commands = [
      \ {"name": "qutebrowser", "args": ["{browser}", "{uri}"]},
      \ {"name": "w3m",         "args": ["{browser}", "{uri}"]}
      \ ]

"" Let; List of Search Engines {{{
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
"}}}

" OpenBrowser; Keymap {{{
"" Keymap; Current File {{{
""" Current File; Command! {{{
"command! CurrentFileOnBrowser exe "OpenBrowser" "ftp:///" . expand('%:p:gs?\\?/?')
command! CurrentFileOnBrowser exe "OpenBrowser" . expand('%:p:gs?\\?/?')
"}}}

"" Current File; Get Current file "{{{
nnoremap <silent> g% :<c-u>CurrentFileOnBrowser<cr>
nnoremap <silent> g5 :<c-u>CurrentFileOnBrowser<cr>
nnoremap <silent> gc :<c-u>CurrentFileOnBrowser<cr>
"}}}

"" Keymap; Under Cursor {{{
""" Cursor; 'Go to Browser' "{{{
" Notice: `smart-search` detects whether it is URI or not.
nmap gb <Plug>(openbrowser-smart-search)
vmap gb <Plug>(openbrowser-smart-search)
"}}}

""" Cursor; Wiki "{{{
"""" Dictionary; wikiPedia "{{{
nmap gp :<c-u>OpenBrowserSmartSearch -wikipedia <c-r><c-w> <cr>
vmap gp :<c-u>OpenBrowserSmartSearch -wikipedia <c-r><c-a> <cr>
"}}}

"""" Wiki; Archwiki {{{
"""" Archwiki; @en
nmap ga :<c-u>OpenBrowserSmartSearch -archwiki@en <c-r><c-w> <cr>
vmap ga :<c-u>OpenBrowserSmartSearch -archwiki@en <c-r><c-a> <cr>

"""" Archwiki; @ja
nmap gj :<c-u>OpenBrowserSmartSearch -archwiki@ja <c-r><c-w> <cr>
vmap gj :<c-u>OpenBrowserSmartSearch -archwiki@ja <c-r><c-a> <cr>
"}}}

""" Cursor; GitHub "{{{
nmap gh :<c-u>OpenBrowserSmartSearch http://github.com/<c-r><c-w> <cr>
vmap gh :<c-u>OpenBrowserSmartSearch http://github.com/<c-r><c-a> <cr>

"""" Github; Github's Repository
nmap gr :<c-u>OpenBrowserSmartSearch http://github.com/<c-r><c-a> <cr>
vmap gr :<c-u>OpenBrowserSmartSearch http://github.com/<c-r><c-a> <cr>
"}}}

""" Cursor; Dictionary "{{{
"""" Dictionary; Go to the free dictionary
" Mnemonic: default `K`
nmap gK :<c-u>OpenBrowserSmartSearch -dictionary@en <c-r><c-w> <cr>
vmap gK :<c-u>OpenBrowserSmartSearch -dictionary@en <c-r><c-a> <cr>
"}}}

""" Dictionary; Get Words
nmap gw :<c-u>OpenBrowserSmartSearch -thesaurus <c-r><c-w> <cr>
vmap gw :<c-u>OpenBrowserSmartSearch -thesaurus <c-r><c-a> <cr>

"""" Dictionary; webLio
nmap gL :<c-u>OpenBrowserSmartSearch -weblio    <c-r><c-w> <cr>
vmap gL :<c-u>OpenBrowserSmartSearch -weblio    <c-r><c-a> <cr>
"}}}

" Keymap; Commandline {{{
"" Commandline; Prompt {{{
" Mnemonic: Go to Browser
" CAUTION: c_^b is conflicted on Emacs-like keybind.
nnoremap <a-g><a-b> :<c-u>OpenBrowserSmartSearch<space>
nnoremap <a-g>b     :<c-u>OpenBrowserSmartSearch<space>
cnoremap <a-g><a-b> :<c-u>OpenBrowserSmartSearch<space>
cnoremap <a-g>b     :<c-u>OpenBrowserSmartSearch<space>
"}}}

" Commandline; Abbr {{{
"" Abbr; Search Engine {{{0
""" Engine; Duckduckgo {{{
cnoreabbrev <expr> dk (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch dk$')? '-duckduckgo' : 'dk'
"}}}

""" Engine; Google {{{
cnoreabbrev <expr> go (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch go$')? '-google'     : 'go'
"}}}

""" Engine; GitHub {{{
cnoreabbrev <expr> gh (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch gh$')? '-github'     : 'gh'
"}}}

""" Engine; Wiki {{{
"""" Wiki; Archwiki {{{
cnoreabbrev <expr> ar (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch ar$')? '-archwiki@en'     : 'wr'
cnoreabbrev <expr> aw (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch aw$')? '-archwiki@en'     : 'aw'
cnoreabbrev <expr> aj (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch aj$')? '-archwiki@ja'     : 'aj'
"}}}

"""" Wiki; Wikipedia {{{
cnoreabbrev <expr> wk (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch wk$')? '-wikipedia'  : 'wk'
"}}}

""" Engine; Dictionary {{{
"""" Dictionary; Weblio
cnoreabbrev <expr> wl (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch wl$')? '-weblio'     : 'wl'

"""" Dictionary; Thesaurus "{{{
cnoreabbrev <expr> gw (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch gw$')? '-thesaurus'     : 'gw'
cnoreabbrev <expr> th (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch th$')? '-thesaurus'     : 'th'
"}}}

"""" Dictionary; DiCtionary "{{{
cnoreabbrev <expr> dc (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch dc$')? '-dictionary@en'     : 'dc'
"}}}
"}}}
"}}}
"}}}
"}}}
"}}}
"}}}
"}}}
