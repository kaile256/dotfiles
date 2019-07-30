"""" From: tool.toml

"""" CONFIG
let g:openbrowser_search_engines = {
      \   'example': 'http://example.com/search?q={query}',
      \   'weblio': 'https://ejje.weblio.jp/content/{query}?erl=true',
      \ }

" 0: go to the browser.
" 1: stay on vim.
let g:openbrowser_force_foreground_after_open = 1

"""" KEYMAP
" smart-search detects if it is URI or not.
""" Under Cursor
nmap gb <Plug>(openbrowser-smart-search)

""" Prompt
nmap <a-b><a-b> :OpenBrowserSmartSearch -duckduckgo 

""" GitHub
nmap <a-b><a-h> :OpenBrowserSmartSearch -github 

""" Wikipedia
nmap <a-b><a-p> :OpenBrowserSmartSearch -wikipedia 
