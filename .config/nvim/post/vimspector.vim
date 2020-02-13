" From: debug.toml
" Repo: puremourning/vimspector
" Another: add/vimspector.vim
" Web: https://puremourning.github.io/vimspector-web/
" Depends: https://github.com/Microsoft/vscode-cpptools

command! -bar DebugContinue :call vimspector#Continue()
command! -bar DebugPause    :call vimspector#Pause()
command! -bar DebugRestart  :call vimspector#Restart()
command! -bar DebugStop     :call vimspector#Stop()

command! -bar DebugStepOver :call vimspector#StepOver()
command! -bar DebugStepInto :call vimspector#StepInto()
command! -bar DebugStepOut  :call vimspector#StepOut()

command! -bar DebugBreakpointToggle
      \ :call vimspector#ToggleBreakpoint()

command! -bar DebugBreakpointAddFunction
      \ :call vimspector#AddFunctionBreakpoint(expand('<cexpr>'))

" Short named version
command! -bar Dcontinue :call vimspector#Continue()
command! -bar Dpause    :call vimspector#Pause()
command! -bar Drestart  :call vimspector#Restart()
command! -bar Dstop     :call vimspector#Stop()

command! -bar DstepOver :call vimspector#StepOver()
command! -bar DstepInto :call vimspector#StepInto()
command! -bar DstepOut  :call vimspector#StepOut()

command! -bar DbreakpointToggle
      \ :call vimspector#ToggleBreakpoint()

command! -bar DbreakpointAddFunction
      \ :call vimspector#AddFunctionBreakpoint(expand('<cexpr>'))

