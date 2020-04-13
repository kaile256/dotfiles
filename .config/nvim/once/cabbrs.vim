" From: init.vim
" Ref: cmaps.vim
" Ref: commands.vim

"augroup myCmdLineOptimization
"  au! CmdlineChanged * call s:cmdline_optimize()
"augroup END
"function! s:cmdline_optimize() abort "{{{1
"  if getcmdline() =~# '\\V'
"    let s = substitute(getcmdline(), '\\V', '', 'ge')
"  endif
"endfunction

function s:cabbr() abort
  let dict = {
        \ 'ch':  string('checkhealth <bar> setl bt=nofile'),
        \ 'dof': 'len(tabpagebuflist()) == 2 ? "windo diffoff!" : "diffoff!"',
        \ 'dth': 'len(tabpagebuflist()) == 2 ? "windo diffthis" : "diffthis"',
        \ 'man': string('Man'),
        \ }

  for key in keys(dict)
    exe 'cnoreabbr <expr>' key
          \ '(getcmdtype() == ":" && getcmdline() =~? "^\s*'. key .'\s*$")'
          \ '?' dict[key] ':' string(key)
  endfor
endfunction
call s:cabbr()
delfunction s:cabbr
