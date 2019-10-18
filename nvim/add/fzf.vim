scriptencoding utf-8
" From: finder.toml
" Repo: junegunn/fzf.vim

" Note: :FZF! starts fzf on full-window.

augroup FzfMyAutoConf "{{{1
  au!
  function! s:fzf_buffer_statusline() "{{{2
    " Override statusline as you like
    hi fzf1 ctermfg=161 ctermbg=251
    hi fzf2 ctermfg=23  ctermbg=251
    hi fzf3 ctermfg=237 ctermbg=251
    setl statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
  endfunction "}}}2
  au User FzfStatusLine call <SID>fzf_buffer_statusline()
  " CAUTION: WinLeave's current file is next file, i.e., fzf when opening fzf-buffer.
  au WinLeave,BufLeave * if &ft ==# 'fzf' | hide
  " Note: Makes no sense but auto-set nonumber on tab-open.
  au FileType fzf setl laststatus=0
        \ | au BufEnter * ++once setl laststatus=2
        \ | if &l:number | setl number | endif
augroup END "}}}1

"let g:fzf_layout = { 'down': '~25%' }

"let g:fzf_command_prefix = 'Fzf' " makes complex hook on dein.
" Note: write in a string w/ no spaces, not in a list.
let g:fzf_commands_expect = 'ctrl-x,alt-x'

" on Fzf Buffer; Action-Command {{{1
function! s:fzf_open_in_quickfix_list(lines) "{{{2
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction "}}}
" <alt-k> for cancel.
" Note: seems not work with <alt> like <alt-k>.
" bdelete/bwipeout work incorrect, lured to current buffer.
" badd: Get it in list of buffers.
let g:fzf_action = {
      \ 'alt-a': 'argadd',
      \ 'alt-g': 'badd',
      \ 'alt-q': function('s:fzf_open_in_quickfix_list'),
      \ 'alt-s': 'split',
      \ 'alt-t': 'tab split',
      \ 'alt-v': 'vsplit',
      \ 'ctrl-z': '',
      \ }
" [Buffers] Rather Jump to window than just to open.
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_history_dir = '~/.local/share/fzf-history'
"" args: down/up/left/right

" on Fzf Buffer; Color Config {{{1
let g:fzf_colors =
      \ { 'fg':      ['fg', 'None'],
      \   'bg':      ['bg', 'None'],
      \   'hl':      ['fg', 'Comment'],
      \   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \   'hl+':     ['fg', 'Statement'],
      \   'info':    ['fg', 'PreProc'],
      \   'border':  ['fg', 'Ignore'],
      \   'prompt':  ['fg', 'Conditional'],
      \   'pointer': ['fg', 'Exception'],
      \   'marker':  ['fg', 'Keyword'],
      \   'spinner': ['fg', 'Label'],
      \   'header':  ['fg', 'Comment'] }
"}}}

imap <c-x><c-f> <c-o>:cd ~<cr><plug>(fzf-complete-file-ag)
imap <c-x>f     <c-o>:cd ~<cr><plug>(fzf-complete-file-ag)

" Command! expand default w/ preview {{{1
command! -bang -nargs=* FZF
      \ call fzf#vim#files(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:65%')
      \                         : fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:65%'),
      \                 <bang>0)

command! -bang -nargs=* Fzf :FZF

command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:65%')
      \                         : fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:65%'),
      \                 <bang>0)

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --hidden --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview({'options': '--reverse'}, 'right:65%')
      \           : fzf#vim#with_preview({'options': '--reverse'}, 'right:65%'),
      \   <bang>0)

" Note: There's no use to wrap 'GFiles?' independently;
"       because '?' is regarded as an arg for 'GFiles'.
" TODO: even on '?'-version, show preview.
command! -bang -nargs=? -complete=dir Gfiles
      \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:65%'), <bang>0)
"}}}1
" Command: expand default want preview {{{
" difficult, preview feature
command! -bang -nargs=* -complete=buffer Buffers
      \ call fzf#vim#buffers(<q-args>, {'options': '--multi --reverse'})
