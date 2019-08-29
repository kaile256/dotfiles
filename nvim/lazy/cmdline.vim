" From: init.vim

cnoremap <nowait> <a-k> <c-c>

" Echo file Status {{{
cnoreabbr <expr> es (getcmdtype() == ':' && getcmdline() =~ '^es$')? 'call <SID>echo_file_info()' : 'es'
"}}}

" Typo;
cnoreabbr <expr> man (getcmdtype() == ':' && getcmdline() =~ '^man$')? 'Man' : 'man'

" :tabe;
cnoreabbr <expr> b (getcmdtype() == ':' && getcmdline() =~ '^b$')? 'tabe' : 'b'

" :checkhealth
cnoreabbr <expr> ch (getcmdtype() == ':' && getcmdline() =~ '^ch$')? 'checkhealth <bar> setl bt=quickfix' : 'ch'

" :source {{{
cnoreabbr <expr> sj (getcmdtype() == ':' && getcmdline() =~ '^sj$')? 'so % <bar> echo " Sourced! \--" @%' : 'sj'
cnoreabbr <expr> ss (getcmdtype() == ':' && getcmdline() =~ '^ss$')? 'so % <bar> echo " Sourced! \--" @%' : 'ss'
cnoreabbr <expr> sss (getcmdtype() == ':' && getcmdline() =~ '^sss$')? 'so % <bar> echo " Sourced! \--" @%' : 'sss'
"}}}

" :help {{{
cnoreabbr <expr> hb (getcmdtype() == ':' && getcmdline() =~ '^hb$')? 'tab help' : 'h'
cnoreabbr <expr> bh (getcmdtype() == ':' && getcmdline() =~ '^bh$')? 'tab help' : 'h'
cnoreabbr <expr> hv (getcmdtype() == ':' && getcmdline() =~ '^hv$')? 'vert bel help' : 'h'
cnoreabbr <expr> vh (getcmdtype() == ':' && getcmdline() =~ '^vh$')? 'vert bel help' : 'h'
"}}}

" Open tmp.vim {{{
cnoreabbr <expr> tmp (getcmdtype() == ':' && getcmdline() =~ '^tmp$')? 'e ~/.tmp/tmp.vim' : 'tmp'
cnoreabbr <expr> htm (getcmdtype() == ':' && getcmdline() =~ '^htm$')? 'sp ~/.tmp/tmp.vim' : 'htm'
cnoreabbr <expr> tmh (getcmdtype() == ':' && getcmdline() =~ '^tmh$')? 'sp ~/.tmp/tmp.vim' : 'tmh'
cnoreabbr <expr> vtm (getcmdtype() == ':' && getcmdline() =~ '^vtm$')? 'vs ~/.tmp/tmp.vim' : 'vtm'
cnoreabbr <expr> tmv (getcmdtype() == ':' && getcmdline() =~ '^tmv$')? 'vs ~/.tmp/tmp.vim' : 'tmv'
cnoreabbr <expr> btm (getcmdtype() == ':' && getcmdline() =~ '^btm$')? 'tabe ~/.tmp/tmp.vim' : 'btm'
cnoreabbr <expr> tmb (getcmdtype() == ':' && getcmdline() =~ '^tmb$')? 'tabe ~/.tmp/tmp.vim' : 'tmb'
"}}}

" FoldMethod {{{
cnoreabbr <expr> fsy (getcmdtype() == ':' && getcmdline() =~ '^fsy$')? 'setlocal foldmethod=syntax' : 'fsy'
cnoreabbr <expr> fma (getcmdtype() == ':' && getcmdline() =~ '^fma$')? 'setlocal foldmethod=marker' : 'fma'
cnoreabbr <expr> fdm (getcmdtype() == ':' && getcmdline() =~ '^fdm$')? 'setlocal foldmethod=' : 'fdm'
cnoreabbr <expr> ma (getcmdtype() == ':' && getcmdline() =~ '^setlocal foldmethod= ma$')? 'marker' : '<BS>ma'
cnoreabbr <expr> sy (getcmdtype() == ':' && getcmdline() =~ '^setlocal foldmethod= sy$')? '<BS>syntax' : 'sy'
"}}}
