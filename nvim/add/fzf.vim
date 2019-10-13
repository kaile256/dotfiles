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
  au User     FzfStatusLine call <SID>fzf_buffer_statusline()
  " CAUTION: WinLeave's current file is next file, i.e., fzf when opening fzf-buffer.
  au WinLeave,BufLeave * if &ft ==# 'fzf' | hide
  " Note: Makes no sense but auto-set nonumber on tab-open.
  au FileType fzf setl laststatus=0
        \ | au BufEnter * ++once setl laststatus=2
        \ | if &l:number | setl number | endif
augroup END "}}}1

"let g:fzf_layout = { 'down': '~25%' }

let g:fzf_command_prefix = 'Fzf'
" Execute selected command
let g:fzf_commands_expect = 'ctrl-x'

" on Fzf Buffer; Action-Command {{{1
function! s:fzf_open_in_quickfix_list(lines) "{{{2
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction "}}}
" <alt-k> for cancel.
" Note: seems not work with <alt> like <alt-k>.
let g:fzf_action = {
      \ 'ctrl-z': '',
      \ 'alt-q': function('s:fzf_open_in_quickfix_list'),
      \ 'alt-t': 'tab split',
      \ 'alt-v': 'vsplit',
      \ 'alt-s': 'split',
      \ 'alt-a': 'argadd',
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

" Command! Ag/Rg/FZF {{{1
command! -bang -nargs=* FzfHelptags call fzf#vim#helptags({'options': '--reverse'}, <bang>0)

" TODO: set op-nargs=* tions reverse
command! -bang -nargs=* Amaps call fzf#vim#maps('',  <bang>0)
command! -bang -nargs=* Nmaps call fzf#vim#maps('n', <bang>0)
command! -bang -nargs=* Imaps call fzf#vim#maps('i', <bang>0)
command! -bang -nargs=* Xmaps call fzf#vim#maps('x', <bang>0)
command! -bang -nargs=* Smaps call fzf#vim#maps('s', <bang>0)
command! -bang -nargs=* Vmaps call fzf#vim#maps('v', <bang>0)
command! -bang -nargs=* Cmaps call fzf#vim#maps('c', <bang>0)
command! -bang -nargs=* Omaps call fzf#vim#maps('o', <bang>0)
command! -bang -nargs=* Tmaps call fzf#vim#maps('t', <bang>0)

command! -bang -nargs=* FZF
      \ call fzf#vim#files(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview({'options': '--reverse'}, 'right:65%')
      \                         : fzf#vim#with_preview({'options': '--reverse'}, 'right:65%'),
      \                 <bang>0)

command! -bang -nargs=* Fzf :FZF

" Note: There's no use to wrap 'GFiles?' independently;
"       because '?' is regarded as an arg for 'GFiles'.
command! -bang -nargs=? -complete=dir FzfGFiles
      \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview({'options': '--reverse'}, 'right:65%'), <bang>0)

" TODO: preview around the selected lines.
"command! -bang -nargs=? -complete=dir BLines
"      \ call fzf#vim#buffer_lines(<q-args>, fzf#vim#with_preview({'options': '--reverse'}, 'right:50%'), <bang>0)

" Note: not actually in ghq
command! -bang -nargs=* Ghq :cd $GOPATH <bar> FZF
"command! -bang -nargs=* Ghq
"      \ call fzf#vim#files(<q-args>,
"      \                    <bang>0 ? fzf#vim#with_preview({'source': 'ghq list --full-path',
"      \                                                    'sink': 'cd'}
"      \ ))
" Mnemonic: Quest for Project
nnoremap <a-q><a-p> :Ghq<cr>
nnoremap <a-q>p     :Ghq<cr>

command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview({'options': '--reverse'}, 'right:65%')
      \                         : fzf#vim#with_preview({'options': '--reverse'}, 'right:65%'),
      \                 <bang>0)

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --hidden --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview({'options': '--reverse'}, 'right:65%')
      \           : fzf#vim#with_preview({'options': '--reverse'}, 'right:65%'),
      \   <bang>0)

command! AgHelp  :cd  /usr/share/nvim/runtime/doc <bar> Ag
command! AgWiki  :cd  ~/vimwiki <bar> Ag
command! AgDiary :cd  ~/vimwiki/diary <bar> Ag
command! RgHelp  :cd  /usr/share/nvim/runtime/doc <bar> Rg
command! RgWiki  :cd  ~/vimwiki <bar> Rg
command! RgDiary :cd  ~/vimwiki/diary <bar> Rg
"}}}

