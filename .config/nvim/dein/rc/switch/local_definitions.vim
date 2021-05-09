let s:local_definitions = {}

let s:local_definitions['cpp'] = [
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

let s:local_definitions['sh'] = [
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
      \ {
      \   '`\(.*\)`': '${\1}',
      \ },
      \ ]

let s:local_definitions['vim'] = [
      \ ["'\"'", '"''"'],
      \
      \ ['*', '\\{-}', '\\+'],
      \
      \ ['==', '!='],
      \ ['\\zs', '\\ze'],
      \
      \ ['nnoremap', 'nmap'],
      \ ['xnoremap', 'xmap'],
      \ ['onoremap', 'omap'],
      \ ['inoremap', 'imap'],
      \ ['tnoremap', 'tmap'],
      \ ['cnoremap', 'cmap'],
      \
      \ ['bufnr', 'winnr'],
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
      \ ['cterm=',   'gui='],
      \ ['guifg=',   'guibg='],
      \ ['ctermfg=', 'ctermbg='],
      \
      \ {
      \   '\(n\?vim\)-\(\f\+\)': '\2.\1',
      \   '\(\f\+\)[-.]\(n\?vim\)': '\2-\1',
      \ },
      \
      \ {
      \   '\<s:\ze\h[a-zA-Z0-9_.]*(': '<SID>',
      \   '<SID>\ze\h[a-zA-Z0-9_.]*(': 's:',
      \ },
      \
      \ {
      \   'extend(.*''\zskeep\ze'')':  'force',
      \   'extend(.*''\zsforce\ze'')': 'keep',
      \ },
      \ ]

let s:local_definitions['toml'] = [
      \ ['hook_add', 'hook_source', 'hook_post_source', 'hook_done_update'],
      \ ['on_map', 'on_cmd', 'on_func'],
      \ ['add/', 'source/', 'post/'],
      \
      \ {
      \   'runtime \(\f\+\).vim': 'luafile \1.lua',
      \   'source \(\f\+\).vim':  'luafile \1.lua',
      \   'luafile \(\f\+\).lua': 'source \1.vim',
      \ },
      \
      \ ['$DEIN_RC_DIR', '$DEIN_LUA_DIR'],
      \
      \ {
      \   '\(n\?vim\)-\(\f\+\)': '\2.\1',
      \   '\(\f\+\)[-.]\(n\?vim\)': '\2-\1',
      \ },
      \ ]

let s:local_definitions['lua'] = [
      \ {
      \   '\%(local \)*\<function \([A-Z][a-zA-Z_#.]\+\)\s*(':    '\1 = function(',
      \   '\%(local \)*\<function \([a-z_][a-zA-Z_#.]\+\)\s*(':   'local \1 = function(',
      \   '\%(local \)*\<\([A-Z][a-zA-Z_#.]\+\) = function\s*(':  'function \1(',
      \   '\%(local \)*\<\([a-z_][a-zA-Z_#.]\+\) = function\s*(': 'local function \1(',
      \ },
      \ {
      \   '&&': 'and',
      \   '||': 'or',
      \   '!=': '~=',
      \ },
      \ ]

let s:local_definitions['gitcommit'] = [
      \ ['feat', 'fix', 'refactor'],
      \ ['style', 'docs'],
      \ ]

let s:local_definitions['gitrebase'] = [
      \ ['pick', 'squash', 'reword', 'edit', 'exec', 'break', 'merge'],
      \ ['reset', 'label']
      \ ]

let s:local_definitions['php'] = [
      \ ['submit', 'text', 'radio'],
      \ ]

let s:local_definitions['java'] = [
      \ ['private', 'protected', 'public']
      \ ]

let s:local_definitions['markdown'] = [
      \ ['first', 'second', 'third'],
      \ ]

let s:local_definitions['python'] = [
      \ ['spam', 'ham', 'eggs'],
      \ {
      \   'elseif': 'elif',
      \   'else if': 'elif',
      \ },
      \
      \ ['vim.command(,', 'vim.eval('],
      \ ]

let s:local_definitions['snippets'] = [
      \ {
      \   '`!v \(.*\)`': '`!p snip.rv = \1`',
      \   '`!p snip.rv = \(.*\)`': '`!v \1`',
      \ },
      \ ]

function! s:extend_definitions_for_snippets() abort
  let definitions = get(b:, 'switch_custom_definitions', [])

  call extend(definitions, get(s:local_definitions, 'vim', []))
  call extend(definitions, get(s:local_definitions, 'python', []))

  function! s:detect_extra_filetype() abort closure
    let full_path = expand('%:p')

    let roots = get(g:, 'UltiSnipsSnippetDirectories')
    let roots = map(roots, 'substitute(v:val, "/*$", "", "")')

    for r in sort(roots)
      let rel_path = matchstr(full_path, r .'/\zs\f\+')
      if !empty(rel_path) && rel_path !=# full_path
        let ft = matchstr(rel_path, '\v\f{-}\ze(/|\.)')
        return ft
      endif
    endfor

    return ''
  endfunction

  let ft = s:detect_extra_filetype()
  if index(['snippets', 'python', 'vim', ''], ft) == -1
    call extend(definitions, get(s:local_definitions, ft, []))
  endif

  let b:switch_custom_definitions = definitions
endfunction

augroup mySwitchAdd-set_local_definitions "{{{1
  " Note: b:switch_custom_definitions should be defined in advance of the
  " plugin loaded.
  au BufWinEnter *.snippets call s:extend_definitions_for_snippets()
augroup END

" Mappings {{{1

function! s:increment() abort
  if !has_key(s:local_definitions, &ft)
    echohl Error
    echo 'You have no definitions for this filetype,' string(&ft)
    echohl None
    return
  endif

  silent! call repeat#set("\<Plug>(switch-increment-local)")

  let defs = deepcopy(s:local_definitions[&ft])
  if &ft ==# 'snippets'
    call extend(defs, s:local_definitions['snippets'])
  endif
  call switch#Switch({
        \ 'definitions': defs,
        \ })
endfunction

function! s:decrement() abort
  if !has_key(s:local_definitions, &ft)
    echohl Error
    echo 'You have no definitions for this filetype,' string(&ft)
    echohl None
    return
  endif

  silent! call repeat#set("\<Plug>(switch-decrement-local)")
  let defs = deepcopy(s:local_definitions[&ft])
  if &ft ==# 'snippets'
    call extend(defs, s:local_definitions['snippets'])
  endif
  call switch#Switch({
        \ 'definitions': defs,
        \ 'reverse': 1
        \ })
endfunction

nnoremap <silent> <Plug>(switch-increment-local) <Cmd>call <SID>increment()<CR>
nnoremap <silent> <Plug>(switch-decrement-local) <Cmd>call <SID>decrement()<CR>

