" TOML: operator.toml
" Repo: AndrewRadev/switch.vim
" Another: source/switch.vim

" Excerpt: Regexp support in Dictionary, e.g.,
" let b:switch_custom_definitions = [{
"     \ '<div\(.\{-}\)>\(.\{-}\)</div>':   '<span\1>\2</span>',
"     \ '<span\(.\{-}\)>\(.\{-}\)</span>': '<div\1>\2</div>',
"     \ }]

let s:definitions = {}

let s:definitions['cpp'] = [
      \ {
      \   '\<\(\a*\)map\>': 'unordered_\1map',
      \   '\<unordered_\(\a*\)map\>': '\1map',
      \ },
      \ {
      \   '\<\(\a*\)set\>': 'unordered_\1set',
      \   '\<unordered_\(\a*\)set\>': '\1set',
      \ },
      \ {
      \   '\(\h\w*\)++': '++\1',
      \   '\(\h\w*\)--': '--\1',
      \
      \   '++\(\h\w*\)': '--\1',
      \   '--\(\h\w*\)': '++\1',
      \ },
      \
      \ {
      \   '\<constexpr \(\h\w* =\)': 'const \1',
      \   '\<const \(\h\w* =\)':     'constexpr \1',
      \ },
      \
      \ ['auto &&', 'const auto &'],
      \ ['.push', '.emplace'],
      \ ]

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
      \ ['*', '\\{-}', '\\+'],
      \
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
      \ {
      \   '\(syn\%[tax]\) keyword': '\1 match',
      \   '\(syn\%[tax]\) match':   '\1 region',
      \   '\(syn\%[tax]\) region':  '\1 keyword',
      \ },
      \ {
      \   '\(set\l*\) no\(\l+\)': '\1 \2',
      \ },
      \ ]

let s:definitions['toml'] = [
      \ ['hook_add', 'hook_source', 'hook_post_source', 'hook_done_update'],
      \ ['on_map', 'on_cmd', 'on_func'],
      \ ['add/', 'source/', 'post/'],
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

let s:definitions['javascriptreact'] = get(s:definitions, 'javascript', [])
let s:definitions['javascriptreact'] += [
      \ ['serviceWorker.register();', 'serviceWorker.unregister();'],
      \ ]
let s:definitions['typescriptreact'] = get(s:definitions, 'typescript', [])
let s:definitions['typescriptreact'] += get(s:definitions, 'javascriptreact', [])
let s:definitions['typescriptreact'] += [
      \ ]

augroup mySwitchAdd-set_local_definitions "{{{1
  " Note: b:switch_custom_definitions should be defined in advance of the
  " plugin loaded.
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

