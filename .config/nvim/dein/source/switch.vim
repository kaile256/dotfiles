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

function! s:set_definitions() abort
  let rules = {}

  " FIXME: get correct match pair to move `while (cond)`.
  let pat_while = '\(while (.*)\) \({\(.*\n\)\{-}\s*}\)'
  let pat_do_while = 'do \({\(.*\n\)\{-}\s*}\) \(while (.*)\);'
  let rules.while_loop = [
        \ {
        \   pat_while : 'do \2 \1;',
        \   pat_do_while : '\3 \1',
        \ },
        \ ]

  let rules.auxiliary_verb = [
        \ ['should', 'must'],
        \ ['could', 'would'],
        \ ]

  let rules.command = [
        \ {
        \   '^\(\s*\)let ': '\1const ',
        \   '^\(\s*\)const ': '\1let ',
        \ },
        \ ]

  let rules.anitinomy = [
        \ ['global', 'local'],
        \ ['horizontal', 'vertical'],
        \ ]

  let rules.opposite = [
        \ ['Enter', 'Leave'],
        \ ['before', 'after'],
        \ {
        \   '\<on\>': 'off',
        \   '\<off\>': 'on',
        \ },
        \
        \ [' + ', ' - '],
        \
        \ ['==', '!='],
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
        \
        \ ['outer', 'inner'],
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
        \ {
        \   '\<up\(\A\)': 'down\1',
        \   '\<down\(\A\)': 'up\1',
        \   '\<Up\(\A\)': 'Down\1',
        \   '\<Down\(\A\)': 'Up\1',
        \   '\<UP\(\A\)': 'DOWN\1',
        \   '\<DOWN\(\A\)': 'UP\1',
        \ },
        \ ]

  let rules.possession = [
        \ {
        \   '\<row\>': 'col',
        \   '\<col\>': 'row',
        \ },
        \ {
        \   '\<top\>': 'bottom',
        \   '\<bottom\>': 'top',
        \ },
        \ ['height', 'width'],
        \
        \ ['upper', 'lower'],
        \
        \ ['new', 'old'],
        \ ['earlier', 'later'],
        \ ]

  let rules.language = [
        \ ['javascript', 'typescript']
        \ ]

  let rules.japanese = [
        \ ['右', '左'],
        \ ]

  let definitions = []
  for label in keys(rules)
    let definitions += rules[label]
  endfor
  let definitions = map(deepcopy(definitions), 's:modified_case(v:val)')
  return definitions
endfunction

function! s:modified_case(rule) abort
  return get(a:rule, 0, '') =~# '^\l'
        \ ? s:normalized_case(a:rule)
        \ : s:sensitive_case(a:rule)
endfunction

function! s:normalized_case(rule) abort
  let rule = a:rule
  if len(a:rule) == 2
    " Normalization makes backward switch unavailable.
    let rule = switch#NormalizedCase(a:rule)
  endif
  return rule
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

let g:switch_custom_definitions = s:set_definitions()
delfunction s:set_definitions
delfunction s:modified_case
delfunction s:normalized_case
delfunction s:sensitive_case
