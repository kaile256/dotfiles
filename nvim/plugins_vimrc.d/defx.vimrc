"" tijanhusak/defx-git

" when buffer-name is '_', the options are used fpr all buffers.
call defx#custom#option('_',{
 \ 'show_ignored_files': 0,
 \ })

call defx#custom#column('filename', {
      \ 'min_width': 40,
      \ 'max_width': 40,
      \ })

call defx#custom#column('mark', {
      \ 'readonly_icon': '✗',
      \ 'selected_icon': '✓',
      \ })

let g:defx_git#indicators = {
      \ 'Modified'  : '+',
      \ 'Staged'    : '●',
      \ 'Untracked' : '?',
      \ 'Renamed'   : '➜',
      \ 'Unmerged'  : '═',
      \ 'Deleted'   : 'x',
      \ 'Unknown'   : '?'
      \ }
