" From: external.toml
" Repo: derteta/vimpair

command! -bar PairProgramming :VimpairServerStart "127.0.0.1"

" :VimpairServerStop or :VimpairClientStop.

let g:VimpairTimerInterval = 200 " to wait for clients or updates from the editor.
