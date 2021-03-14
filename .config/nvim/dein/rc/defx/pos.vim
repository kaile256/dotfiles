scriptencoding utf-8
" From: browse.toml
" Repo: Shougo/defx.nvim
" Another: ftplugin/defx

" Ref: /usr/share/nvim/runtime/autoload/netrw.vim
" Ref: /usr/share/nvim/runtime/plugin/netrwPlugin.vim
" Ref: source/defx-icons.vim

" call defx#custom#foo() {{{1
call defx#custom#option('_', 'drives', [
      \ expand('~'),
      \ expand('~/Downloads'),
      \ ])

" TODO: Get defx's cwd with neither auto_cd nor getline(1).
" Ref: Default values
"   => Shougo/defx.nvim/autoload/defx/init.vim @94
call defx#custom#option('_', {
      \ 'columns': g:defx_format_full,
      \ 'split': 'no',
      \ 'new': 1,
      \ 'show_ignored_files': 1,
      \ 'root_marker': ':',
      \ 'auto_cd': 1,
      \
      \ 'vertical_preview': 1,
      \ 'preview_width': 80,
      \
      \ 'floating_preview': 1,
      \ 'preview_height': 80,
      \ })

call defx#custom#column('filename', {
      \ 'root_marker_highlight': 'Ignore',
      \ })

call defx#custom#column('mark', {
      \ 'readonly_icon': '✗',
      \ 'selected_icon': '✓',
      \ })

function! s:defx_commands() abort "{{{1
  " Prepare commands to chmod on defx.
  " TODO: make it a carrent path.
  command! -buffer -range -nargs=1 Chmod :call s:chmod(<q-args>)
  if !exists('*s:chmod')
    function! s:chmod(rwx) abort
      let rwx =  a:rwx =~# 'r' ? 'r' : '-'
      let rwx .= a:rwx =~# 'w' ? 'w' : '-'
      let rwx .= a:rwx =~# 'x' ? 'x' : '-'
      " TODO: get current dir
      call setfperm(getcwd() .'/'. expand('<cfile>:p'), rwx . rwx . 'r--')
    endfunction
  endif
endfunction

augroup myDefxPost "{{{1
  au FileType defx call s:defx_commands()
augroup END
