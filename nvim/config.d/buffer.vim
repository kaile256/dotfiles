"""" From: nvim/init.vim
""""  Ref: orgmode.vimrc

command! Bw :bwipeout expand('term://*')

"""" GENERAL
augroup AppendFileType
  au!
  au BufNewFile,BufRead *.vim!   setlocal filetype=vim
  au BufNewFile,BufRead *.vimrc  setlocal filetype=vim
  au BufNewFile,BufRead *.vimrc! setlocal filetype=vim
  au BufNewFile,BufRead i3/*/config setlocal filetype=i3
augroup END

augroup OnTermMode
  au!
  au VimEnter * if @% == '' && &filetype ==# '' && &buftype ==# '' | call termopen(&shell) | endif
  au VimEnter,TermOpen * if &buftype ==# 'terminal' | setlocal nonumber signcolumn=no modifiable | endif
  " When you 'nvr' from term-mode.
  au WinLeave,BufWinLeave * if winnr('$') ==# winnr('#') && &filetype !=# 'fzf' && @# =~# 'term:' | bwipeout! # | endif
  au VimEnter,TermOpen *    if &buftype ==# 'terminal' | startinsert | endif
augroup END

augroup OnNetrw
  au!
  au BufWinLeave if &filetype ==# 'netrw' | setlocal bufhidden=wipe | endif
  au FileType netrw setlocal bufhidden=wipe
augroup END

augroup OnHelp
  au!
  "" Cursor Locates on the Middle
  "au BufWinEnter * if &filetype ==# 'help' | norm zz | endif
  """ Append Help on Buffer-list
  au BufLeave * if &filetype ==# 'help' | drop % | endif
augroup END

augroup OnToml
  """ Auto Edit
  "" Remove Unnecessary part of URL
  au! BufWritePre *.toml if search('https:\/\/github.com\/', 'w', line('0')) | %s/https:\/\/github.com\///g | endif
augroup END

"""" Read Only
augroup AlertWhenReadOnly
 " CAUTION: Too many Exceptions!!
  au! BufRead,BufEnter * if &readonly && &buftype ==# '' && &filetype !=# 'netrw' | colorscheme molokai | endif
augroup END

augroup AdjustOnLanguage

  au!
  au FileType org        setlocal tabstop=4 softtabstop=4 shiftwidth=4
  au FileType lua        setlocal tabstop=4
  au FileType JavaScript setlocal tabstop=4 softtabstop=4 shiftwidth=4
  au FileType Ruby       setlocal tabstop=2 softtabstop=2 shiftwidth=2
  au FileType Python     setlocal tabstop=2 softtabstop=2 shiftwidth=2

augroup END

augroup AdjustOnPlugins
  au!
  """ Leave no buffer
  au FileType fugitive setlocal bufhidden=wipe
  au BufEnter * if &filetype !=# 'vim' | call s:ft_is_not_vim() | endif

  """ Treat as QuickFix
  "" CAUTION: denite,vista demands to write before quitting.
  au FileType gitcommit,fugitive,defx setlocal buftype=quickfix
  " Why? not work on 'au FileType'
  au BufRead * if &filetype ==# 'git' | setlocal buftype=quickfix | endif
  "au FileType expand('s:treat_as_quickfix')setlocal buftype=quickfix
  "au BufNew * if &filetype ==# expand('s:treat_as_quickfix') | setlocal buftype=quickfix | endif

  """ Quit immediately upon WinLeave
  "" NOTICE: fzf works on terminal; CANNOT change buftype.
  au WinLeave * if &filetype ==# 'fzf' | quit | endif

  au FileType qt,fugitive call s:quickfix_keymap()
augroup END

"""" DEFINITION
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

"""" KEYMAP
"augroup CheckStartTime
"  au! VimEnter,InsertEnter,WinEnter * checktime
"augroup END

""" Reload init.vim
nnoremap <a-s><a-o> :<c-u>so % <bar> echo ' Vim sourced "' . bufname('%') . '"'<CR>
nnoremap <a-s>o     :<c-u>so % <bar> echo ' Vim sourced "' . bufname('%') . '"'<CR>

""" Mnemonic: Show BufType/FileType
nnoremap <a-s><a-b> :echo  " &filetype='" . &filetype . "'; &buftype='" . &buftype . "'; " . "winnr('#') is " . winnr('#') . "; winnr('$') is " . winnr('$') . "." <cr>
nnoremap <a-s><a-f> :echo  " &filetype='" . &filetype . "'; &buftype='" . &buftype . "'; " . "winnr('#') is " . winnr('#') . "; winnr('$') is " . winnr('$') . "." <cr>
"nnoremap <a-s><a-b> :echo " &filetype is '" . &filetype . "'; &buftype is '" . &buftype . "'"<cr>
"nnoremap <a-s><a-f> :echo " &filetype is '" . &filetype . "'; &buftype is '" . &buftype . "'"<cr>

""" Checkhealth
if has('nvim')
  nnoremap <silent> <a-c><a-h> :<c-u>checkhealth<cr> :setlocal buftype=quickfix<cr>
  nnoremap <silent> <a-c>h     :<c-u>checkhealth<cr> :setlocal buftype=quickfix<cr>
  cnoremap <silent> <a-c><a-h> :<c-u>checkhealth<cr> :setlocal buftype=quickfix<cr>
  cnoremap <silent> <a-c>h     :<c-u>checkhealth<cr> :setlocal buftype=quickfix<cr>
endif

