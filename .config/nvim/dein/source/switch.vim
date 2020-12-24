" TOML: operator.toml
" Repo: AndrewRadev/switch.vim
" Another: add/switch.vim

"let g:switch_find_smallest_match = 0

" override to suppress default one
let g:switch_mapping = ''
" let g:switch_reverse_mapping = ''

" Excerpt: Regexp support in Dictionary, {'if_matched': 'then_this_one'}, e.g.,
" let b:switch_custom_definitions = [{
"     \ '<div\(.\{-}\)>\(.\{-}\)</div>':   '<span\1>\2</span>',
"     \ '<span\(.\{-}\)>\(.\{-}\)</span>': '<div\1>\2</div>',
"     \ }]

function! s:set_extra_definitions() abort
  let rules = {}

  " FIXME: get correct match pair to move `while (cond)`.
  let pat_while = '\(while (.*)\) \({\(.*\n\)\{-}\s*}\);'
  let pat_do_while = 'do \({\%(.*\n\)\{-}\s*}\) \(while (.*)\);'
  let rules.while_loop = [
        \ {
        \   pat_while : 'do \2 \1;',
        \   pat_do_while : '\2 \1;',
        \ },
        \ ]

  let rules.access2entry = [
        \ {
        \   '\v(\h\k*)\.(\h\k*)': '\1["\2"]',
        \   '\v(\h\k*)\["(\h\k*)"]': '\1[''\2'']',
        \   '\v(\h\k*)\[''(\h\k*)'']': '\1.\2',
        \ },
        \ ]

  " The patterns would hardly match outside of &ft=vim.
  let rules.vimscript = [
        \ {
        \   's:\(\h\w\+\)': '<SID>\1',
        \   '<SID>\(\h\w\+\)': 's:\1',
        \ },
        \
        \ {
        \   '\vsubstitute\((.*), .{-}, .{-}\)': 'matchstr(\1)',
        \   '\vmatchstr\((.{-}, .{-})\)': "substitute(\\1, '', '')",
        \ },
        \ ]

  const definitions = s:_convert_rules_to_definitions(rules)
  return definitions
endfunction

function! s:set_definitions() abort
  let rules = {}

  let rules.auxiliary_verb = [
        \ ['should', 'must'],
        \ ['could', 'would'],
        \ ]

  let rules.abbriviations = [
        \ [' is', "'s"],
        \ [' are', "'re"],
        \ [' not', "n't"],
        \ ['cannot', "can't"],
        \ ]

  let rules.command = [
        \ ['let', 'const'],
        \ ]

  let rules.anitinomy = [
        \ ['global', 'local'],
        \ ['horizontal', 'vertical'],
        \ ['prefix', 'suffix'],
        \ ['black', 'white'],
        \ ]

  let rules.opposite = [
        \ ['preceding', 'following'],
        \
        \ ['pros', 'cons'],
        \ ['enter', 'leave'],
        \ ['before', 'after'],
        \ ['on', 'off'],
        \
        \ {
        \   '\<yes\>': 'no',
        \   '\<no\>': 'yes',
        \ },
        \ ['Yes', 'No'],
        \ ['YES', 'NO'],
        \
        \ ['disable', 'enable'],
        \
        \ ['inc', 'dec'],
        \ ['increment', 'decrement'],
        \
        \ ['min', 'max'],
        \ ['minimum', 'maximum'],
        \ ['minimize', 'maximize'],
        \
        \ ['outer', 'inner'],
        \
        \ ['all', 'each'],
        \
        \ ['pre', 'post'],
        \ ]

  let rules.order = [
        \ [
        \   'foo',   'bar',    'baz',    'qux', 'quux',
        \   'corge', 'grault', 'garply', 'waldo',
        \   'fred',  'plugh',  'xyzzy',  'thud'
        \ ],
        \
        \ ['1st', '2nd', '3rd', '4th'],
        \ ['first', 'second', 'third', 'last'],
        \
        \ ['primary', 'secondary', 'ternary'],
        \
        \ ['collapse', 'expand'],
        \
        \ ['allow', 'deny'],
        \ ['accept', 'refuse'],
        \
        \ ['host', 'guest'],
        \
        \ ['begin', 'end'],
        \ ['start', 'stop'],
        \ ['forward', 'backward'],
        \ ['upward', 'downward'],
        \
        \ ['enqueue', 'dequeue'],
        \
        \ ['private', 'public'],
        \
        \ ['path', 'dir', 'file'],
        \ ]

  let rules.increment = [
        \ {
        \   '++\(\h\w*\)': '\1++',
        \   '--\(\h\w*\)': '\1--',
        \
        \   '\(\h\w*\)++': '\1--',
        \   '\(\h\w*\)--': '\1++',
        \ },
        \ ]

  let rules.direction = [
        \ ['left', 'right'],
        \ ['above', 'below'],
        \ ['next', 'prev'],
        \ ['up', 'down'],
        \ ]

  let rules.possession = [
        \ ['col', 'row'],
        \ ['top', 'bottom'],
        \ ['height', 'width'],
        \
        \ ['upper', 'lower'],
        \
        \ ['new', 'old'],
        \ ['earlier', 'later'],
        \ ]

  let rules.language = [
        \ ['javascript', 'typescript'],
        \ ['javascriptreact', 'typescriptreact'],
        \ ]

  let rules.japanese = [
        \ ['右', '左'],
        \ ]

  const definitions = s:_convert_rules_to_definitions(rules)
  return definitions
