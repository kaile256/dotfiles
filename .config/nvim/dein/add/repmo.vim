" TOML: default.toml
" Repo: Houl/repmo-vim
" Another: post/repmo.vim

map <expr> [c repmo#Key('<Plug>(GitGutterPrevHunk)', '<Plug>(GitGutterNextHunk)')
map <expr> ]c repmo#Key('<Plug>(GitGutterNextHunk)', '<Plug>(GitGutterPrevHunk)')
sunmap [c
sunmap ]c

map <expr> f repmo#ZapKey('<Plug>(shot-f-f)')
map <expr> F repmo#ZapKey('<Plug>(shot-f-F)')
map <expr> t repmo#ZapKey('<Plug>(shot-f-t)')
map <expr> T repmo#ZapKey('<Plug>(shot-f-T)')
sunmap f
sunmap F
sunmap t
sunmap T