" CmdAbbr; :Helptags {{{1
command! C :FzfColors
command! H :FzfHelptags

"" Keymap; Ag {{{1
"if !executable('ag')
"  nnoremap <silent><nowait> <a-a> :<c-u>echo "You don't have executable 'silver searcher'"<cr>
"else
"  nnoremap <silent> <space>a.     :<c-u>Ag<cr>
"  nnoremap <silent> <space>aw     :<c-u>cd %:p:h<cr>                   :Ag<cr>
"  nnoremap <silent> <space>ah     :<c-u>cd ~<cr>                       :Ag<cr>
"  nnoremap <silent> <space>ad     :<c-u>cd ~/dotfiles<cr>              :Ag<cr>
"  nnoremap <silent> <space>ag     :<c-u>cd ~/.config<cr>               :Ag<cr>
"  nnoremap <silent> <space>av     :<c-u>cd ~/.config/nvim<cr>          :Ag<cr>
"  nnoremap <silent> <space>al     :<c-u>cd ~/.local/share<cr>          :Ag<cr>
"  nnoremap <silent> <space>ar     :<c-u>cd /usr/share/nvim/runtime<cr> :Ag<cr>
"  nnoremap <silent> <space>ac     :<c-u>cd <c-r>=expand(g:dein_cache_dir)<cr><cr> :Ag<cr>
"endif
""}}}
"" Keymap; Rg {{{1
"if !executable('rg') "{{{2
"  nnoremap <silent><nowait> <space>r :<c-u>echo "You don't have executable 'ripgrep'"<cr>
"else "}}}
"  "" Rg; w/ `:cd` {{{2
"  nnoremap <silent> <space>r.     :<c-u>Rg<cr>
"  nnoremap <silent> <space>rw     :<c-u>cd %:p:h<cr>                              :Rg<cr>
"  nnoremap <silent> <space>rh     :<c-u>cd ~<cr>                                  :Rg<cr>
"  nnoremap <silent> <space>rd     :<c-u>cd ~/dotfiles<cr>                         :Rg<cr>
"  nnoremap <silent> <space>rg     :<c-u>cd ~/.config<cr>                          :Rg<cr>
"  nnoremap <silent> <space>rv     :<c-u>cd ~/.config/nvim<cr>                     :Rg<cr>
"  nnoremap <silent> <space>rl     :<c-u>cd ~/.local/share<cr>                     :Rg<cr>
"  nnoremap <silent> <space>rr     :<c-u>cd /usr/share/nvim/runtime<cr>            :Rg<cr>
"  nnoremap <silent> <space>rc     :<c-u>cd <c-r>=expand(g:dein_cache_dir)<cr><cr> :Rg<cr>
"endif
"
"" Keymap; FZF {{{1
""" FZF; w/ cd {{{2
"nnoremap <silent> <space>z. :<c-u> FZF<cr>
"nnoremap <silent> <space>zw :<c-u> cd %:p:h<cr>                              :FZF<cr>
"nnoremap <silent> <space>zh :<c-u> cd ~<cr>                                  :FZF<cr>
"nnoremap <silent> <space>zd :<c-u> cd ~/dotfiles<cr>                         :FZF<cr>
"nnoremap <silent> <space>zf :<c-u> cd ~/.config<cr>                          :FZF<cr>
"nnoremap <silent> <space>zv :<c-u> cd ~/dotfiles/nvim<cr>                    :FZF<cr>
"nnoremap <silent> <space>zl :<c-u> cd ~/.local/share<cr>                     :FZF<cr>
"nnoremap <silent> <space>zr :<c-u> cd /usr/share/nvim/runtime<cr>            :FZF<cr>
"nnoremap <silent> <space>zc :<c-u> cd <c-r>=expand(g:dein_cache_dir)<cr><cr> :FZF<cr>
"" FZF; Various {{{2
nnoremap <silent> <space>zb     :<c-u> FzfBuffers<cr>
nnoremap <silent> <space>zg     :<c-u> FzfGFiles?<cr>
"" Mnemonic: 'Old' Buffer
nnoremap <silent> <space>zo     :<c-u> FzfHistory<cr>
"" Mnemonic: Search in Current File
nnoremap <silent> <space>z/     :<c-u> FzfBLines<cr>
nnoremap <silent> <space>z;     :<c-u> FzfCommands<cr>
