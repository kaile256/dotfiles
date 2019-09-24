" From: finder.toml
" Repo: haya14busa/vim-asterisk

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
xnoremap <expr><silent> x (line("'<") == line("'>"))? asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0}) .'dgn': 'x'
xnoremap <expr><silent> s (line("'<") == line("'>"))? asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0}) .'Plug>(asterisk-gz*)cgn': 's'

" Note: when over lines, keep blockwise even on X/S, unrepeatable.
xnoremap <expr><silent> X (line("'<") == line("'>"))? asterisk#do(mode(1), {'direction' : 0, 'do_jump' : 0, 'is_whole' : 0}) .'<Plug>(asterisk-gz#)dgN': 'x'
xnoremap <expr><silent> S (line("'<") == line("'>"))? asterisk#do(mode(1), {'direction' : 0, 'do_jump' : 0, 'is_whole' : 0}) .'<Plug>(asterisk-gz#)cgN': 's'
