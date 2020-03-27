" From: vimscript.toml
" Repo: thinca/vim-scouter

command! -bar -bang -nargs=* -complete=file
      \ ScouterFromNvimRoot
      \ :exe 'Scouter!' fnamemodify($MYVIMRC, ':p:h') .'/'. <q-args>

" 27 Feb 2020:
"   ScouterFromNvimRoot **: 7772
"   ScouterFromNvimRoot **/*.vim: 4287
"   ScouterFromNvimRoot **/*.toml: 2313
"   else: *.json, *.snip, etc.
