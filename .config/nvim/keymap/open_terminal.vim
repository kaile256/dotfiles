" From: init.vim
" Another: tmaps.vim
" Another: lazy/terminal.vim

command! -bar -nargs=* TermOpen :call s:term_open(<q-mods>, <f-args>)

" Note: <Space>t would be mapped by some easymotion like plugins.
if has('nvim')
  nnoremap <silent> <A-t>e :<C-u>TermOpen<CR>
  nnoremap <silent> <A-t>v :<C-u>vs   <bar>   TermOpen<CR>
  nnoremap <silent> <A-t>s :<C-u>sp   <bar>   TermOpen<CR>
  nnoremap <silent> <A-t>t :<C-u>tabe <bar>   TermOpen<CR>
  nnoremap <silent> <A-t>b :<C-u>bot  sp<bar> TermOpen<CR>

  nnoremap <silent> <A-t>E :<C-u>TermOpen $HOME<CR>
  nnoremap <silent> <A-t>V :<C-u>vs   <bar>   TermOpen $HOME<CR>
  nnoremap <silent> <A-t>S :<C-u>sp   <bar>   TermOpen $HOME<CR>
  nnoremap <silent> <A-t>T :<C-u>tabe <bar>   TermOpen $HOME<CR>
  nnoremap <silent> <A-t>B :<C-u>bot  sp<bar> TermOpen $HOME<CR>
else
  nnoremap <silent> <A-t>e :<C-u>TermOpen fish ++curwin<CR>
  nnoremap <silent> <A-t>v :<C-u>vert TermOpen<CR>
  nnoremap <silent> <A-t>s :<C-u>bel  TermOpen<CR>
  nnoremap <silent> <A-t>t :<C-u>tab  TermOpen<CR>
  nnoremap <silent> <A-t>b :<C-u>bot  TermOpen<CR>
endif

nmap <A-t><A-t> <A-t>t
nmap <A-t><A-e> <A-t>e
nmap <A-t><A-v> <A-t>v
nmap <A-t><A-s> <A-t>s
nmap <A-t><A-b> <A-t>b

function! s:term_open(mods, ...) abort
  let path = ''
  if a:0 > 0
    let path = a:1 =~# '^++' ? a:000[len(a:000) - 1] : a:1
  endif
  if path ==# ''
    let path = substitute(expand('%:p:h'), '\S\+://', '', '')
  elseif &ft ==# 'defx'
    let path = matchstr(getline(1), ':\zs\f\+')
  endif
  if !isdirectory(path)
    let path = $HOME
  endif

  let shell = 'fish -C "cd '. path .'"'

  if has('nvim')
    let term_open = 'term '. shell
  else
    let opt = ''
    let opt .= ' ++close'
    let opt .= ' ++kill=term'
    if a:0 > 0
      for arg in a:000
        if arg =~# '^++'
          let opt .= ' '. arg
        endif
      endfor
    endif
    let term_open = a:mods .' term '. opt .' '. shell
    let g:foo = term_open
  endif

  exe term_open
  startinsert
endfunction

