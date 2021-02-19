" TOML: operator.toml
" Repo: AndrewRadev/switch.vim

" Excerpt: Regexp support in Dictionary, e.g.,
" let b:switch_custom_definitions = [{
"     \ '<div\(.\{-}\)>\(.\{-}\)</div>':   '<span\1>\2</span>',
"     \ '<span\(.\{-}\)>\(.\{-}\)</span>': '<div\1>\2</div>',
"     \ }]

if !exists('*g:switch_extra_definitions')
  let g:switch_extra_definitions = []
endif

function! s:increment() abort
  silent! call repeat#set("\<Plug>(switch-increment)")
  let line = getline('.')
  call switch#Switch({
        \ 'definitions': g:switch_extra_definitions
        \ })

  let is_modified = line !=# getline('.')
  if is_modified | return | endif
  silent! SplitjoinSplit
endfunction

function! s:decrement() abort
  silent! call repeat#set("\<Plug>(switch-decrement)")
  let line = getline('.')
  call switch#Switch({
        \ 'definitions': g:switch_extra_definitions,
        \ 'reverse': 1
        \ })

  let is_modified = line !=# getline('.')
  if is_modified | return | endif
  silent! SplitjoinJoin
endfunction

nnoremap <silent> <Plug>(switch-increment) <Cmd>call <SID>increment()<CR>
nnoremap <silent> <Plug>(switch-decrement) <Cmd>call <SID>decrement()<CR>
nmap z<C-a> <Plug>(switch-increment)
nmap z<C-x> <Plug>(switch-decrement)

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
      \ {
      \   '`\(.*\)`': '${\1}',
      \ },
      \ ]

let s:definitions['vim'] = [
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
      \ {
      \   'cterm=': 'gui=',
      \   'gui=': 'cterm=',
      \
      \   'ctermfg=': 'guifg=',
      \   'guifg=': 'ctermfg=',
      \
      \   'ctermbg=': 'guibg=',
      \   'guibg=': 'ctermbg=',
      \ },
      \
      \ {
      \   '\(n\?vim\)-\(\f\+\)': '\2.\1',
      \   '\(\f\+\)[-.]\(n\?vim\)': '\2-\1',
      \ },
      \ ]

let s:definitions['toml'] = [
      \ ['hook_add', 'hook_source', 'hook_post_source', 'hook_done_update'],
      \ ['on_map', 'on_cmd', 'on_func'],
      \ ['add/', 'source/', 'post/'],
      \
      \ {
      \   '\(n\?vim\)-\(\f\+\)': '\2.\1',
      \   '\(\f\+\)[-.]\(n\?vim\)': '\2-\1',
      \ },
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
      \ {
      \   'elseif': 'elif',
      \   'else if': 'elif',
      \ },
      \
      \ ['vim.command(,', 'vim.eval('],
      \ ]

let s:definitions['snippets'] = [
      \ {
      \   '`!v \(.*\)`': '`!p snip.rv = \1`',
      \   '`!p snip.rv = \(.*\)`': '`!v \1`',
      \ },
      \ ]

function! s:extend_definitions_for_snippets() abort
  let definitions = get(b:, 'switch_custom_definitions', [])

  call extend(definitions, get(s:definitions, 'vim', []))
  call extend(definitions, get(s:definitions, 'python', []))

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
    call extend(definitions, get(s:definitions, ft, []))
  endif

  let b:switch_custom_definitions = definitions
endfunction

augroup mySwitchAdd-set_local_definitions "{{{1
  " Note: b:switch_custom_definitions should be defined in advance of the
  " plugin loaded.
  au BufWinEnter * call s:set_local_definitions()
  au BufWinEnter *.snippets call s:extend_definitions_for_snippets()
augroup END

function! s:set_local_definitions() abort
  if !has_key(s:definitions, &ft) | return | endif
  let b:switch_custom_definitions = s:definitions[&ft]
  au BufWinLeave <buffer> ++once :silent! unlet b:switch_custom_definitions
endfunction
call s:set_local_definitions()