"command! -bang -nargs=* -complete=buffer Buffers
"      \ call fzf#vim#buffers(<q-args>,
"      \                 <bang>0 ? fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:65%')
"      \                         : fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:65%'),
"      \                 <bang>0)
command! -bang -nargs=* Helptags call fzf#vim#helptags({'options': '--multi --reverse'}, <bang>0)
"}}}
" TODO: make :History --reverse --multi. {{{1
"command! -bang -nargs=* History
"      \ call s:history(<q-args>, <bang>0)
"      \                 <bang>0 ? fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:65%')
"      \                         : fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:65%'),
"      \                 <bang>0)
"function! s:history(arg, bang)
"  let bang = a:bang || a:arg[len(a:arg) -1] == '!'
"  if a:arg[0] == ':'
"    call fzf#vim#command_history(bang)
"  elseif a:arg[0] == '/'
"    call fzf#vim#search_history(bang)
"  else
"    call fzf#vim#history(bang)
"  endif
"endfunction
""}}}1
" Command: Maps {{{1
" TODO: set options reverse
command! -bang -nargs=* Amaps call fzf#vim#maps('',  <bang>0)
command! -bang -nargs=* Nmaps call fzf#vim#maps('n', <bang>0)
command! -bang -nargs=* Imaps call fzf#vim#maps('i', <bang>0)
command! -bang -nargs=* Xmaps call fzf#vim#maps('x', <bang>0)
command! -bang -nargs=* Smaps call fzf#vim#maps('s', <bang>0)
command! -bang -nargs=* Vmaps call fzf#vim#maps('v', <bang>0)
command! -bang -nargs=* Cmaps call fzf#vim#maps('c', <bang>0)
command! -bang -nargs=* Omaps call fzf#vim#maps('o', <bang>0)
command! -bang -nargs=* Tmaps call fzf#vim#maps('t', <bang>0)
"}}}1
" Command: Original {{{1
" TODO: selector of terminal-buffer.
command! -bang -nargs=* -complete=buffer Terminal
      \ call fzf#vim#buffers(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:65%')
      \                         : fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:65%'),
      \                 <bang>0)

"}}}1

" TODO: preview around the selected lines.
"command! -bang -nargs=? -complete=dir BLines
"      \ call fzf#vim#buffer_lines(<q-args>, fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:50%'), <bang>0)

" Note: not actually in ghq
command! -bang -nargs=* Ghq :cd $GOPATH <bar> FZF
"command! -bang -nargs=* Ghq
"      \ call fzf#vim#files(<q-args>,
"      \                    <bang>0 ? fzf#vim#with_preview({'source': 'ghq list --multi --full-path',
"      \                                                    'sink': 'cd'}
"      \ ))
" Mnemonic: Quest for Project
nnoremap <a-q><a-p> :Ghq<cr>
nnoremap <a-q>p     :Ghq<cr>

command! AgHelp  :cd  /usr/share/nvim/runtime/doc <bar> Ag
command! AgWiki  :cd  ~/vimwiki <bar> Ag
command! AgDiary :cd  ~/vimwiki/diary <bar> Ag
command! RgHelp  :cd  /usr/share/nvim/runtime/doc <bar> Rg
command! RgWiki  :cd  ~/vimwiki <bar> Rg
command! RgDiary :cd  ~/vimwiki/diary <bar> Rg
"}}}

" CmdAbbr; :Helptags {{{1
command! Co :Colors
command! C :Colors
command! H :Helptags
command! He :Helptags

"" FZF; Various {{{1
nnoremap <silent> <space>zb     :<c-u> Buffers<cr>
nnoremap <silent> <space>zG     :<c-u> Gfiles<cr>
nnoremap <silent> <space>zg     :<c-u> Gfiles?<cr>
"" Mnemonic: 'Old' Buffer
nnoremap <silent> <space>zo     :<c-u> History<cr>
"" Mnemonic: Search in Current File
nnoremap <silent> <space>z/     :<c-u> BLines<cr>
nnoremap <silent> <space>z;     :<c-u> History:<cr>

