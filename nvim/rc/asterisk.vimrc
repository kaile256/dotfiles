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

" DotRepeatable Operation; Manual Substitute
" Note: at normal mode, start a manual substitution of <cword>.
nmap <silent> ms <Plug>(asterisk-gz*)cgn
nmap <silent> mS <Plug>(asterisk-gz#)cgN

" DotRepeatable Operation; in visual mode
" Note: when over lines, just remove that, but unrepeatable.
xmap <expr><silent> x (line("'<") == line("'>"))? '<Plug>(asterisk-gz*)dgn': 'x'
xmap <expr><silent> s (line("'<") == line("'>"))? '<Plug>(asterisk-gz*)cgn': 's'

" Note: when over lines, keep blockwise even on X/S, unrepeatable.
xmap <expr><silent> X (line("'<") == line("'>"))? '<Plug>(asterisk-gz#)dgN': 'x'
xmap <expr><silent> S (line("'<") == line("'>"))? '<Plug>(asterisk-gz#)cgN': 's'
