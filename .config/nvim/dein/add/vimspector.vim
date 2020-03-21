" From: debug.toml
" Repo: puremourning/vimspector
" Another: post/vimspector.vim
" JSON: .vimspector.json
" Web: https://puremourning.github.io/vimspector-web/
" Depends: https://github.com/Microsoft/vscode-cpptools
" Ref: see https://qiita.com/deresmos/items/01a59df438e1b881ef11

" set values name in configuration at .vimspector.json as you like
command! -bar -nargs=? -bang DebugStart :call s:debug_start(<q-bang>, <q-args>)
function! s:debug_start(...) abort "{{{1
  let args = join(a:000)

  if args =~# '^! '
    call vimspector#Launch()
  elseif args =~# '\s*'
    call vimspector#LaunchWithSettings({'configuration': &ft .'_file'})
  else
    call vimspector#LaunchWithSettings({'configuration': args})
  endif
endfunction

let g:vimspector_enable_mappings = 'VISUAL_STUDIO' "{{{1
" Excerpt: puremourning/vimspector/plugin/vimspector.vim
"   if s:mappings ==# 'VISUAL_STUDIO'
"     nmap <F5>         <Plug>VimspectorContinue
"     nmap <S-F5>       <Plug>VimspectorStop
"     nmap <C-S-F5>     <Plug>VimspectorRestart
"
"     nmap <F6>         <Plug>VimspectorPause
"
"     nmap <F9>         <Plug>VimspectorToggleBreakpoint
"     nmap <S-F9>       <Plug>VimspectorAddFunctionBreakpoint
"
"     nmap <F10>        <Plug>VimspectorStepOver
"     nmap <F11>        <Plug>VimspectorStepInto
"     nmap <S-F11>      <Plug>VimspectorStepOut
"   elseif s:mappings ==# 'HUMAN'
"     nmap <F5>         <Plug>VimspectorContinue
"     nmap <F3>         <Plug>VimspectorStop
"     nmap <F4>         <Plug>VimspectorRestart
"     nmap <F6>         <Plug>VimspectorPause
"     nmap <F9>         <Plug>VimspectorToggleBreakpoint
"     nmap <F8>         <Plug>VimspectorAddFunctionBreakpoint
"     nmap <F10>        <Plug>VimspectorStepOver
"     nmap <F11>        <Plug>VimspectorStepInto
"     nmap <F12>        <Plug>VimspectorStepOut
"   endif

