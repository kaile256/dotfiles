" From: motion.toml
" Repo: justinmk/vim-sneak
" Fork: kaile256/vim-sneak
" Ref: add/easymotion.vim
" Another: post/sneak.vim

let g:sneak#no_default_mapping = 1
let g:sneak#prompt = 'Sneak: 4 chars >>> '
let g:sneak#no_prompt = 1
" use 'ignorecase' & 'smartcase'
"let g:sneak#use_ic_scs = 1

"let g:sneak#s_next  = 1
" 0: Pressing f/t will repeat last motion as ;/,.
"let g:sneak#f_reset = 0
"let g:sneak#t_reset = 0

let g:sneak#label = 1
" default for g:sneak#label_esc is "\<space>"
"let g:sneak#label_esc = '.'
let g:sneak#target_labels = "abcedfghijklmnopqrstuvwxyz"

map g<space>   <Plug>Sneak_f<space>
map g<s-space> <Plug>Sneak_F<space>
map ; <Plug>Sneak_;
map , <Plug>Sneak_,

" sneak#wrap('{operatorName}', {inputLength}, {reverse?}, {t/f}, {label})
" mode: operatorName; '{'':n,v:operator,visualmode()}
" i: inputLength; {[0-n]}
" r: reverse?; {0:forward,1:backward}
" f: t/f; {0:t,1:f,2:/}
" l: label; {0:never show sneak-label, 1:show labels for >=2 matches, 2:always}

" TODO: compact expression like below
"nnoremap <expr> f sneak#wrap('f2', 'label')

nnoremap <silent> f :call sneak#users('f', 'never')<cr>
nnoremap <silent> t :call sneak#users('t', 'never')<cr>
nnoremap <silent> F :call sneak#users('F', 'never')<cr>
nnoremap <silent> T :call sneak#users('T', 'never')<cr>
"nnoremap <silent> s :call sneak#users('/2')<cr>
"nnoremap <silent> S :call sneak#users('?2')<cr>

xnoremap <silent> f :call sneak#users('fv', 'never')<cr>
xnoremap <silent> t :call sneak#users('tv', 'never')<cr>
xnoremap <silent> F :call sneak#users('Fv', 'never')<cr>
xnoremap <silent> T :call sneak#users('Tv', 'never')<cr>

