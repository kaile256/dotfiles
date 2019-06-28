"" tijanhusak/defx-git
"call defx#custom#option('_',{
"      \ 'columns': 'indent:git:icons:filename',
"      \ 'show_ignored_files': 1,
"      \ })

let g:defx_git#indicators = {
      \ 'Modified'  : '+',
      \ 'Staged'    : '●',
      \ 'Untracked' : '?',
      \ 'Renamed'   : '➜',
      \ 'Unmerged'  : '═',
      \ 'Deleted'   : 'x',
      \ 'Unknown'   : '?'
      \ }
