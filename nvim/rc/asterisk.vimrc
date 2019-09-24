" From: finder.toml
" Repo: haya14busa/asterisk.vim

" Note: Few case to expect exclusive search
nmap *  <Plug>(asterisk-gz*)
nmap g* <Plug>(asterisk-g*)
nmap #  <Plug>(asterisk-gz#)
nmap g# <Plug>(asterisk-g#)

xmap *  <Plug>(asterisk-gz*)
xmap g* <Plug>(asterisk-g*)
xmap #  <Plug>(asterisk-gz#)
xmap g# <Plug>(asterisk-g#)

" DotRepeatable Operation
" TODO: if over multiple lines, just remove but unrepeatable
xmap <expr><silent> x (line("'<") == line("'>"))? '<Plug>(asterisk-gz*)dgn': 'x'
xmap <expr><silent> s (line("'<") == line("'>"))? '<Plug>(asterisk-gz*)cgn': 's'

" Note: Keep blockwise even on X/S.
xmap <expr><silent> X (line("'<") == line("'>"))? '<Plug>(asterisk-gz#)dgN': 'x'
xmap <expr><silent> S (line("'<") == line("'>"))? '<Plug>(asterisk-gz#)cgN': 's'

" From normal mode, to the word on cursor.
" Note: Do you want to sleep?; default [N]gs prevents cursor-move.
nmap <silent> gs <Plug>(asterisk-gz*)cgn
nmap <silent> gS <Plug>(asterisk-gz#)cgN
