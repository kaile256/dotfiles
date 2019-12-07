" From: ftplugin.toml
" Repo: previm/previm

if has('unix')
  let g:previm_open_cmd = 'xargs qutebrowser'
elseif has('mac')
  let g:previm_open_cmd = 'open -a qutebrowser'
endif

let s:css_home = g:dotfiles_home .'/css/'
let g:previm_custom_css_path = s:css_home .'/qiita-md.css'
"let g:previm_custom_css_path = s:css_home .'/github-md.css'
unlet s:css_home
