" TOML: default.toml
" Repo: Houl/repmo-vim
" Another: post/repmo.vim

" Note:
" #SelfKey() for non-recursive mappings like <C-y> to <C-y>/<C-e>.

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

nnoremap <silent> <Plug>(next-TODO) :<C-u>call search('TODO:', '')<CR>
nnoremap <silent> <Plug>(prev-TODO) :<C-u>call search('TODO:', 'b')<CR>
nmap <expr> [T repmo#Key('<Plug>(prev-TODO)', '<Plug>(next-TODO)')
nmap <expr> ]T repmo#Key('<Plug>(next-TODO)', '<Plug>(prev-TODO)')

nnoremap <expr> g; repmo#Key('g;', 'g,')
nnoremap <expr> g, repmo#Key('g,', 'g;')
xnoremap <expr> g; repmo#Key('g;', 'g,')
xnoremap <expr> g, repmo#Key('g,', 'g;')

