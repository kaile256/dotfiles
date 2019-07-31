"""" From: tool.toml

augroup OrgMode
  au!
  au BufReadPost *.org s:org_general()
  au BufReadPost *.org s:org_keymap()
augroup END

function! s:org_general()
  "" WARNING: Wildcard* makes it slow if you have a lot of org files.
  let g:org_agenda_files = ['~/org/*.org']
  "" Ref: <LocalLeader>d: prompt for fast access of a todo state
  let g:org_todo_keywords = [['TODO(t)', '|', 'DONE(d)'],
      \ ['REPORT(r)', 'BUG(b)', 'KNOWNCAUSE(k)', '|', 'FIXED(f)'],
      \ ['CANCELED(c)']]
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
