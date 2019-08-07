"""" Memo: Org-mode.org
"""" From: filetype.toml

augroup OrgMode
  au!
  au FileType org call s:org_general()
  au FileType org call s:org_keymap()
augroup END

function! s:org_general()
  "" Esp. for hyperlinks' appearance
  setlocal textwidth=0 nowrap signcolumn=

  "" WARNING: Wildcard* makes it slow if you have a lot of org files.
  let g:org_agenda_files = ['~/org/*.d/*.org']
  "" Ref: <LocalLeader>d: prompt for fast access of a todo state
  let g:org_todo_keywords = [['TODO(t)', '|', 'DONE(d)']]
  "let g:org_todo_keywords = [['TODO(t)', '|', 'DONE(d)'],
  "    \ ['REPORT(r)', 'BUG(b)', 'KNOWNCAUSE(k)', '|', 'FIXED(f)'],
  "    \ ['CANCELED(c)']]
endfunction

function! s:org_keymap()

  "" NOTICE: On Insert Mode, type <c-o>/<a-space> for the same mapping; vi is too.

  """ Agenda
  "" For Weekly ToDo List
  nmap <buffer> <a-a><a-w> <LocalLeader>caa
  nmap <buffer> <a-a><a-w> <LocalLeader>caA
  "" For All ToDo List
  nmap <buffer> <a-a><a-a> <LocalLeader>cat
  nmap <buffer> <a-a><a-t> <LocalLeader>caT
  "" Sort by Time
  " CAUTION: NOT implemented
  "nmap <buffer> <a-a><a-t> <LocalLeader>caL

  """ ToDo State
  "" Checkbox
  "" Prompt to Select State
  " CAUTION: Seems NOT implemented yet
  "nmap <buffer> <a-space><a-space> <LocalLeader>d
  " Rotate State
  nmap <buffer> <a-space><a-space> <LocalLeader>ct<LocalLeader>c#

  """ Org-Tags
  "" Set Tags
  "" Mnemonic: Mark on Tags
  nmap <buffer> <a-m><a-t> <LocalLeader>st
  nmap <buffer> <a-m>t     <LocalLeader>st
  nmap <buffer> <a-m><a-g> <LocalLeader>st
  nmap <buffer> <a-m>g     <LocalLeader>st

  """ Org-Dating
  "" Mnemonic: Mark on Date
  "" CAUTION: Seems NOT implemented yet
  nmap <buffer> <a-m><a-d> <localleader>sa
  nmap <buffer> <a-m>d     <localleader>si

  "" Mnemonic: Mark by Calender
  nmap <buffer> <a-m><a-c> <localleader>pa
  nmap <buffer> <a-m>c     <localleader>pa

  """ Heading/Subtree
  " Mnemonic: Superior/Inferior

  "" Move
  nmap <buffer> [ [[
  nmap <buffer> ] ]]
  nmap <buffer> m[ m[[
  nmap <buffer> m] m]]

  "" Promote/Demote
  nmap <buffer> >s >ah
  nmap <buffer> >i >ar
  nmap <buffer> <s <ah
  nmap <buffer> <i <ar

  "" Register
  nmap <buffer> ds dah
  nmap <buffer> di dar
  nmap <buffer> ys yah
  nmap <buffer> yi yar

endfunction
