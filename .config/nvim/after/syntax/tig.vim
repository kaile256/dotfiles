syn keyword tigTodo FIXME NOTE NOTES TODO XXX contained
syn keyword tigConstant none true yes no
syn keyword tigView view generic main
      \ diff log reflog tree blob blame refs status stage stash grep pager help

syn region tigVariable start="%(" end=")"
syn keyword tigCommands bind set source color
syn keyword tigGitCommands git rebase commit reset drop
syn keyword tigSubcommands
      \ toggle
      \ move
      \ up down
      \ page
      \ half
      \ first last
      \ line
      \
      \ enter
      \ back
      \ next previous
      \ parent
      \ refresh
      \ maximize
      \ close quit
      \
      \ scroll
      \ col
      \ left right
      \
      \ search
      \ find
      \
      \ edit
      \ prompt
      \ options
      \ screen
      \ redraw
      \ stop
      \ loading
      \ show
      \ version

syn match tigBracket "[<>]"
syn match tigKeybind "bind \a\+ \zs\S\+"
syn keyword tigFormat id author email date text

syn match tigNumber "\<\d\+\>"
syn match tigComment "#.*$" contains=tigTodo,@Spell

hi! link tigBracket Delimiter
hi! link tigKeybind Special
hi! link tigCommands Statement
hi! link tigView Type
hi! link tigConstant Boolean
hi! link tigNumber Number
hi! link tigComment Comment

hi! link tigGitCommands Function
hi! link tigSubcommands Statement
hi! link tigVariable Identifier
hi! link tigFormat Constant
