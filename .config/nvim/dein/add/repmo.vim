" TOML: default.toml
" Repo: Houl/repmo-vim
" Another: post/repmo.vim

noremap <SID>(zv) :<C-u>sleep 5m<CR>zv
nmap <expr><silent> [x repmo#Key('<Plug>(coc-diagnostic-prev)', '<Plug>(coc-diagnostic-next)') .'<SID>(zv)'
nmap <expr><silent> ]x repmo#Key('<Plug>(coc-diagnostic-next)', '<Plug>(coc-diagnostic-prev)') .'<SID>(zv)'
xmap <expr><silent> [x repmo#Key('<Plug>(coc-diagnostic-prev)', '<Plug>(coc-diagnostic-next)') .'<SID>(zv)'
xmap <expr><silent> ]x repmo#Key('<Plug>(coc-diagnostic-next)', '<Plug>(coc-diagnostic-prev)') .'<SID>(zv)'

nmap <expr> [c repmo#Key('<Plug>(GitGutterPrevHunk)', '<Plug>(GitGutterNextHunk)')
nmap <expr> ]c repmo#Key('<Plug>(GitGutterNextHunk)', '<Plug>(GitGutterPrevHunk)')
xmap <expr> [c repmo#Key('<Plug>(GitGutterPrevHunk)', '<Plug>(GitGutterNextHunk)')
xmap <expr> ]c repmo#Key('<Plug>(GitGutterNextHunk)', '<Plug>(GitGutterPrevHunk)')

map <expr> f repmo#ZapKey('<Plug>(shot-f-f)')
map <expr> F repmo#ZapKey('<Plug>(shot-f-F)')
map <expr> t repmo#ZapKey('<Plug>(shot-f-t)')
map <expr> T repmo#ZapKey('<Plug>(shot-f-T)')
sunmap f
sunmap F
sunmap t
sunmap T

