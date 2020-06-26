" From: debug.toml
" Repo: puremourning/vimspector
" Another: add/vimspector.vim
" Another: source/vimspector.vim

" Web: https://puremourning.github.io/vimspector-web/
" Depends: https://github.com/Microsoft/vscode-cpptools
" JSON: ~/.vimspector.json

" Breakpoint
sign define vimspectorBP text=b> texthl=Error
" Disabled Breakpoint
sign define vimspectorBPDisabled text=x> texthl=WarningMsg
" sign define vimspectorBPCond text=C> texthl=Normal
" Program Counter (Current line)
sign define vimspectorPC text==> texthl=Search

nnoremap <F4> :<C-u>VimspectorReset<CR>

" Note: Vimspector only defines <Plug>VimspectorContinue (has no command).
nnoremap <F5> :<C-u>VimspectorContinue<CR>
inoremap <F5> <Esc>:<C-u>VimspectorContinue<CR>

imap <F5>     <Esc><Plug>VimspectorContinue
imap <S-F5>   <Esc><Plug>VimspectorStop
imap <C-S-F5> <Esc><Plug>VimspectorRestart
imap <F6>     <Esc><Plug>VimspectorPause
imap <F9>     <Esc><Plug>VimspectorToggleBreakpoint
imap <S-F9>   <Esc><Plug>VimspectorAddFunctionBreakpoint
imap <F10>    <Esc><Plug>VimspectorStepOver
imap <F11>    <Esc><Plug>VimspectorStepInto
imap <S-F11>  <Esc><Plug>VimspectorStepOut
