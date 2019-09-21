" From: motion.toml

let g:skip_default_textobj_word_column_mappings = 1

" Mnemonic: Queue
xnoremap <silent> aq :<C-u>call TextObjWordBasedColumn("aw")<cr>
xnoremap <silent> iq :<C-u>call TextObjWordBasedColumn("iw")<cr>
onoremap <silent> aq :call TextObjWordBasedColumn("aw")<cr>
onoremap <silent> iq :call TextObjWordBasedColumn("iw")<cr>
xnoremap <silent> aQ :<C-u>call TextObjWordBasedColumn("aW")<cr>
xnoremap <silent> iQ :<C-u>call TextObjWordBasedColumn("iW")<cr>
onoremap <silent> aQ :call TextObjWordBasedColumn("aW")<cr>
onoremap <silent> iQ :call TextObjWordBasedColumn("iW")<cr>
