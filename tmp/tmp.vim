
let s:wanted_info = [&syntax, &filetype, &buftype, &winnr('$'), &winnr('#')]
for i in a:wanted_info
  echo i
endfor
  "a:list_format = i
  "echo " &filetype='" . &filetype . "'; &buftype='" . &buftype . "'; " . "winnr('$') is " . winnr('$') . "; winnr('#') is " . winnr('#') . "." <cr>
