" From: nvim/init.vim

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

"function! s:echo_file_info() abort "{{{
"  let a:wanted_info = [&syntax, &filetype, &buftype, &winnr('$'), &winnr('#')]
"  for i in a:wanted_info
"    a:list_format = i
"  echo " &filetype='" . &filetype . "'; &buftype='" . &buftype . "'; " . "winnr('$') is " . winnr('$') . "; winnr('#') is " . winnr('#') . "."
"endfor
"endfunction "}}}

function! s:keymap_for_commandline() abort "{{{
  nnoremap <buffer><nowait> <a-k> <c-c><c-c>
endfunction "}}}
"}}}

augroup ConfirmOnError "{{{
  au!
  " CAUTION: &syntax is NOT boolean.
  "au BufEnter * if &syntax == '' | syntax enable | endif
""" Experimental: `:h confirm`
"au BufEnter * if &filetype == '' | confirm | endif
  "au BufEnter * if &filetype == 'conf' | confirm | endif
"au BufEnter * if &filetype == '' | confirm | endif
augroup END "}}}

augroup AppendFileType "{{{

  au!
  au BufWinEnter *.vim!      setlocal filetype=vim
  au BufWinEnter *.vimrc!    setlocal filetype=vim
  au BufWinEnter i3/*/config setlocal filetype=i3
  au BufWinEnter *.txt       setlocal syntax=help
  "au BufWinEnter *.snip      setlocal ft=snippets
  "au BufWinEnter *.snippets  setlocal ft=snippets

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
  function! s:foldmethod_on_filetype() "{{{
    if &ft == 'snipeets' || 'json'
      setlocal foldmethod=syntax
    elseif &ft == 'vim' || 'toml' || 'i3'
      setlocal foldmethod=marker
    endif
  endfunction
  au WinEnter * call <SID>foldmethod_on_filetype()
  au WinEnter * if &filetype == 'snippets' | setlocal foldmethod=syntax foldlevel=0 | endif
  au WinEnter * if &filetype == 'json' | setlocal foldmethod=syntax foldlevel=0 | endif
  au WinEnter * if &filetype == 'vim'  | setlocal foldmethod=marker foldlevel=0 | endif
  au WinEnter * if &filetype == 'toml' | setlocal foldmethod=marker foldlevel=0 | endif
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

augroup BufWipeExceptTerminal "{{{
  au!

""" Treat as QuickFix
au FileType qt call s:quickfix_keymap()
augroup END "}}}

augroup AutoFormat "{{{
  au!
  "" Cursor Locates on the Middle
  "au BufWinEnter * if &filetype ==# 'help' | norm zz | endif

""" AutoFormat; Unusual Appending on BufList "{{{
"" Append Help on Buffer-list
au BufWinLeave *  if &buftype ==# 'help' | setlocal buflisted nonumber signcolumn= | endif

""" AutoFormat; &filetype == 'qf' {{{
"" CAUTION: if you set them as &bt=quickfix, the settings affects those like &ft=vimwiki.
au FileType qf setlocal signcolumn=
"}}}
"}}}

""" AutoFormat; Delete "{{{
"" Space Unnecessary
au BufWritePre * silent keepjumps keeppatterns %s/\s\+$//ge
"" URL
"" Remove Unnecessary part of URL
au BufWritePre *.toml   silent keeppatterns %s/https:\/\/github.com\///ge
au FileType toml nnoremap <buffer><silent> <s-tab> :keepjumps keeppatterns %s/^\s\+//ge<cr>
"}}}

"au BufRead * call <SID>auto_format_if_modifiable()

""" Re-Syntax on Error
"au FocusLost,ColorScheme * if &syntax == '' | syntax enable | endif
augroup END "}}}

augroup KeymapOnCondition "{{{
  au!
  au CmdwinEnter * call <SID>keymap_for_commandline()
augroup END "}}}
"}}}


" Keymap; 'SOurce' init.vim {{{
nnoremap <silent> <a-s><a-o> :<c-u>so % <bar> echo ' Vim sourced "' . bufname('%') . '"'<CR>
nnoremap <silent> <a-s>o     :<c- Reloadu>so % <bar> echo ' Vim sourced "' . bufname('%') . '"'<CR>
"}}}

"" Keymap; 'Show Status' of the buffer {{{
function! s:echo_file_info() "{{{
  echo "&syn='" . &syn . "'; &ft='" . &ft . "'; &bt='" . &bt . "'; &fdm='" . &fdm . "'"
endfunction "}}}

nnoremap <a-s><a-s> call <SID>echo_file_info()
nnoremap <a-s><a-s> call <SID>echo_file_info()
nnoremap <silent> <a-s><a-s> :echo "&syn='" . &syn . "'; &ft='" . &ft . "'; &bt='" . &bt . "'; &fdm='" . &fdm . "'" <cr>
nnoremap <silent> <a-s><a-s> :echo "&syn='" . &syn . "'; &ft='" . &ft . "'; &bt='" . &bt . "'; &fdm='" . &fdm . "'" <cr>
cnoremap <expr> so (getcmdtype() == ':' && getcmdline() =~ '^so$')? 'so%' : 'so'
"}}}

" Keymap; Checkhealth {{{
if has('nvim')
  nnoremap <silent> <a-c><a-h> :<c-u>checkhealth<cr> :setlocal buftype=quickfix<cr>
  nnoremap <silent> <a-c>h     :<c-u>checkhealth<cr> :setlocal buftype=quickfix<cr>
  cnoremap <silent> <a-c><a-h> :<c-u>checkhealth<cr> :setlocal buftype=quickfix<cr>
  cnoremap <silent> <a-c>h     :<c-u>checkhealth<cr> :setlocal buftype=quickfix<cr>
endif
"}}}
