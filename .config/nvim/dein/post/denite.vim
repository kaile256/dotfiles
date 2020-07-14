" From: denite.toml
" Repo: Shougo/denite.nvim
" Another: add/denite.vim

nnoremap <silent> <a-p> :<c-u>keepj Dprev<cr>
nnoremap <silent> <a-n> :<c-u>keepj Dnext<cr>

" Options: through denite#custom#option() "{{{1
" Ref: Shougo/denite.nvim/autoload/denite/init.vim @97

let s:denite_opt = {
      \ 'statusline': 0,
      \ 'immediately-1': 1,
      \
      \ 'matchers': 'matcher/cpsm',
      \ 'sorters': 'sorter/sublime',
      \ 'empty': 0,
      \ 'split': 'tab',
      \ 'vertical_preview': 1,
      \
      \ 'auto_resize': 1,
      \ 'auto_action': 'preview',
      \ }

" let s:denite_pos = {}
" let s:denite_pos.row = {-> &lines   * 5/100}
" let s:denite_pos.col = {-> &columns * 3/100}

" let s:denite_win = {}
" let s:denite_win.height = (&lines   * 90/100)
" let s:denite_win.width  = (&columns * 45/100)

" let s:denite_floating_opt = {
"      \ 'floating_preview': 0,
"      \
"      \ 'winheight':      s:denite_win.height,
"      \ 'preview_height': s:denite_win.height,
"      \
"      \ 'winwidth':      s:denite_win.width,
"      \ 'preview_width': (&columns * 50/100),
"      \
"      \
"      \ 'winrow': s:denite_pos.row(),
"      \ 'wincol': s:denite_pos.col(),
"      \ }
" call extend(s:denite_opt, s:denite_floating_opt)
" unlet s:denite_floating_opt

call denite#custom#option('default', s:denite_opt)
unlet s:denite_opt

" Grep; {{{1
call denite#custom#source('sorter', 'reverse', 1)
" Use Interactive Mode
call denite#custom#source('grep', 'args', ['', '', '!'])

call denite#custom#var('grep', 'command', [
      \ 'rg',
      \ ])
call denite#custom#var('grep', 'default_opts', [
      \ '--vimgrep',
      \ '--no-heading',
      \ '--files',
      \ '--preview-window=right:50%',
      \ '--glob "!{.git,node_modules}/*"'
      \ ])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Exceptions; File_REC {{{
call denite#custom#var('file_rec', 'command',
      \ ['fd', '.', '-HI', '--type', 'f',
      \ '-E', '.git',
      \ '-E', 'vendor',
      \ '-E', 'node_modules',
      \ '-E', 'target',
      \
      \ '-E', '*.bak',
      \ '-E', '*.o',
      \ '-E', '*.obj',
      \ '-E', '*.pdb',
      \ '-E', '*.exe',
      \ '-E', '*.bin',
      \ '-E', '*.dll',
      \ '-E', '*.a',
      \ '-E', '*.lib',
      \ '-E', '.gitignore',
      \ '-E', '.*.*',
      \ ])
" Exceptions; Grep {{{2
" NOTE: pt covers both utf8 and sjis though I use rg.
call denite#custom#var('grep', 'command',
      \ ['rg', '--nogroup', '--nocolor', '--smart-case', '--hidden',
      \ '--ignore', '.git',
      \ '--ignore', 'vendor',
      \ '--ignore', 'node_modules',
      \ '--ignore', 'target',
      \
      \ '--ignore', '*.bak',
      \ '--ignore', '*.o',
      \ '--ignore', '*.obj',
      \ '--ignore', '*.pdb',
      \ '--ignore', '*.exe',
      \ '--ignore', '*.bin',
      \ '--ignore', '*.dll',
      \ '--ignore', '*.a',
      \ '--ignore', '*.lib',
      \ '--ignore', '.gitignore',
      \ '--ignore', '.*.*',
      \ ])
"}}}

" Custom;
" Matcher; {{{1
"call denite#custom#source('line', 'matchers', ['matcher/migemo'])
call denite#custom#source('_', 'matchers', ['matcher/cpsm'])
"call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy'])
call denite#custom#source('file/rec',
      \ 'matchers', ['converter/tail_path', 'matcher/cpsm'])

" Default Actions {{{1
"call denite#custom#kind('file', 'default_action', 'split')

