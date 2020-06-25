" From: debug.toml
" Repo: puremourning/vimspector
" Another: add/vimspector.vim
" Another: post/vimspector.vim

" JSON: .vimspector.json
" JSON: data/vimspector

" Note: The configuration should be written in .vimspector.json under project
" root or home directory.
" Note: Undefined variable in .vimspector.json will be asked upon running
" vimspector.

" default: empty string
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" Excerpt: puremourning/vimspector/plugin/vimspector.vim
"
" nmap <F5>     <Plug>VimspectorContinue
" nmap <S-F5>   <Plug>VimspectorStop
" nmap <C-S-F5> <Plug>VimspectorRestart
" nmap <F6>     <Plug>VimspectorPause
"
" nmap <F9>   <Plug>VimspectorToggleBreakpoint
" nmap <S-F9> <Plug>VimspectorAddFunctionBreakpoint
"
" nmap <F10>   <Plug>VimspectorStepOver
" nmap <F11>   <Plug>VimspectorStepInto
" nmap <S-F11> <Plug>VimspectorStepOut
