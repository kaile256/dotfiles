
nnoremap j gj
nnoremap k gk
" switch mapping.
nnoremap gj j
nnoremap gk k

nnoremap Y y$

onoremap Y <esc>y$
onoremap D <esc>D
onoremap C <esc>C

" Make default linewise.
" TODO: leave a blank line when ':norm d{ or d}'
onoremap { V{k
onoremap } V}
onoremap [z V[z
onoremap ]z V]z

" For: startinsert mode even from visual mode or operator-pending mode.
onoremap <a-a> <esc>a
onoremap <a-i> <esc>i
vnoremap <a-a> <esc>a
vnoremap <a-i> <esc>i

" Select only a character under the cursor.
onoremap <CR> l
onoremap <NL> l

if exists('g:loaded_repeat')
  " TODO: make dk dot-repeatable
  onoremap <expr> k
        \ (v:operator == 'y')? 'kj':
        \ (v:operator == 'd')? 'kk':
        \ 'k'
else
  onoremap <expr> k
        \ (v:operator == 'y')? 'kj':
        \ (v:operator == 'd')? 'kk':
        \ 'k'
endif

