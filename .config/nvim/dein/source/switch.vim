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
        \   '^\s*let ': 'const ',
        \   '^\s*const ': 'let ',
        \ },
        \ ]

  let rules.anitinomy = [
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
        \ ['Disable', 'Enable'],
        \
        \ ['inc', 'dec'],
        \ ['increment', 'decrement'],
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
        \ ['primary', 'secondary'],
        \ ['PRIMARY', 'SECONDARY'],
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
        \ ['Left', 'Right'],
        \
        \ ['above', 'below'],
        \ ['Above', 'Below'],
        \
        \ ['up', 'down'],
        \ ['Up', 'Down'],
        \
        \ ['next', 'prev'],
        \ ['Next', 'Prev'],
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
        \ ['Height', 'Width'],
        \
        \ ['lower', 'upper'],
        \
        \ ['earlier', 'later'],
        \
        \ ['new', 'old'],
        \ ['New', 'Old'],
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
  return definitions
endfunction

let g:switch_custom_definitions = s:set_definitions()
delfunction s:set_definitions
