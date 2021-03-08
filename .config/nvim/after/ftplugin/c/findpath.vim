" Note: Don't forget to update 'resourceDir' in coc-settings.json @500, too.
let s:clang_version = '11.1.0'
let s:cpp_version   = '10.2.0'

let s:include_clang = '/usr/lib/clang/'. s:clang_version .'/include'
let s:include_cpp   = '/usr/include/c++/'. s:cpp_version

if isdirectory(s:include_clang)
  exe 'setl path^=/usr/include,'. s:include_clang
else
  echoerr s:include_clang 'does *not* exists; update s:clang_version'
endif

if &ft !=# 'cpp' | finish | endif

if isdirectory(s:include_cpp)
  exe 'setl path^='. s:include_cpp
else
  echoerr s:include_cpp 'does *not* exists; update s:cpp_version'
endif

