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
      \ '-o\ %:t:r',
      \ '-Wall',
      \ '-Wextra',
      \ '-O2',
      \ '-pedantic'
      \ ]

" Warnings which either '-Wall' and '-Wextra' doesn't cover.
let s:opt += [
      \ '-Wshadow',
      \ '-Wformat=2',
      \ '-Wfloat-equal',
      \ '-Wconversion',
      \ '-Wlogical-op',
      \ '-Wshift-overflow=2',
      \ '-Wduplicated-cond',
      \ ]

let s:opt += [
      \ '-D_GLIBCXX_DEBUG',
      \ '-D_GLIBCXX_DEBUG_PEDANTIC',
      \ '-fsanitize=address',
      \ '-fsanitize=undefined',
      \ '-fno-sanitize-recover',
      \ '-fstack-protector',
      \ ]

if expand('%:p') =~? '/atcoder/'
  let s:opt += [
        \ '-std=c++14',
        \ '-DDEBUG',
        \ ]
endif

let s:makeprg = ["g++", '%:p'] + s:opt

exe 'CompilerSet makeprg='. join(s:makeprg, '\ ')
unlet s:opt s:makeprg

let &cpo = s:cpo_save
unlet s:cpo_save
