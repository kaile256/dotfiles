" From: init.vim

" Echo file Status {{{
cnoreabbrev <expr> es (getcmdtype() == ':' && getcmdline() =~ '^es$')? 'call <SID>echo_file_info()' : 'es'
"}}}

" Typo;
cnoreabbrev <expr> man (getcmdtype() == ':' && getcmdline() =~ '^man$')? 'Man' : 'man'

" :tabe;
noreabbrev <expr> b (getcmdtype() == ':' && getcmdline() =~ '^b$')? 'tabe' : 'b'
cnoreabbrev <expr> b (getcmdtype() == ':' && getcmdline() =~ '^b$')? 'tabe' : 'b'

" :checkhealth
cnoreabbrev <expr> ch (getcmdtype() == ':' && getcmdline() =~ '^ch$')? 'checkhealth <bar> setl bt=quickfix' : 'ch'

" :source {{{
cnoreabbrev <expr> sj (getcmdtype() == ':' && getcmdline() =~ '^sj$')? 'so % <bar> echo " Sourced! \--" @%' : 'sj'
cnoreabbrev <expr> ss (getcmdtype() == ':' && getcmdline() =~ '^ss$')? 'so % <bar> echo " Sourced! \--" @%' : 'ss'
cnoreabbrev <expr> sss (getcmdtype() == ':' && getcmdline() =~ '^sss$')? 'so % <bar> echo " Sourced! \--" @%' : 'sss'
"}}}

" :help {{{
cnoreabbrev <expr> hb (getcmdtype() == ':' && getcmdline() =~ '^hb$')? 'tab help' : 'h'
cnoreabbrev <expr> bh (getcmdtype() == ':' && getcmdline() =~ '^bh$')? 'tab help' : 'h'
cnoreabbrev <expr> hv (getcmdtype() == ':' && getcmdline() =~ '^hv$')? 'vert bel help' : 'h'
cnoreabbrev <expr> vh (getcmdtype() == ':' && getcmdline() =~ '^vh$')? 'vert bel help' : 'h'
"}}}

" Open tmp.vim {{{
cnoreabbrev <expr> tmp (getcmdtype() == ':' && getcmdline() =~ '^tmp$')? 'e ~/.tmp/tmp.vim' : 'tmp'
cnoreabbrev <expr> htm (getcmdtype() == ':' && getcmdline() =~ '^htm$')? 'sp ~/.tmp/tmp.vim' : 'htm'
cnoreabbrev <expr> tmh (getcmdtype() == ':' && getcmdline() =~ '^tmh$')? 'sp ~/.tmp/tmp.vim' : 'tmh'
cnoreabbrev <expr> vtm (getcmdtype() == ':' && getcmdline() =~ '^vtm$')? 'vs ~/.tmp/tmp.vim' : 'vtm'
cnoreabbrev <expr> tmv (getcmdtype() == ':' && getcmdline() =~ '^tmv$')? 'vs ~/.tmp/tmp.vim' : 'tmv'
cnoreabbrev <expr> btm (getcmdtype() == ':' && getcmdline() =~ '^btm$')? 'tabe ~/.tmp/tmp.vim' : 'btm'
cnoreabbrev <expr> tmb (getcmdtype() == ':' && getcmdline() =~ '^tmb$')? 'tabe ~/.tmp/tmp.vim' : 'tmb'
"}}}

" FoldMethod {{{
cnoreabbrev <expr> fsy (getcmdtype() == ':' && getcmdline() =~ '^fsy$')? 'setlocal foldmethod=syntax' : 'fsy'
cnoreabbrev <expr> fma (getcmdtype() == ':' && getcmdline() =~ '^fma$')? 'setlocal foldmethod=marker' : 'fma'
cnoreabbrev <expr> fdm (getcmdtype() == ':' && getcmdline() =~ '^fdm$')? 'setlocal foldmethod=' : 'fdm'
cnoreabbrev <expr> ma (getcmdtype() == ':' && getcmdline() =~ '^setlocal foldmethod= ma$')? 'marker' : '<BS>ma'
cnoreabbrev <expr> sy (getcmdtype() == ':' && getcmdline() =~ '^setlocal foldmethod= sy$')? '<BS>syntax' : 'sy'
"}}}

augroup TypoOnFileType "{{{
  au!

  au FileType toml inoreabbr <buffer> "{{{ #{{{
  au FileType toml inoreabbr <buffer> "}}} #}}}
augroup END "}}}