onoremap <expr><silent> f (v:operator ==# 'd')?
      \ ":call sneak#users('f', 'never')<cr>":
      \ ":call sneak#users('f')<cr>"
onoremap <expr><silent> t (v:operator ==# 'd')?
      \ ":call sneak#users('t', 'never')<cr>":
      \ ":call sneak#users('t')<cr>"
onoremap <expr><silent> F (v:operator ==# 'd')?
      \ ":call sneak#users('F', 'never')<cr>":
      \ ":call sneak#users('F')<cr>"
onoremap <expr><silent> T (v:operator ==# 'd')?
      \ ":call sneak#users('T', 'never')<cr>":
      \ ":call sneak#users('T')<cr>"

augroup SneakBuffers "{{{1
  au! FileType * if &ro | call s:sneak_readonly_keymaps() | endif "{{{2
  function! s:sneak_readonly_keymaps() abort
    nnoremap <buffer><silent> f :call sneak#users('f2p')<cr>
    nnoremap <buffer><silent> t :call sneak#users('t2p')<cr>
    nnoremap <buffer><silent> F :call sneak#users('F2p')<cr>
    nnoremap <buffer><silent> T :call sneak#users('T2p')<cr>

    xnoremap <buffer><silent> f :call sneak#users('f2pv')<cr>
    xnoremap <buffer><silent> t :call sneak#users('t2pv')<cr>
    xnoremap <buffer><silent> F :call sneak#users('F2pv')<cr>
    xnoremap <buffer><silent> T :call sneak#users('T2pv')<cr>
  endfunction
  "}}}2
augroup END
"}}}1
finish "{{{1

" Table;                                  mode,         i, r, f, l
nnoremap <silent> f :<c-u>call sneak#wrap('',           1, 0, 1, 1)<cr>
xnoremap <silent> f :<c-u>call sneak#wrap(visualmode(), 1, 0, 1, 1)<cr>
onoremap <silent> f :<c-u>call sneak#wrap(v:operator,   1, 0, 1, 1)<cr>

nnoremap <silent> t :<c-u>call sneak#wrap('',           1, 0, 0, 1)<cr>
xnoremap <silent> t :<c-u>call sneak#wrap(visualmode(), 1, 0, 0, 1)<cr>
onoremap <silent> t :<c-u>call sneak#wrap(v:operator,   1, 0, 0, 1)<cr>

nnoremap <silent> F :<c-u>call sneak#wrap('',           1, 1, 1, 1)<cr>
xnoremap <silent> F :<c-u>call sneak#wrap(visualmode(), 1, 1, 1, 1)<cr>
onoremap <silent> F :<c-u>call sneak#wrap(v:operator,   1, 1, 1, 1)<cr>

nnoremap <silent> T :<c-u>call sneak#wrap('',           1, 1, 0, 1)<cr>
xnoremap <silent> T :<c-u>call sneak#wrap(visualmode(), 1, 1, 0, 1)<cr>
onoremap <silent> T :<c-u>call sneak#wrap(v:operator,   1, 1, 0, 1)<cr>
finish

" Table;                    operator,     i, r, f, l
" <Plug>Sneak_s: sneak#wrap('',           2, 0, 2, 1)
" <Plug>Sneak_S: sneak#wrap('',           2, 1, 2, 1)
" <Plug>Sneak_s: sneak#wrap(visualmode(), 2, 0, 2, 1)
" <Plug>Sneak_S: sneak#wrap(visualmode(), 2, 1, 2, 1)
" <Plug>Sneak_s: sneak#wrap(v:operator,   2, 0, 2, 1)
" <Plug>Sneak_S: sneak#wrap(v:operator,   2, 1, 2, 1)
""
""
""" 1-char 'enhanced f' sneak
" Table;                    operator,     i, r, f, l
" <Plug>Sneak_f: sneak#wrap('',           1, 0, 1, 0)
" <Plug>Sneak_F: sneak#wrap('',           1, 1, 1, 0)
" <Plug>Sneak_f: sneak#wrap(visualmode(), 1, 0, 1, 0)
" <Plug>Sneak_F: sneak#wrap(visualmode(), 1, 1, 1, 0)
" <Plug>Sneak_f: sneak#wrap(v:operator,   1, 0, 1, 0)
" <Plug>Sneak_F: sneak#wrap(v:operator,   1, 1, 1, 0)
""
""" 1-char 'enhanced t' sneak
" Table;                    operator,     i, r, f, l
" <Plug>Sneak_t: sneak#wrap('',           1, 0, 0, 0)
" <Plug>Sneak_T: sneak#wrap('',           1, 1, 0, 0)
" <Plug>Sneak_t: sneak#wrap(visualmode(), 1, 0, 0, 0)
" <Plug>Sneak_T: sneak#wrap(visualmode(), 1, 1, 0, 0)
" <Plug>Sneak_t: sneak#wrap(v:operator,   1, 0, 0, 0)
" <Plug>Sneak_T: sneak#wrap(v:operator,   1, 1, 0, 0)
"
" Table;                         operator,     i, r, f, l
" <Plug>SneakLabel_s: sneak#wrap('',           2, 0, 2, 2)
" <Plug>SneakLabel_S: sneak#wrap('',           2, 1, 2, 2)
" <Plug>SneakLabel_s: sneak#wrap(visualmode(), 2, 0, 2, 2)
" <Plug>SneakLabel_S: sneak#wrap(visualmode(), 2, 1, 2, 2)
" <Plug>SneakLabel_s: sneak#wrap(v:operator,   2, 0, 2, 2)
" <Plug>SneakLabel_S: sneak#wrap(v:operator,   2, 1, 2, 2)

""" repeat motion (explicit--as opposed to implicit 'clever-s')
" <Plug>Sneak_;: <SID>rpt('',             0)
" <Plug>Sneak_,: <SID>rpt('',             1)
" <Plug>Sneak_;: <SID>rpt(visualmode(),   0)
" <Plug>Sneak_,: <SID>rpt(visualmode(),   1)
" <Plug>Sneak_;: <SID>rpt(v:operator,     0)
" <Plug>Sneak_,: <SID>rpt(v:operator,     1)
