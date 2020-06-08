setl cinkeys+=;

if &ft ==# 'cpp'
  compiler g++
  " compiler clang++
elseif &ft ==# 'c'
  compiler gcc
  " compiler clang
endif
