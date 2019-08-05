"""" Memo: Org-mode.org
"""" From: filetype.toml

augroup OrgMode
  au!
  au FileType org call s:org_general()
  au FileType org call s:org_keymap()
augroup END

function! s:org_general()
  "" Esp. for hyperlinks' appearance
  setlocal textwidth=0 nowrap

  "" WARNING: Wildcard* makes it slow if you have a lot of org files.
  let g:org_agenda_files = ['~/org/*.org']
  "" Ref: <LocalLeader>d: prompt for fast access of a todo state
  let g:org_todo_keywords = [['TODO(t)', '|', 'DONE(d)']]
  "let g:org_todo_keywords = [['TODO(t)', '|', 'DONE(d)'],
  "    \ ['REPORT(r)', 'BUG(b)', 'KNOWNCAUSE(k)', '|', 'FIXED(f)'],
  "    \ ['CANCELED(c)']]
endfunction

function! s:org_keymap()
  let maplocalleader='\<space>'
  """ Agenda
  "" For Weekly ToDo List
  nmap <buffer> <a-a><a-w> <LocalLeader>caa
  "" For All ToDo List
  nmap <buffer> <a-a><a-a> <LocalLeader>cat
  "" Time Sorted
  nmap <buffer> <a-a><a-t> <LocalLeader>caL

  """ ToDo
  " Prompt State
  nmap <buffer> <a-i> <LocalLeader>d
  " Rotate State
  nmap <buffer> <a-i> <LocalLeader>ct
  
endfunction
