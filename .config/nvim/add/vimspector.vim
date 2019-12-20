" From: debug.toml
" Repo: puremourning/vimspector
" Web: https://puremourning.github.io/vimspector-web/
" Depends: https://github.com/Microsoft/vscode-cpptools

command! -bar DebugStart :call vimspector#Continue()
command! -bar Dstart     :call vimspector#Continue()
