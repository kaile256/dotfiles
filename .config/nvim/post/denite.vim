" From: denite.toml
" Repo: Shougo/denite.nvim
" Another: add/denite.vim

nnoremap <silent> <a-p> :<c-u>keepj DenitePrev<cr>
nnoremap <silent> <a-n> :<c-u>keepj DeniteNext<cr>

" Options: "{{{1
" Ref: Shougo/denite.nvim/autoload/denite/init.vim @97

let s:denite_pos = {}
let s:denite_pos.row = (&lines   * 10/100)
let s:denite_pos.col = (&columns * 5/100)

let s:denite_height = &lines   * 80/100
let s:denite_width  = &columns * 40/100
call denite#custom#option('default', {
      \ 'statusline': 0,
      \ 'immediately-1': 1,
      \
      \ 'matchers': 'matcher/cpsm',
      \ 'sorters': 'sorter/sublime',
      \
      \ 'winrow': s:denite_pos.row,
      \ 'wincol': s:denite_pos.col,
      \
      \ 'winheight':      s:denite_height,
      \ 'preview_height': s:denite_height,
      \
      \ 'winwidth':      s:denite_width,
      \ 'preview_width': (&columns * 50/100),
      \
      \ 'split': 'floating',
      \ 'vertical_preview': 1,
      \ 'floating_preview': 1,
      \
      \ 'auto_resize': 1,
      \ 'auto_action': 'preview',
      \ })
unlet s:denite_height s:denite_width s:denite_pos

" Grep; {{{1
" Use Interactive Mode
call denite#custom#source('grep', 'args', ['', '', '!'])

call denite#custom#var('grep', 'command', [
      \ 'rg',
      \ '--files',
      \ '--glob',
      \ '--preview-window=right:50%',
      \ '!.git'
      \ ])

call denite#custom#var('grep', 'default_opts',
      \ ['-i', '--vimgrep', '--no-heading'])
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

augroup myDenitePost "{{{1
  au!
  "au WinLeave,BufLeave \[denite\]* call denite#do_map('quit')
  au User denite-preview call s:denite_preview_options() "{{{2
  function! s:denite_preview_options() abort
    setl number bt=nofile
  endfunction "}}}2
  au FileType denite-filter call s:denite_filter_keymaps() "{{{2
  function! s:denite_filter_keymaps() abort
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
    inoremap <silent><buffer> <C-j>
          \ <esc><c-w>p:call cursor(line('.') + 1, 0)<cr><c-w>pA
    inoremap <silent><buffer> <C-k>
          \ <esc><c-w>p:call cursor(line('.') - 1, 0)<cr><c-w>pA
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

    nnoremap <silent><buffer> k
          \ k:call denite#do_map('do_action', 'preview')<cr>
    nnoremap <silent><buffer> j
          \ j:call denite#do_map('do_action', 'preview')<cr>

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
