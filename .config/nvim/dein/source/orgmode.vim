" Memo: Orgmode.org
" From: tool.toml

augroup OrgMode
  au!
  au FileType org call s:org_general()
  au FileType org call s:org_keymap()
  "au FileType org setlocal highlight clear Folded
  au InsertLeave * if &filetype == 'org' | norm zH | endif
augroup END

" Emacs' export output is displayed
let g:org_export_verbose=1

function! s:get_back_last_pos()
  let a:last_line = getcurpos()
  call cursor('a:last_line')
endfunction

function! s:done_to_bottom()
  nmap <Plug>(done-to-bottom-ap) dap:$pu "<cr>:call <SID>get_back_last_pos()<cr>
endfunction

function! s:org_general()
  "" Esp. for hyperlinks' appearance
  setlocal textwidth=0 nowrap

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

  """ Experimental
  "nnoremap <buffer> << mo0x`o
  "nnoremap <buffer> >> mo0i*<esc>`o
  "vnoremap <buffer> < <c-v>0o0x
  "vnoremap <buffer> > <c-v>0I*

  """ Hotkey Original
  "" Done to bottom
  nnoremap <buffer><silent> <a-m><a-w> :/Done!/,$w >> ~/org/done.org<cr>`]
  nnoremap <buffer><silent> <a-m><a-q> :1;/Done!/g/DONE/m $<cr>`]

  nmap <buffer><silent> <a-m><a-a> <Plug>(done-to-bottom-ap)
  nmap <buffer><silent> <a-m><a-i> dip:$put "<cr>`]
  vmap <buffer><silent> <a-m><a-a> dap:$put "<cr>`]
  vmap <buffer><silent> <a-m><a-i> dip:$put "<cr>`]
  nmap <buffer><silent> <a-m>a dap:$put "<cr>`]
  nmap <buffer><silent> <a-m>i dip:$put "<cr>`]
  vmap <buffer><silent> <a-m>a dap:$put "<cr>`]
  vmap <buffer><silent> <a-m>i dip:$put "<cr>`]

  "nnoremap <buffer><silent> <a-m><a-a> dap:$put "<cr>``
  "nnoremap <buffer><silent> <a-m><a-i> dip:$put "<cr>``
  "vnoremap <buffer><silent> <a-m><a-a> dap:$put "<cr>``
  "vnoremap <buffer><silent> <a-m><a-i> dip:$put "<cr>``
  "nnoremap <buffer><silent> <a-m>a dap:$put "<cr>``
  "nnoremap <buffer><silent> <a-m>i dip:$put "<cr>``
  "vnoremap <buffer><silent> <a-m>a dap:$put "<cr>``
  "vnoremap <buffer><silent> <a-m>i dip:$put "<cr>``

  """ Export
  " p: PDF; b: beamer PDF; h: HTML; l: LaTeX
  nmap <buffer> <a-x><a-p> <localleader>ep
  nmap <buffer> <a-x><a-b> <localleader>eb
  nmap <buffer> <a-x><a-h> <localleader>eh
  nmap <buffer> <a-x><a-l> <localleader>el
  nmap <buffer> <a-x><a-m> <localleader>em
  nmap <buffer> <a-x>p     <localleader>ep
  nmap <buffer> <a-x>b     <localleader>eb
  nmap <buffer> <a-x>h     <localleader>eh
  nmap <buffer> <a-x>l     <localleader>el
  nmap <buffer> <a-x>m     <localleader>em
  "nmap <buffer> <a-x><a-p> :OrgExportToPDF<CR>
  "nmap <buffer> <a-x><a-b> :OrgExportToBeamerPDF<CR>
  "nmap <buffer> <a-x><a-h> :OrgExportToHTML<CR>
  "nmap <buffer> <a-x><a-l> :OrgExportToLaTeX<CR>
  "nmap <buffer> <a-x><a-d> :OrgExportToMarkdown<CR>
  "nmap <buffer> <a-x>p     :OrgExportToPDF<CR>
  "nmap <buffer> <a-x>b     :OrgExportToBeamerPDF<CR>
  "nmap <buffer> <a-x>h     :OrgExportToHTML<CR>
  "nmap <buffer> <a-x>l     :OrgExportToLaTeX<CR>
  "nmap <buffer> <a-x>d     :OrgExportToMarkdown<CR>

  """ Agenda
  "" For Weekly ToDo List
  nmap <buffer> <a-a><a-w> <LocalLeader>caa
  nmap <buffer> <a-a><a-w> <LocalLeader>caA
  "" For All ToDo List
  nmap <buffer> <a-a><a-a> :OrgBufferAgendaTodo<CR>
  nmap <buffer> <a-a><a-t> :OrgAgendaTodo<CR>
  "" Sort by Time
  " CAUTION: NOT implemented
  "nmap <buffer> <a-a><a-t> <LocalLeader>caL

  """ ToDo State
  "" Checkbox
  " toggle
  " Seams: NOT implemented yet
  "nmap <buffer> <a-x><a-x> <localleader>cc

  "" Prompt to Select State
  " Seams: NOT implemented yet
  "nmap <buffer> <a-space><a-space> <LocalLeader>d
  " Rotate State
  imap <buffer> <a-space><a-space> <LocalLeader>ct<LocalLeader>c#
  nmap <buffer> <a-space><a-space> <LocalLeader>ct<LocalLeader>c#

  """ Org-Tags
  "" Set Tags
  "" Mnemonic: Mark on Tags
  "nmap <buffer> <a-m><a-t> <LocalLeader>st
  "nmap <buffer> <a-m>t     <LocalLeader>st
  "nmap <buffer> <a-m><a-g> <LocalLeader>st
  "nmap <buffer> <a-m>g     <LocalLeader>st
  nmap <silent><buffer> <a-m><a-t> <Plug>OrgSetTags
  nmap <silent><buffer> <a-m>t     <Plug>OrgSetTags
  nmap <silent><buffer> <a-m><a-g> <Plug>OrgSetTags
  nmap <silent><buffer> <a-m>g     <Plug>OrgSetTags

  """ Org-Dating
  "" Mnemonic: Mark on Date
  "" CAUTION: Seems NOT implemented yet
  nmap <buffer> <a-m><a-d> <localleader>sa
  nmap <buffer> <a-m>d     <localleader>si

  "" Mnemonic: Mark by Calender
  nmap <buffer> <a-m><a-c> <localleader>pa
  nmap <buffer> <a-m>c     <localleader>pa
  nmap <buffer> <a-m>x     :OrgCheckBoxToggle<CR>
  "
  nmap <buffer> <a-m><a-c> :OrgDateInsertTimestampActiveWithCalendar<CR>
  nmap <buffer> <a-m>c     :OrgDateInsertTimestampActiveWithCalendar<CR>
  """ Heading/Subtree
  " Mnemonic: zM only shows Heading;zR shows Subtree.

  "" Register
  nmap <buffer> dm dah
  nmap <buffer> dr dar
  nmap <buffer> ym yah
  nmap <buffer> yr yar

  "" Promote/Demote
  nmap <buffer> >m >ah
  nmap <buffer> >r >ar
  nmap <buffer> <m <ah
  nmap <buffer> <r <ar

  "" Move
  nmap <buffer> m[ m[[
  nmap <buffer> m] m]]

endfunction
