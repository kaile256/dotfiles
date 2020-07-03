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

let g:switch_custom_definitions = []

let g:switch_custom_definitions += [
      \ [
      \   'foo',   'bar',    'baz',    'qux', 'quux',
      \   'corge', 'grault', 'garply', 'waldo',
      \   'fred',  'plugh',  'xyzzy',  'thud'
      \ ],
      \
      \ ['1st', '2nd', '3rd', '4th'],
      \
      \ ['==', '!='],
      \ ['first', 'second', 'third'],
      \
      \ ['new', 'old'],
      \ ['next', 'prev'],
      \ ['lower', 'upper'],
      \
      \ ['earlier', 'later'],
      \
      \ ['private', 'public'],
      \
      \ ['inc', 'dec'],
      \ ['decrement', 'increment'],
      \ ]

let g:switch_custom_definitions += [
      \ {
      \   '\<L\>': 'R',
      \   '\<R\>': 'L',
      \ },
      \ ['left', 'right'],
      \ {
      \   '\<H\>': 'W',
      \   '\<W\>': 'H',
      \ },
      \ ['height', 'width'],
      \ ]
