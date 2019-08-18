"""" From: nvim/init.vim
""""  Ref: orgmode.vimrc

" Buffer; Function! {{{
function! s:auto_format_if_modifiable() "{{{
  if &modifiable
    if &readonly
      setlocal linebreak
    elseif &readonly != 0
      setlocal nolinebreak
      if &textwidth != 0
        setlocal textwidth=0
      endif
    endif
  endif
endfunction "}}}

function! s:alert_ft_is_not_vim() abort "{{{
  nnoremap <buffer> <a-s><a-o> :echo '&filetype is not "vim"!'<cr>
  nnoremap <buffer> <a-s>o     :echo '&filetype is not "vim"!'<cr>
endfunction "}}}

function! s:quickfix_keymap() abort "{{{
  nnoremap <buffer> <c-p> :cprevious<cr>
  nnoremap <buffer> <c-n> :cnext<cr>
  nnoremap <buffer> <a-]> :cnewer<cr>
  nnoremap <buffer> <a-[> :colder<cr>
endfunction "}}}

function! s:keymap_for_commandline()
  nnoremap <buffer><nowait> <a-k> <c-c><c-c>
endfunction
"}}}

" Buffer; Augroup {{{
augroup AppendFileType "{{{

  au!
  au BufEnter *.vim!      setlocal filetype=vim
  au BufEnter *.vimrc!    setlocal filetype=vim
  au BufEnter i3/*/config setlocal filetype=i3
  au BufEnter *.txt       setlocal syntax=help

augroup END "}}}

augroup AlertOnBuffer " {{{
  """ Alert on Sourcing non-vim buffer.
  au BufEnter * if &filetype !=# 'vim' | call s:alert_ft_is_not_vim() | endif

  " CAUTION: Too many Exceptions!!
  au! FileChangedRO * colorscheme molokai
augroup END " }}}

augroup AdjustOnLanguage " {{{
  au!

  "" AdjustOnLanguage; Tab & Indent "{{{
  au FileType org,JavaScript setlocal tabstop=4 softtabstop=4 shiftwidth=4
  au FileType Ruby,Python    setlocal tabstop=2 softtabstop=2 shiftwidth=2
  "}}}

  "" AdjustOnLanguage; Fold Method "{{{
  """ FoldMethod; set foldmethod "{{{
  au BufRead * if &filetype == 'json' | setlocal foldmethod=syntax foldlevel=0 | endif
  au BufRead * if &filetype == 'vim'  | setlocal foldmethod=marker foldlevel=0 | endif
  au BufRead * if &filetype == 'toml' | setlocal foldmethod=marker foldlevel=0 | endif
  "}}}

  """ Experimental: Fold Method; zf: default zf works wrong "{{{
  au FileType vim vmap <buffer><silent> zf zf:'< s/\({{{\){{{/\1\r"{{{\$/e<cr>
  au FileType vim vmap <buffer><silent> zf zf:'> s/\(}}}\)}}}/\1\r"}}}\$/e<cr>
  au FileType vim vmap <buffer><silent> zf zf:'< s/\([\w\.\]]\)"{{{\$/\1\s"{{{/e<cr>
  au FileType vim vmap <buffer><silent> zf zf:'> s/[\(\w\.\]}]\)"}}}\$/\1\r"}}}/e<cr>
  au FileType vim vmap <buffer><silent> zf zf:'< retab <bar> :'> retab <cr>
  au FileType toml vmap <buffer><silent> zf zf:'< s/\([\w'"\]\.]\)# {{{/\1 #{{{/ge <bar> :'>s/\([\w'"\]}\.]\)# }}}/\1\r#}}}/ge<cr> :'< retab <bar> :'> retab <cr>
  "}}}
  "}}}
augroup END " }}}

augroup OnTermMode "{{{
  au!
  if @% == '' && &filetype ==# '' && &buftype ==# ''
    au VimEnter * call termopen(&shell)
  endif
  au Syntax * if @# =~# 'term:' && &filetype !=# 'fzf' | bwipeout! # | endif
  au FileType netrw if @# =~# 'term:' | bwipeout! # | endif
  au VimEnter,TermOpen * if &buftype ==# 'terminal' | setlocal nonumber signcolumn=no modifiable | endif
  au VimEnter,TermOpen * if &buftype ==# 'terminal' | startinsert | endif
augroup END "}}}

augroup BufWipeExceptTerminal "{{{
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
  au FileType orgagenda,gitcommit setlocal buftype=quickfix
  " Why? not work on 'au FileType'
  au BufRead * if &filetype ==# 'fugitive' || &filetype ==# 'git' | setlocal buftype=quickfix | endif

  au FileType fugitive setlocal nonumber
  au FileType qt,fugitive call s:quickfix_keymap()
augroup END "}}}

augroup AutoFormat "{{{
  au!
  "" Cursor Locates on the Middle
  "au BufWinEnter * if &filetype ==# 'help' | norm zz | endif

  """ AutoFormat; Unusual Appending on BufList "{{{
  "" Append Help on Buffer-list
  au BufLeave *  if &buftype ==# 'help' | setlocal buflisted | endif
  au BufEnter *  if &buftype ==# 'help' | setlocal signcolumn= nonumber | endif
  "}}}

  """ AutoFormat; Delete "{{{
  "" Space Unnecessary
  au BufWritePre * silent keeppatterns %s/\s\+$//ge
  "" URL
  "" Remove Unnecessary part of URL
  au BufWritePre *.toml   silent keeppatterns %s/https:\/\/github.com\///ge
  au FileType toml nnoremap <buffer><silent> <s-tab> :keeppatterns %s/^\s\+//ge<cr>
  "}}}

  au BufRead * call s:auto_format_if_modifiable()

  """ Re-Syntax on Error
  au FocusLost,ColorScheme * syntax enable
augroup END "}}}

augroup KeymapOnCondition "{{{
  au!
  au CmdwinEnter * call <SID>keymap_for_commandline()
augroup END "}}}
"}}}

set showbreak=>\
" CAUTION: `breakat` ONLY works for ASCII characters.
set breakat+=
" `breakindent` keeps visually indented according to the actual line.
set breakindent

if &modeline == 0
  set modeline
endif

if &modelineexpr == 0
  set modelineexpr
endif

" Buffer; Keymap {{{

""" Mnemonic: Source init.vim {{{
nnoremap <silent> <a-s><a-o> :<c-u>so % <bar> echo ' Vim sourced "' . bufname('%') . '"'<CR>
nnoremap <silent> <a-s>o     :<c- Reloadu>so % <bar> echo ' Vim sourced "' . bufname('%') . '"'<CR>
"}}}

""" Mnemonic: Show Status of the buffer {{{
nnoremap <silent> <a-s><a-s> :echo  " &filetype='" . &filetype . "'; &buftype='" . &buftype . "'; " . "winnr('$') is " . winnr('$') . "; winnr('#') is " . winnr('#') . "." <cr>
nnoremap <silent> <a-s><a-s> :echo  " &filetype='" . &filetype . "'; &buftype='" . &buftype . "'; " . "winnr('$') is " . winnr('$') . "; winnr('#') is " . winnr('#') . "." <cr>
"nnoremap <a-s><a-b> :echo " &filetype is '" . &filetype . "'; &buftype is '" . &buftype . "'"<cr>
"nnoremap <a-s><a-f> :echo " &filetype is '" . &filetype . "'; &buftype is '" . &buftype . "'"<cr>
"}}}

""" Checkhealth {{{
if has('nvim')
  nnoremap <silent> <a-c><a-h> :<c-u>checkhealth<cr> :setlocal buftype=quickfix<cr>
  nnoremap <silent> <a-c>h     :<c-u>checkhealth<cr> :setlocal buftype=quickfix<cr>
  cnoremap <silent> <a-c><a-h> :<c-u>checkhealth<cr> :setlocal buftype=quickfix<cr>
  cnoremap <silent> <a-c>h     :<c-u>checkhealth<cr> :setlocal buftype=quickfix<cr>
endif
"}}}
"}}}
