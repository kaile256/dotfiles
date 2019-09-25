" From: web.toml
" Repo: tyru/open-browser.vim

" Let; Specify Browser {{{
let g:openbrowser_browser_commands = [
      \ {'name': 'qutebrowser', 'args': ['{browser}', '{uri}']},
      \ {'name': 'w3m',         'args': ['{browser}', '{uri}']}
      \ ]
"}}}
" 0: go to the browser.
" 1: stay on vim.
let g:openbrowser_force_foreground_after_open = 0
" Let; Search Engine
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
" Abbr; Search Engine {{{1
cnoreabbr <expr> gb (getcmdtype() == ':' && getcmdline() =~ '^gb$')? 'OpenBrowserSmartSearch' : 'gb'
"" Engine; Rendering
cnoreabbr <expr> dk (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch dk$')? '-duckduckgo' : 'dk'
cnoreabbr <expr> go (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch go$')? '-google'     : 'go'
"" Engine; git
cnoreabbr <expr> gh (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch gh$')? '-github'     : 'gh'
"" Engine; Wiki {{{2
""" Wiki; Archwiki
cnoreabbr <expr> ar (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch ar$')? '-archwiki@en'     : 'wr'
cnoreabbr <expr> aw (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch aw$')? '-archwiki@en'     : 'aw'
cnoreabbr <expr> aj (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch aj$')? '-archwiki@ja'     : 'aj'
""" Wiki; Wikipedia
cnoreabbr <expr> wk (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch wk$')? '-wikipedia'  : 'wk'
"" Engine; Dictionary {{{2
""" Dictionary; Weblio
cnoreabbr <expr> wl (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch wl$')? '-weblio'        : 'wl'
""" Dictionary; Thesaurus
cnoreabbr <expr> W  (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch W$')?  '-thesaurus'     : 'W'
cnoreabbr <expr> th (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch th$')? '-thesaurus'     : 'th'
""" Dictionary; DiCtionary
cnoreabbr <expr> K  (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch K$')?  '-dictionary@en' : 'K'
cnoreabbr <expr> dc (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch dc$')? '-dictionary@en' : 'dc'
" Keymap; Open Current File
"" Current File; Command! {{{1
"command! CurrentFileOnBrowser exe 'OpenBrowser' 'ftp:///' . expand('%:p:gs?\\?/?')
command! CurrentFileOnBrowser exe 'OpenBrowser' . expand('%:p:gs?\\?/?')
"" Current File; Get Current file {{{1
nnoremap <silent> g% :<c-u>CurrentFileOnBrowser<cr>
nnoremap <silent> g5 :<c-u>CurrentFileOnBrowser<cr>

" Keymap; Open Words/URL under Cursor
"" Cursor; 'Go to Browser' {{{1
" Notice: `smart-search` detects whether it is URI or not.
nmap gb <Plug>(openbrowser-smart-search)
vmap gb <Plug>(openbrowser-smart-search)
" Cursor; Go to Browser with <cWORD>
nmap gB :<c-u>OpenBrowserSmartSearch <c-r><c-a> <cr>
vmap gB :<c-u>OpenBrowserSmartSearch <c-r><c-a> <cr>
"" Cursor; GitHub "{{{1
nmap gh :<c-u>OpenBrowserSmartSearch -github <c-r><c-w> <cr>
vmap gh :<c-u>OpenBrowserSmartSearch -github <c-r><c-w> <cr>
"" Cursor; Github's repository "{{{1
nmap gH :<c-u>OpenBrowserSmartSearch http://github.com/<c-r><c-f> <cr>
vmap gH :<c-u>OpenBrowserSmartSearch http://github.com/<c-r><c-f> <cr>
"}}}
"" Cursor; Gitlab
nmap gl :<c-u>OpenBrowserSmartSearch -gitlab    <c-r><c-w> <cr>
vmap gl :<c-u>OpenBrowserSmartSearch -gitlab    <c-r><c-w> <cr>
" Cursor; Gitlab's repository
nmap gL :<c-u>OpenBrowserSmartSearch -gitlab    <c-r><c-f> <cr>
vmap gL :<c-u>OpenBrowserSmartSearch -gitlab    <c-r><c-f> <cr>
"" Cursor; Dictionary "{{{1
""" Dictionary; Go to the free dictionary
" Mnemonic: default `K`
nmap gK :<c-u>OpenBrowserSmartSearch -dictionary@en <c-r><c-w> <cr>
vmap gK :<c-u>OpenBrowserSmartSearch -dictionary@en <c-r><c-a> <cr>
""" Dictionary; Get Words on thesaurus
nmap gW :<c-u>OpenBrowserSmartSearch -thesaurus <c-r><c-w> <cr>
vmap gW :<c-u>OpenBrowserSmartSearch -thesaurus <c-r><c-a> <cr>
"""" Dictionary; webLio
