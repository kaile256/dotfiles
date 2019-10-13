" From: denite.toml
" Repo: Shougo/denite.nvim
" Another: add/denite.vim

call denite#custom#var('_', '-vertical-preview', [])

call denite#custom#var('file_rec', 'command', [
      \ 'rg',
      \ '--files',
      \ '--glob',
      \ '!.git'
      \ ])
" Grep;
" Use Interactive Mode
call denite#custom#source('grep', 'args', ['', '', '!'])
call denite#custom#var('grep', 'command', ['rg'])
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
" Matcher; Migemo or Fruzzy? {{{
"call denite#custom#source('line', 'matchers', ['matcher/migemo'])
call denite#custom#source('_', 'matchers', ['matcher/cpsm'])
"call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy'])
call denite#custom#source('file/rec',
      \ 'matchers', ['converter/tail_path', 'matcher/cpsm'])
"}}}

augroup DeniteCallMyFunctions "{{{1
  au!
  au FileType denite call <SID>denite_keymaps()
  function! s:denite_keymaps() abort "{{{2
    nnoremap <silent><buffer><expr> <CR>
          \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> <C-j>
          \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> D
          \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> <c-x>
          \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
          \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
          \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
          \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <TAB>
          \ denite#do_map('toggle_select').'j'
    nnoremap <silent><buffer><expr> <a-i>
          \ denite#do_map('toggle_select').'k'
  endfunction "}}}
  au FileType denite-filter call <SID>denite_filter_keymaps()
  function! s:denite_filter_keymaps() abort "{{{2
    inoremap <silent><buffer><expr> <C-c>
          \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> <C-c>
          \ denite#do_map('quit')
  endfunction "}}}
augroup END