endfunction

function! s:_convert_rules_to_definitions(rules) abort
  let definitions = []
  for label in keys(a:rules)
    let definitions += a:rules[label]
  endfor

  let definitions = map(deepcopy(definitions), 's:modified_case(v:val)')

  return definitions
endfunction

function! s:modified_case(rule) abort
  return get(a:rule, 0, '') =~# '^\l'
        \ ? s:normalized_case(a:rule)
        \ : s:sensitive_case(a:rule)
endfunction

function! s:convert_list2dict(expr, results) abort
  if len(a:results) != 2
    throw 'Invalid format results'
  endif

  let pats = map(deepcopy(a:results), a:expr)
  let pats = map(deepcopy(pats), 'substitute(v:val, ''\\\d'', "", "g")')

  let dict = {}
  let dict = extend(deepcopy(dict), {pats[0] : a:results[1]})
  let dict = extend(deepcopy(dict), {pats[1] : a:results[0]})
  return dict
endfunction

function! s:normalized_case(rule) abort
  " Convert ['foo', 'bar'] into a Dict as below:
  "   {
  "     '\v(_|<)foo(_|>)': 'bar',
  "     '\v(_|<)bar(_|>)': 'foo',
  "   }

  if len(a:rule) != 2
    return a:rule
  endif

  let dicts = {}

  let r = a:rule

  " Note: `\zs` and `\ze` shouldn't be used in the patterns because of
  " sandwich.vim's internal proc.
  let dicts.isolated = s:convert_list2dict(
        \ '''\v(#|_|<)''. v:val ."(#|_|>)"',
        \ map(deepcopy(r), '"\\1". v:val ."\\2"')
        \ )
  let dicts.Initialized = s:convert_list2dict(
        \ '''\v(#|_|<|\l)''. toupper(v:val[0]) . v:val[1:] .''(#|_|>|\u)''',
        \ map(deepcopy(r), '"\\1". toupper(v:val[0]) . v:val[1:] ."\\2"'))
  let dicts.UPPER_CASED = s:convert_list2dict(
        \ '''\v(#|_|<)''. toupper(v:val) ."(#|_|>)"',
        \ map(deepcopy(r), '"\\1". toupper(v:val) ."\\2"'))

  let rules = {}
  for d in keys(dicts)
    let rules = extend(deepcopy(rules), dicts[d])
  endfor

  return rules
endfunction

function! s:sensitive_case(rule) abort
  if type(a:rule) == type({})
    let dict = {}
    for key in keys(a:rule)
      call extend(dict, {'\C'. key : a:rule[key]})
    endfor
    return dict
  endif

  " Return rule as it is; to make rule case-sensitive in list with '\C' will
  " switch with 'C'.  For example, switching 'foo' as the definition,
  " ['\Cfoo', '\Cbar'], will convert to 'Cbar'.
  return a:rule
endfunction

let g:switch_extra_definitions  = s:set_extra_definitions()
let g:switch_custom_definitions = s:set_definitions()

delfunction s:set_extra_definitions
delfunction s:set_definitions
delfunction s:modified_case
delfunction s:normalized_case
delfunction s:sensitive_case
