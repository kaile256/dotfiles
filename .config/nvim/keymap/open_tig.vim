" From: init.vim
" Ref: open_terminal.vim

finish

function! s:term_open(mods, path) abort
  let path = a:path
  if path ==# ''
    let path = substitute(expand('%:p:h'), '\S\+://', '', '')
  elseif &ft ==# 'defx'
    let path = matchstr(getline(1), ':\zs\f\+')
  endif
  if !isdirectory(path)
    let path = $DOTFILES_HOME
  endif

  let shell = 'tig'

  if has('nvim')
    let term_open = 'term '. shell
  else
    let opt = '++close'
    for arg in a:000
      if arg =~# '^++'
        let opt .= ' '. arg
      endif
    endfor
    let term_open = a:mods .' term '. opt .' '. shell
  endif

  exe term_open
  set ft=gitcommit
  startinsert
endfunction

command! -bar -nargs=* Tig :call s:term_open(<q-mods>, <q-args>)

" Note: <Space>t would be mapped by some easymotion like plugins.
if has('nvim')
  nnoremap <silent> <A-g>e :<C-u>Tig<CR>
  nnoremap <silent> <A-g>v :<C-u>bot  vs<bar> Tig<CR>
  nnoremap <silent> <A-g>s :<C-u>sp   <bar>   Tig<CR>
  nnoremap <silent> <A-g>t :<C-u>tabe <bar>   Tig<CR>
  nnoremap <silent> <A-g>b :<C-u>bot  sp<bar> Tig<CR>

  nnoremap <silent> <A-g>E :<C-u>Tig  $DOTFILES_HOME<CR>
  nnoremap <silent> <A-g>V :<C-u>bot  vs<bar> Tig $DOTFILES_HOME<CR>
  nnoremap <silent> <A-g>S :<C-u>sp   <bar>   Tig $DOTFILES_HOME<CR>
  nnoremap <silent> <A-g>T :<C-u>tabe <bar>   Tig $DOTFILES_HOME<CR>
  nnoremap <silent> <A-g>B :<C-u>bot  sp<bar> Tig $DOTFILES_HOME<CR>
else
  nnoremap <silent> <A-g>e :<C-u>Tig fish ++curwin<CR>
  nnoremap <silent> <A-g>v :<C-u>vert Tig<CR>
  nnoremap <silent> <A-g>s :<C-u>bel  Tig<CR>
  nnoremap <silent> <A-g>t :<C-u>tab  Tig<CR>
  nnoremap <silent> <A-g>b :<C-u>bot  Tig<CR>
endif

nmap <A-g><A-t> <A-t>t
nmap <A-g><A-e> <A-t>e
nmap <A-g><A-v> <A-t>v
nmap <A-g><A-s> <A-t>s
nmap <A-g><A-b> <A-t>b

