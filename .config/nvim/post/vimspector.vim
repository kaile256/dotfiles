" From: debug.toml
" Repo: puremourning/vimspector
" Another: add/vimspector.vim
" Web: https://puremourning.github.io/vimspector-web/
" Depends: https://github.com/Microsoft/vscode-cpptools

command! -bar DebugContinue     :call vimspector#Continue()
command! -bar DebugPause        :call vimspector#Pause()
command! -bar DebugRestart      :call vimspector#Restart()
command! -bar DebugStop         :call vimspector#Stop()
command! -bar DebugStopAndClose :call vimspector#Reset()

command! -bar DebugStepOver :call vimspector#StepOver()
command! -bar DebugStepInto :call vimspector#StepInto()
" exec until current function is done
command! -bar DebugStepOut  :call vimspector#StepOut()

command! -bar DebugBreakpointToggle
      \ :call vimspector#ToggleBreakpoint()
command! -bar DebugBreakpointAddFunction
      \ :call vimspector#AddFunctionBreakpoint(expand('<cexpr>'))

" watch the specified variable
command! -bar -nargs=? -complete=custom,vimspector#CompleteExpr
      \ DebugWatch
      \ :call s:vimspector_wrapper('AddWatch', <f-args>)
command! -bar -nargs=? -complete=custom,vimspector#CompleteExpr
      \ DebugEvaluate
      \ :call s:vimspector_wrapper('Evaluate', <f-args>)
command! -bar -nargs=? -complete=custom,vimspector#CompleteOutput
      \ DebugShowOutput
      \ :call s:vimspector_wrapper('ShowOutput', <f-args>)

function! s:vimspector_wrapper(func, ...) abort
  if empty(get(a:, '000'))
    let args = expand('<cexpr>')
  else
    let args = a:1
  endif

  call {'vimspector#'. a:func}(args)
endfunction
