" From: debug.toml
" Repo: puremourning/vimspector
" Web: https://puremourning.github.io/vimspector-web/
" Depends: https://github.com/Microsoft/vscode-cpptools

command! -bar DebugStart    :call vimspector#Continue()
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

command! -bar Dstart    :call vimspector#Continue()
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

"let g:vimspector_enable_mappings = 'HUMAN' " default: none of keymaps
"
" if s:mappings ==# 'VISUAL_STUDIO' "{{{1
"   nnoremap <F5>         :call vimspector#Continue<cr>
"   nnoremap <S-F5>       :call vimspector#Stop()<CR>
"   nnoremap <C-S-F5>     :call vimspector#Restart()<CR>
"   nnoremap <F6>         :call vimspector#Pause()<CR>
"   nnoremap <F9>         :call vimspector#ToggleBreakpoint()<CR>
"   nnoremap <S-F9>       :call vimspector#AddFunctionBreakpoint( expand( '<cexpr>' ) )<CR>
"   nnoremap <F10>        :call vimspector#StepOver()<CR>
"   nnoremap <F11>        :call vimspector#StepInto()<CR>
"   nnoremap <S-F11>      :call vimspector#StepOut()<CR>
" elseif s:mappings ==# 'HUMAN'
"   nnoremap <F5>         :call vimspector#Continue()<CR>
"   nnoremap <F3>         :call vimspector#Stop()<CR>
"   nnoremap <F4>         :call vimspector#Restart()<CR>
"   nnoremap <F6>         :call vimspector#Pause()<CR>
"   nnoremap <F9>         :call vimspector#ToggleBreakpoint()<CR>
"   nnoremap <F8>         :call vimspector#AddFunctionBreakpoint( expand( '<cexpr>' ) )<CR>
"   nnoremap <F10>        :call vimspector#StepOver()<CR>
"   nnoremap <F11>        :call vimspector#StepInto()<CR>
"   nnoremap <F12>        :call vimspector#StepOut()<CR>
" endif
" "}}}
