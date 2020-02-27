" From: vimscript.toml
" Repo: thinca/vim-scouter

command! -bar -bang -nargs=* -complete=file
      \ SelfScouter
      \ :exe 'Scouter<bang>' fnamemodify($MYVIMRC, ':p:h') .'/'. <q-args>

" 27 Feb 2020:
"   SelfScouter **: 7772
"   SelfScouter **/*.vim: 4287
"   SelfScouter **/*.toml: 2313
"   else: *.json, *.snip, etc.
