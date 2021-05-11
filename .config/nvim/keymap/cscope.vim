finish

nnoremap <SID>(find-file)            <Cmd>cs find f <C-R>=expand('<cfile>')<CR><CR>
nnoremap <SID>(find-file-included)   <Cmd>cs find i <C-R>=expand('<cfile>')<CR><CR>

nnoremap <SID>(find-func-definition) <Cmd>cs find g <C-R>=expand('<cword>')<CR><CR>
nnoremap <SID>(find-func-used)       <Cmd>cs find c <C-R>=expand('<cword>')<CR><CR>
nnoremap <SID>(find-func-internal)   <Cmd>cs find d <C-R>=expand('<cword>')<CR><CR>

nnoremap <SID>(find-c-symbol)     <Cmd>cs find s <C-R>=expand('<cword>')<CR><CR>
nnoremap <SID>(find-text-string)  <Cmd>cs find t <C-R>=expand('<cword>')<CR><CR>
nnoremap <SID>(find-egrep)        <Cmd>cs find e <C-R>=expand('<cword>')<CR><CR>
nnoremap <SID>(find-var-assigned) <Cmd>cs find a <C-R>=expand('<cword>')<CR><CR>
