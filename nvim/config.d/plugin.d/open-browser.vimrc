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
