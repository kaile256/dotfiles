"""" From: tool.toml

"""" DEFINITION
command! CurrentFileOnBrowser execute "OpenBrowser" "file:///" . expand('%:p:gs?\\?/?')

"""" KEYMAP
nmap g% CurrentFileOnBrowser
" smart-search detects if it is URI or not.
""" Under Cursor
nmap gb <Plug>(openbrowser-smart-search)
nmap gp :OpenBrowserSmartSearch -wikipedia <c-r>=expand('<cword>')

""" Prompt
nmap <a-b> :OpenBrowserSmartSearch 
cmap <a-b> :OpenBrowserSmartSearch 

""" Search Engine
"" Duckduckgo
cmap <a-d> -duckduckgo 

"" GitHub
cmap <a-h> -github 

"" Wikipedia
cmap <a-p> -wikipedia 

"" Weblio
cmap <a-w> -weblio 

"""" GENERAL
" 0: go to the browser.
" 1: stay on vim.
let g:openbrowser_force_foreground_after_open = 1

""" Search Engine
let b:openbrowser_default_search = 'duckduckgo'

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

