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
" Make it work as an operater, not only on <cword>
nmap <silent> ms <Plug>(asterisk-gz*)cgn
nmap <silent> mS <Plug>(asterisk-gz*)cgN

" TODO: DotSubstitute as an Operator, using g@
"nnoremap <expr><silent> <Plug>(asterisk-dot-substitute-delete-upward)
"      \ (line("'<") == line("'>"))? asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
"nnoremap <expr><silent> <Plug>(asterisk-dot-substitute-delete-downward)
"      \ (line("'<") == line("'>"))? asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
"nnoremap <expr><silent> <Plug>(asterisk-dot-substitute-change-upward)
"      \ (line("'<") == line("'>"))? asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
"nnoremap <expr><silent> <Plug>(asterisk-dot-substitute-change-downward)
"      \ (line("'<") == line("'>"))? asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-delete-upward)
      \ (line("'<") == line("'>"))? asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'dgN': 'd'
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-delete-downward)
      \ (line("'<") == line("'>"))? asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'dgn': 'd'
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-change-upward)
      \ (line("'<") == line("'>"))? asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'cgN': 'c'
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-change-downward)
      \ (line("'<") == line("'>"))? asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'cgn': 'c'
" TODO: Manual Substitute by Paste
command! -nargs=+ PasteDotSubstituteUpward
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-paste-upward)
      \ (line("'<") == line("'>"))? asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'cgn<c-r>"': 'p'
xnoremap <expr><silent> <Plug>(asterisk-dot-substitute-paste-downward)
      \ (line("'<") == line("'>"))? asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
      \ .'pgN': 'P'

" DotRepeatable Operation; in visual mode
" Note: when over lines, just remove that, but unrepeatable.
" Note: x/s work duplicated with d/c respectively.
xmap x <Plug>(asterisk-dot-substitute-delete-downward)
xmap s <Plug>(asterisk-dot-substitute-change-downward)
" Note: when over lines, keep blockwise even on X/S, unrepeatable.
xmap X <Plug>(asterisk-dot-substitute-delete-upward)
xmap S <Plug>(asterisk-dot-substitute-change-upward)
