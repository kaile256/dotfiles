if exists('b:current_compiler')
  finish
endif
let b:current_compiler = 'g++'

let s:cpo_save = &cpo
set cpo&vim

CompilerSet errorformat=
      \%*[^\"]\"%f\"%*\\D%l:%c:\ %m,
      \%*[^\"]\"%f\"%*\\D%l:\ %m,
      \\"%f\"%*\\D%l:%c:\ %m,
      \\"%f\"%*\\D%l:\ %m,
      \%-G%f:%l:\ %trror:\ (Each\ undeclared\ identifier\ is\ reported\ only\ once,
      \%-G%f:%l:\ %trror:\ for\ each\ function\ it\ appears\ in.),
      \%f:%l:%c:\ %trror:\ %m,
      \%f:%l:%c:\ %tarning:\ %m,
      \%f:%l:%c:\ %m,
      \%f:%l:\ %trror:\ %m,
      \%f:%l:\ %tarning:\ %m,
      \%f:%l:\ %m,
      \%f:\\(%*[^\\)]\\):\ %m,
      \\"%f\"\\,\ line\ %l%*\\D%c%*[^\ ]\ %m,
      \%D%*\\a[%*\\d]:\ Entering\ directory\ %*[`']%f',
      \%X%*\\a[%*\\d]:\ Leaving\ directory\ %*[`']%f',
      \%D%*\\a:\ Entering\ directory\ %*[`']%f',
      \%X%*\\a:\ Leaving\ directory\ %*[`']%f',
      \%DMaking\ %*\\a\ in\ %f

" Ref: https://codeforces.com/blog/entry/15547#comment-205104
let s:opt = [
      \ '-Wall',
      \ '-Wextra',
      \ '-O2',
      \ '-g3',
      \ ]

let s:opt += [
      \ '-D_GLIBCXX_DEBUG',
      \ '-D_GLIBCXX_DEBUG_PEDANTIC',
      \ ]

let s:opt += [
      \ '-std=c++14',
      \ '-D_LOCAL',
      \ ]

" let s:opt += [
"       \ '-o\ %:t:r',
"       \ ]

let s:makeprg = ["g++", '%:p'] + s:opt

exe 'CompilerSet makeprg='. join(s:makeprg, '\ ')
unlet s:opt s:makeprg

let &cpo = s:cpo_save
unlet s:cpo_save
