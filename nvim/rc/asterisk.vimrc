" From: finder.toml
" Repo: asterisk.vim

nmap *  <Plug>(asterisk-z*)
nmap g* <Plug>(asterisk-gz*)
nmap #  <Plug>(asterisk-z#)
nmap g# <Plug>(asterisk-gz#)

xmap *  <Plug>(asterisk-z*)
xmap g* <Plug>(asterisk-gz*)
xmap #  <Plug>(asterisk-z#)
xmap g# <Plug>(asterisk-gz#)

" DotRepeatable Edit
xmap <silent> x <Plug>(asterisk-gz*)dgn
xmap <silent> s <Plug>(asterisk-gz*)cgn
xmap <silent> X <Plug>(asterisk-gz#)dgN
xmap <silent> S <Plug>(asterisk-gz#)cgN
