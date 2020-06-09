" From: debug.toml
" Repo: puremourning/vimspector
" Another: add/vimspector.vim
" Web: https://puremourning.github.io/vimspector-web/
" Depends: https://github.com/Microsoft/vscode-cpptools
" JSON: ~/.vimspector.json

finish

function! s:install_commands() abort
  command! -bar Continue     :call vimspector#Continue()
  command! -bar Pause        :call vimspector#Pause()
  command! -bar Restart      :call vimspector#Restart()
  command! -bar Stop         :call vimspector#Stop()
  command! -bar StopAndClose :call vimspector#Reset()

  command! -bar StepOver :call vimspector#StepOver()
  command! -bar StepInto :call vimspector#StepInto()
  " exec until current function is done
  command! -bar StepOut  :call vimspector#StepOut()

  command! -bar BreakpointToggle
        \ :call vimspector#ToggleBreakpoint()
  command! -bar BreakpointAddFunction
        \ :call vimspector#AddFunctionBreakpoint(expand('<cexpr>'))

  " watch the specified variable
  command! -bar -nargs=? -complete=custom,vimspector#CompleteExpr
        \ Watch
        \ :call s:vimspector_wrapper('AddWatch', <f-args>)
  command! -bar -nargs=? -complete=custom,vimspector#CompleteExpr
        \ Evaluate
        \ :call s:vimspector_wrapper('Evaluate', <f-args>)
  command! -bar -nargs=? -complete=custom,vimspector#CompleteOutput
        \ ShowOutput
        \ :call s:vimspector_wrapper('ShowOutput', <f-args>)
endfunction

function! s:delete_commands() abort
  delcommand Continue
  delcommand Pause
  delcommand Restart
  delcommand Stop
  delcommand StopAndClose

  delcommand StepOver
  delcommand StepInto
  delcommand StepOut

  delcommand BreakpointToggle
  delcommand BreakpointAddFunction

  delcommand Watch
  delcommand Evaluate
  delcommand ShowOutput
endfunction

function! s:vimspector_wrapper(func, ...) abort
  if empty(get(a:, '000'))
    let args = expand('<cexpr>')
  else
    let args = a:1
  endif

  call {'vimspector#'. a:func}(args)
endfunction
