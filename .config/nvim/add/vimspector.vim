" From: debug.toml
" Repo: puremourning/vimspector
" Another: post/vimspector.vim
" Web: https://puremourning.github.io/vimspector-web/
" Depends: https://github.com/Microsoft/vscode-cpptools
" Ref: see https://qiita.com/deresmos/items/01a59df438e1b881ef11

let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

"command! -bar DebugStart :call vimspector#Continue()
"command! -bar Dstart     :call vimspector#Continue()

command! -bar DebugStart
      \ :call vimspector#LaunchWithSettings({'configuration': &ft .'_file'})
