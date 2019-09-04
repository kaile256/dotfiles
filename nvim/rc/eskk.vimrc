" From: insert.toml

set imdisable
let g:eskk#directory = g:my_data . '/eskk'
"let g:eskk#no_default_mappings = 1 " useless
inoremap <c-j> <c-j>
" Note: Never map on <alt> for imap as <esc>
imap <c-space> <Plug>(eskk:toggle)
imap <c-8> <Plug>(eskk:save-dictionary)

cmap <silent> <c-space> <c-u>call eskk#toggle()<cr>
cmap <silent> <c-8> <c-u>call eskk#update_dictionary()<cr>

let g:eskk#directory = expand('$DATA/eskk')

let g:eskk#dictionary = {'encoding': 'utf-8', 'sorted': 0, 'path': expand(g:eskk#directory . '/SKK-JISYO.eskk')}

if filereadable(expand('$DATA/skk/SKK-JISYO.L'))
  let g:eskk#large_dictionary = {'encoding': 'utf-8', 'sorted': 1, 'path': expand('$DATA/skk/SKK-JISYO.L')}
endif

let g:eskk#server = {'host': 'localhost', 'port': 1178}

" Marker
let g:eskk#marker_henkan = '<>'
let g:eskk#marker_henkan_select = '>>'
" Completion
let g:eskk#start_completion_length = 2
"" Completion; <TAB> to next selection
let g:eskk#tab_select_completion = v:true

let g:eskk#kakutei_when_unique_candidate = v:true

let g:eskk#egg_like_newline = v:true
let g:eskk#egg_like_newline_completion = v:true
let g:eskk#keep_state = v:false
let g:eskk#show_annotation = v:true
"autocmd MyAutoCmd User eskk-initialize-post EskkMap -remap jj <ESC>
