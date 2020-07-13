" TOML: operator.toml
" Repo: AndrewRadev/switch.vim
" Another: source/switch.vim

" Excerpt: Regexp support in Dictionary, e.g.,
" let b:switch_custom_definitions = [{
"     \ '<div\(.\{-}\)>\(.\{-}\)</div>':   '<span\1>\2</span>',
"     \ '<span\(.\{-}\)>\(.\{-}\)</span>': '<div\1>\2</div>',
"     \ }]

let s:definitions = {}

let s:definitions['sh'] = [
      \ {
      \   '\[ \(\S.\{-}\) ];': 'test \1;',
      \   'test \(\S.\{-}\);': '[ \1 ];'
      \ },
      \
      \ {
      \   '\<if\>':    'elif',
      \   '\<elif\>':  'if',
      \   'fi\n\s*if': 'elif',
      \ },
      \ ]

let s:definitions['vim'] = [
      \ {
      \   's:\(\h\w\+\)': '<SID>\1',
      \   '<SID>\(\h\w\+\)': 's:\1',
      \ },
      \
      \ {
      \   '\vsubstitute\((.*), .{-}, .{-}\)': 'matchstr(\1)',
      \   '\vmatchstr\((.{-}, .{-})\)': "substitute(\\1, '', '')",
      \ },
      \
      \ ['==', '!='],
      \ ['\\zs', '\\ze'],
      \
      \ ['nmap', 'xmap', 'omap'],
      \ ['imap', 'cmap', 'tmap'],
      \
      \ ['nnoremap', 'xnoremap', 'onoremap'],
      \ ['inoremap', 'cnoremap', 'tnoremap'],
      \
      \ ['if', 'elseif'],
      \ ['finish', 'return'],
      \
      \ ['<silent>', '<script>'],
      \
      \ ['plugin/', 'autoload/'],
      \ ['add/', 'source/', 'post/'],
      \
      \ {
      \   '\(\a\+\)enter\c': '\1Leave',
      \   '\(\a\+\)leave\c': '\1Enter',
      \ },
      \
      \ ]

let s:definitions['gitcommit'] = [
      \ ['feat', 'fix', 'refactor'],
      \ ['style', 'docs'],
      \ ]

let s:definitions['gitrebase'] = [
      \ ['pick', 'squash', 'reword', 'edit', 'exec', 'break', 'merge'],
      \ ['reset', 'label']
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

let s:definitions['python'] = [
      \ ['spam', 'ham', 'eggs'],
      \ ]

augroup mySwitchAdd-set_local_definitions "{{{1
  " Note: b:switch_custom_definitions should be defined in advance of the
  " plugin loaded.
  if exists('#mySwitchAdd-set_local_definitions')
    au! mySwitchAdd-set_local_definitions
  endif
  au BufWinEnter * call s:set_local_definitions()
augroup END

function! s:set_local_definitions() abort
  if !has_key(s:definitions, &ft) | return | endif
  silent! unlockvar b:switch_custom_definitions
  let b:switch_custom_definitions = s:definitions[&ft]
  lockvar b:switch_custom_definitions
  au BufWinLeave <buffer> ++once :silent! unlet b:switch_custom_definitions
endfunction
call s:set_local_definitions()

