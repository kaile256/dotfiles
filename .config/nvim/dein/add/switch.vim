" TOML: operator.toml
" Repo: AndrewRadev/switch.vim
" Another: source/switch.vim

" Excerpt: Regexp support in Dictionary, e.g.,
" let b:switch_custom_definitions = [{
"     \ '<div\(.\{-}\)>\(.\{-}\)</div>':   '<span\1>\2</span>',
"     \ '<span\(.\{-}\)>\(.\{-}\)</span>': '<div\1>\2</div>',
"     \ }]

let s:definitions = {}

let s:definitions['vim'] = [
      \ ['==', '!='],
      \ ['\\zs', '\\ze'],
      \
      \ ['nmap', 'xmap', 'omap'],
      \ ['imap', 'cmap', 'tmap'],
      \
      \ ['nnoremap', 'xnoremap', 'onoremap'],
      \ ['inoremap', 'cnoremap', 'tnoremap'],
      \
      \ ['<silent>', '<script>'],
      \
      \ ['plugin/', 'autoload/'],
      \ ['add/', 'source/', 'post/'],
      \ ]

let s:definitions['php'] = [
      \ ['submit', 'text', 'radio'],
      \ ]

let s:definitions['java'] = [
      \ ['private', 'protected', 'public']
      \ ]

let s:definitions['markdown'] = [
      \ ['first', 'second', 'third']
      \ ]

augroup mySwitchAdd-set_local_definitions "{{{1
  " Note: b:switch_custom_definitions should be defined in advance of the
  " plugin loaded.
  if exists('#mySwitchAdd-set_local_definitions')
    au! mySwitchAdd-set_local_definitions
  endif
  au BufWinEnter * call s:set_local_definitions()
  au BufWinLeave * :silent! unlet b:switch_custom_definitions
augroup END

function! s:set_local_definitions() abort
  if has_key(s:definitions, &ft)
    let b:switch_custom_definitions = s:definitions[&ft]
  endif
endfunction
call s:set_local_definitions()