" augroup myDenite-ManageTabline "{{{1
"   au!
"   au BufWinEnter          denite-filter let s:save_tabline = &l:tabline
"   au BufLeave,BufWinLeave denite-filter let &l:tabline = s:save_tabline
"   au BufEnter,BufWinEnter denite-filter call s:denite_filter_options()
"   function! s:denite_filter_options() abort
"     " FIXME: without [ERROR]
"     setlocal tabline=%{denite#get_status('input')}
"   endfunction
" augroup END

augroup myDenitePost "{{{1
  if exists('#myDenitePost') | au! myDenitePost
  endif
  "au WinLeave,BufLeave \[denite\]* call denite#do_map('quit')
  au User denite-preview call s:denite_preview_options() "{{{2
  function! s:denite_preview_options() abort
    if bufname('%') =~# '\[denite\]'
      setl number bt=nofile
    endif
  endfunction "}}}2
  au FileType denite-filter call s:denite_filter_keymaps() "{{{2
  function! s:denite_filter_keymaps() abort
    " Emacs-like Cursor Move {{{3
    inoremap <buffer> <C-a> <Home>
    inoremap <buffer> <A-f> <S-Right>
    inoremap <buffer> <C-f> <Right>
    inoremap <buffer> <C-b> <Left>
    inoremap <buffer> <A-b> <S-Left>

    " back to normalmode {{{3
    imap <buffer> <a-h> <Plug>(denite_filter_quit)
    imap <buffer> <a-j> <Plug>(denite_filter_quit)
    imap <buffer> <a-k> <Plug>(denite_filter_quit)
    imap <buffer> <a-l> <Plug>(denite_filter_quit)
    imap <buffer> <C-c> <Plug>(denite_filter_quit)
    " update {{{3
    imap <buffer> <c-j> <Plug>(denite_filter_update)

    inoremap <silent><buffer><expr> <c-l>
          \ denite#do_map('redraw')
    inoremap <silent><buffer><expr> <c-d>
          \ getline('.')[:col('.')] =~? '\w'?
          \ denite#do_map('quit'):
          \ '<del>'
    " select {{{3
    inoremap <silent><buffer><expr> <TAB>
          \ denite#do_map('toggle_select')
    inoremap <silent><buffer> <C-k>
          \ <Esc>
          \ :call denite#move_to_parent()<CR>k
          \ :call denite#move_to_filter()<CR>A
    inoremap <silent><buffer> <C-j>
          \ <Esc>
          \ :call denite#move_to_parent()<CR>j
          \ :call denite#move_to_filter()<CR>A
  endfunction "}}}2
  au FileType denite call s:denite_keymaps() "{{{2
  function! s:denite_keymaps() abort
    nnoremap <silent><buffer><expr> i
          \ denite#do_map('open_filter_buffer')
    " quit {{{3
    " TODO: get current split more flexible
    nnoremap <silent><buffer><expr> <a-h>
          \ denite#custom#_get().option.default.split ==# 'floating' ?
          \ denite#do_map('quit') :
          \ '<c-w>h'
    nnoremap <silent><buffer><expr> <a-j>
          \ denite#custom#_get().option.default.split ==# 'floating' ?
          \ denite#do_map('quit') :
          \ '<c-w>j'
    nnoremap <silent><buffer><expr> <a-k>
          \ denite#custom#_get().option.default.split ==# 'floating' ?
          \ denite#do_map('quit') :
          \ '<c-w>k'
    nnoremap <silent><buffer><expr> <a-l>
          \ denite#custom#_get().option.default.split ==# 'floating' ?
          \ denite#do_map('quit') :
          \ '<c-w>l'

    " Open {{{3
    nnoremap <silent><buffer><expr> <CR>
          \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> <C-j>
          \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> q
          \ denite#do_map('do_action', 'location')
    nnoremap <silent><buffer><expr> gO
          \ denite#do_map('do_action', 'tabopen')
    nnoremap <silent><buffer><expr> O
          \ denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> o
          \ denite#do_map('do_action', 'split')

    " Delete/Preview {{{3
    nnoremap <silent><buffer><expr> dd
          \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> D
          \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> <c-x>
          \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
          \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> P
          \ denite#do_map('do_action', 'preview')

    " too slow
    "nnoremap <silent><buffer><expr> k
    "      \ 'k'.
    "      \ denite#do_map('do_action', 'preview')
    "nnoremap <silent><buffer><expr> j
    "      \ 'j'.
    "      \ denite#do_map('do_action', 'preview')

    " Select {{{3
    nnoremap <silent><buffer><expr> mm
          \ denite#do_map('toggle_select')
    nnoremap <silent><buffer><expr> mj
          \ denite#do_map('toggle_select') .'j'
    nnoremap <silent><buffer><expr> mk
          \ denite#do_map('toggle_select') .'k'
    nnoremap <silent><buffer><expr> ma
          \ denite#do_map('toggle_select_all')

    nnoremap <silent><buffer><expr> <c-o>
          \ denite#do_map('restore_sources')
    nnoremap <silent><buffer><expr> <c-^>
          \ denite#do_map('restore_sources')
    nnoremap <silent><buffer><expr> .
          \ denite#do_map('do_previous_action')

    " Find {{{3
    if hasmapto('sneak#') && exists('*sneak#users')
      nnoremap <buffer><silent> f :call sneak#users('f2')<cr>
      nnoremap <buffer><silent> t :call sneak#users('t2')<cr>
      nnoremap <buffer><silent> F :call sneak#users('F2')<cr>
      nnoremap <buffer><silent> T :call sneak#users('T2')<cr>
      xnoremap <buffer><silent> f :call sneak#users('f2', visualmode())<cr>
      xnoremap <buffer><silent> t :call sneak#users('t2', visualmode())<cr>
      xnoremap <buffer><silent> F :call sneak#users('F2', visualmode())<cr>
      xnoremap <buffer><silent> T :call sneak#users('T2', visualmode())<cr>
      onoremap <buffer><silent> f :call sneak#users('f2', v:operator)<cr>
      onoremap <buffer><silent> t :call sneak#users('t2', v:operator)<cr>
      onoremap <buffer><silent> F :call sneak#users('F2', v:operator)<cr>
      onoremap <buffer><silent> T :call sneak#users('T2', v:operator)<cr>
    endif
  endfunction "}}}2
augroup END
