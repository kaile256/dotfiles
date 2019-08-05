"""" From: appearance.toml
"""" Memo: over.org

augroup Over
  au! CmdwinEnter * silent OverCommandLine
augroup END 

"" Auto-Over
let g:over#command_line#substitute#replace_pattern_visually = 1
" upon sourced, command OverCommandLine.
