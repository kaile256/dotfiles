" Ref: terminal.vim

function! LsGrep(partial)
  " Store :ls! output
  redir => hidden_buffers
  silent ls!
  redir END

  " Grep :ls! output
  let wanted_buffers = system("echo " . shellescape(hidden_buffers) . " | grep -i " . shellescape(a:partial))

  " Display
  echo wanted_buffers
endfunction
command! -nargs=1 LsGrep call LsGrep("<args>")
cnoreabbr <expr> bdt (getcmdtype() == ':' && getcmdline() =~ '^bdt$')? 'LsGrep term:// <bar> bwipeout! ' : 'bdt'
