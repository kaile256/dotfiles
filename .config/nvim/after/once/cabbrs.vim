" From: init.vim
" Ref: cmaps.vim
" Ref: commands.vim

" Use vim-altercmd or another instead.
finish

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
          \ s:cond(key) '?' dict[key] ':' string(key)
  endfor
endfunction

function s:cond(key) abort
  " let mods_list = [
  "     \ 'tab',
  "     \ 'rightb%[elow]',
  "     \ 'bo%[tright]',
  "     \ 'bel%[right]',
  "     \ 'lefta%[bove]',
  "     \ 'abo%[veleft]',
  "     \ 'to%[pleft]',
  "     \ ]
  " call map(mods_list, '"(". v:val .")"')
  " let mods_expr = '\v^[: \t]*'. join(mods_list, '\|')

  " let line = "substitute(getcmdline(), '". mods_expr ."', '', 'e')"

  return "(getcmdtype() == ':' && getcmdline() =~? '^[: \\t]*". a:key ."\\s*$')"
endfunction

" call s:cabbr()
" delfunction s:cabbr
