" From: ftplugin.toml
" Repo: previm/previm

if has('unix')
  let g:previm_open_cmd = 'xargs qutebrowser'
elseif has('mac')
  let g:previm_open_cmd = 'open -a qutebrowser'
endif

let g:previm_custom_css_path = g:my_css_home .'/qiita-md.css'
"let g:previm_custom_css_path = g:my_css_home .'/github-md.css'
unlet s:css_home
