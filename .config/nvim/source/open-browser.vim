" From: web.toml
" Repo: tyru/open-browser.vim
" Another: add/open-browser.vim

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
" List: Registered Search Engines {{{
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
      \ 'go': 'https://golang.org/search?q={query}',
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
      \ } "}}}
