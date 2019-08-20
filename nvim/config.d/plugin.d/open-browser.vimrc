"""" From: tool.toml
"""" Help: openbrowser

" OpenBrowser; Command! {{{
"command! CurrentFileOnBrowser execute "OpenBrowser" "ftp:///" . expand('%:p:gs?\\?/?')
command! CurrentFileOnBrowser execute "OpenBrowser" . expand('%:p:gs?\\?/?')
"}}}

"""" KEYMAP
"" NOTICE: do you use other editors?
nnoremap <silent> g% :<c-u>CurrentFileOnBrowser<cr>
nnoremap <silent> g5 :<c-u>CurrentFileOnBrowser<cr>
nnoremap <silent> gc :<c-u>CurrentFileOnBrowser<cr>

" smart-search detects if it is URI or not.
""" Under Cursor
nmap gb <Plug>(openbrowser-smart-search)
vmap gb <Plug>(openbrowser-smart-search)
nmap gh :<c-u>OpenBrowserSmartSearch -github    <c-r><c-f> <cr>
vmap gh :<c-u>OpenBrowserSmartSearch -github    <c-r><c-f> <cr>
nmap gw :<c-u>OpenBrowserSmartSearch -wikipedia <c-r><c-f> <cr>
vmap gw :<c-u>OpenBrowserSmartSearch -wikipedia <c-r><c-f> <cr>
nmap gl :<c-u>OpenBrowserSmartSearch -weblio    <c-r><c-f> <cr>
vmap gl :<c-u>OpenBrowserSmartSearch -weblio    <c-r><c-f> <cr>
"" TODO: work on other engines.
"nmap gp :OpenBrowserSmartSearch -wikipedia <c-r>=expand('<cWORD>')<cr><cr>
"vmap gp :OpenBrowserSmartSearch -wikipedia <c-r>=expand('<cWORD>')<cr><cr>

""" Prompt
"" Mnemonic: Go to Browser
"" CAUTION: c_^b is conflicted on Emacs-like keybind.
nnoremap <a-g><a-b> :<c-u>OpenBrowserSmartSearch<space>
nnoremap <a-g>b     :<c-u>OpenBrowserSmartSearch<space>
cnoremap <a-g><a-b> :<c-u>OpenBrowserSmartSearch<space>
cnoremap <a-g>b     :<c-u>OpenBrowserSmartSearch<space>

" OpenBrower; Abbr {{{
""" Abbr; Search Engine {{{0
"" Duckduckgo
cnoreabbrev <expr> dk (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch dk$')? '-duckduckgo' : 'dk'
"" Google
cnoreabbrev <expr> go (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch go$')? '-google'     : 'go'
"" GitHub
cnoreabbrev <expr> gh (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch gh$')? '-github'     : 'gh'
"" Wikipedia
cnoreabbrev <expr> wk (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch wk$')? '-wikipedia'  : 'wk'
"" Weblio
cnoreabbrev <expr> wl (getcmdtype() == ':' && getcmdline() =~ '^OpenBrowserSmartSearch wl$')? '-weblio'     : 'wl'
"}}}

" OpenBrowser; Let {{{
let g:openbrowser_browser_commands = [
      \ {"name": "qutebrowser", "args": ["{browser}", "{uri}"]},
      \ {"name": "w3m",         "args": ["{browser}", "{uri}"]}
      \ ]

" 0: go to the browser.
" 1: stay on vim.
let g:openbrowser_force_foreground_after_open = 1

""" Search Engine
let g:openbrowser_default_search = 'duckduckgo'

let g:openbrowser_search_engines = {
      \ 'alc': 'http://eow.alc.co.jp/{query}/UTF-8/',
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
