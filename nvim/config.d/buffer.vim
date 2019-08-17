"""" From: nvim/init.vim
""""  Ref: orgmode.vimrc

"""" GENERAL
augroup AppendFileType

  au!
  au BufNew,BufEnter *.vim!      setlocal filetype=vim
  au BufNew,BufEnter *.vimrc     setlocal filetype=vim
  au BufNew,BufEnter *.vimrc!    setlocal filetype=vim
  au BufNew,BufEnter i3/*/config setlocal filetype=i3
  au BufNew,BufEnter *.txt       setlocal filetype=help
  au BufNew,BufEnter *.org       setlocal filetype=org

augroup END

augroup AlertOnBuffer
  """ Alert on Sourcing non-vim buffer.
  au BufEnter * if &filetype !=# 'vim' | call s:ft_is_not_vim() | endif

  " CAUTION: Too many Exceptions!!
  if &readonly && &buftype ==# '' && &filetype !=# 'netrw'
    au! BufRead,BufEnter *  colorscheme molokai
  endif
augroup END

augroup AdjustOnLanguage
  au!

  """ Tab's
  au FileType org,JavaScript setlocal tabstop=4 softtabstop=4 shiftwidth=4
  au FileType Ruby,Python    setlocal tabstop=2 softtabstop=2 shiftwidth=2

  """ Fold Method
  au BufEnter *.json         setlocal foldmethod=syntax foldlevel=0

augroup END

augroup OnTermMode
  au!
  if @% == '' && &filetype ==# '' && &buftype ==# ''
    au VimEnter * call termopen(&shell)
  endif
  au Syntax * if @# =~# 'term:' && &filetype !=# 'fzf' | bwipeout! # | endif
  au FileType netrw if @# =~# 'term:' | bwipeout! # | endif
  au VimEnter,TermOpen * if &buftype ==# 'terminal' | setlocal nonumber signcolumn=no modifiable | endif
  au VimEnter,TermOpen * if &buftype ==# 'terminal' | startinsert | endif
augroup END

augroup BufWipeExceptTerminal
  au!

  au BufHidden *
        \ if &filetype ==# 'netrw'
        \ || &filetype ==# 'vista'
        \ |  bwipeout  %
        \ |  endif

  """ AutoCloseOnWinLeave
  au WinLeave *
        \ if &filetype ==# 'fzf'
        \ || &filetype ==# 'coc'
        \ |  close
        \ |  endif

  """ Treat as QuickFix
  "" CAUTION: denite,vista demands to write before quitting.
  au FileType orgagenda,gitcommit,defx setlocal buftype=quickfix
  " Why? not work on 'au FileType'
  au BufRead * if &filetype ==# 'fugitive' || &filetype ==# 'git' | setlocal buftype=quickfix | endif

  au FileType qt,fugitive call s:quickfix_keymap()
augroup END

augroup UponSpecificFileType
  au!
  "" Cursor Locates on the Middle
  "au BufWinEnter * if &filetype ==# 'help' | norm zz | endif

  """ AppendOnBufList
  "" Append Help on Buffer-list
    au BufLeave *  if &buftype ==# 'help' | set buflisted | endif

  """ Auto Edit
  "" Remove Unnecessary part of URL
  au BufWritePre *   if &filetype ==# 'toml' && search('https:\/\/github.com\/', 'w', line('0')) | %s/https:\/\/github.com\///g | endif

  """ On Erorr, Re:Syntax
  au Syntax * if &syntax ==# '' | syntax enable | endif
augroup END

"""" KEYMAP
""" Definition
function! s:quickfix_keymap() abort
  nnoremap <buffer> <c-p> :cprevious<cr>
  nnoremap <buffer> <c-n> :cnext<cr>
  nnoremap <buffer> <a-]> :cnewer<cr>
  nnoremap <buffer> <a-[> :colder<cr>
endfunction

function! s:ft_is_not_vim() abort
  nnoremap <buffer> <a-s><a-o> :echo '&filetype is not "vim"!'<cr>
  nnoremap <buffer> <a-s>o     :echo '&filetype is not "vim"!'<cr>
endfunction

""" Reload init.vim
nnoremap <silent> <a-s><a-o> :<c-u>so % <bar> echo ' Vim sourced "' . bufname('%') . '"'<CR>
nnoremap <silent> <a-s>o     :<c-u>so % <bar> echo ' Vim sourced "' . bufname('%') . '"'<CR>

""" Mnemonic: Show BufType/FileType
nnoremap <silent> <a-s><a-b> :echo  " &filetype='" . &filetype . "'; &buftype='" . &buftype . "'; " . "winnr('$') is " . winnr('$') . "; winnr('#') is " . winnr('#') . "." <cr>
nnoremap <silent> <a-s><a-f> :echo  " &filetype='" . &filetype . "'; &buftype='" . &buftype . "'; " . "winnr('$') is " . winnr('$') . "; winnr('#') is " . winnr('#') . "." <cr>
"nnoremap <a-s><a-b> :echo " &filetype is '" . &filetype . "'; &buftype is '" . &buftype . "'"<cr>
"nnoremap <a-s><a-f> :echo " &filetype is '" . &filetype . "'; &buftype is '" . &buftype . "'"<cr>

""" Checkhealth
if has('nvim')
  nnoremap <silent> <a-c><a-h> :<c-u>checkhealth<cr> :setlocal buftype=quickfix<cr>
  nnoremap <silent> <a-c>h     :<c-u>checkhealth<cr> :setlocal buftype=quickfix<cr>
  cnoremap <silent> <a-c><a-h> :<c-u>checkhealth<cr> :setlocal buftype=quickfix<cr>
  cnoremap <silent> <a-c>h     :<c-u>checkhealth<cr> :setlocal buftype=quickfix<cr>
endif

