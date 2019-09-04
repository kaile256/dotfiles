" From: nvim/init.vim

augroup AlertOnBuffer " {{{
  " CAUTION: Too many Exceptions!!
  au! FileChangedRO * colorscheme molokai
augroup END " }}}

" Keymap; 'SOurce' init.vim
function! s:my_source_vimrc() abort "{{{
  if &ft == 'vim'
    so % 
    echo ' Vim sourced "' . bufname('%') . '"'
  else
    echo ' &ft is not "vim"!'
  endif
endfunction "}}}
nnoremap <silent> <a-s><a-o> :<c-u>call <SID>my_source_vimrc()<cr>
nnoremap <silent> <a-s>o     :<c-u>call <SID>my_source_vimrc()<cr>

" Keymap; 'Show Status' of current buffer
" TODO: Make it work
function! s:echo_wanted_info() abort
  let l:wanted_info_list = [
        \ &syn,
        \ &ft,
        \ &bt,
        \ &fdm,
        \ ]
  for wanted in l:wanted_info_list
    let l:wanted_info_dict = {wanted: 'wanted'}
  endfor
  
endfunction
"nnoremap <silent> <a-s><a-s> :<c-u>call <SID>echo_wanted_info()<cr>
"nnoremap <silent> <a-s>s     :<c-u>call <SID>echo_wanted_info()<cr>

nnoremap <silent> <a-s><a-s> :echo "&syn='" . &syn . "'; &ft='" . &ft . "'; &bt='" . &bt . "'; &fdm='" . &fdm . "'" <cr>
nnoremap <silent> <a-s>s     :echo "&syn='" . &syn . "'; &ft='" . &ft . "'; &bt='" . &bt . "'; &fdm='" . &fdm . "'" <cr>
