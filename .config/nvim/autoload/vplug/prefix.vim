function! vplug#prefix#function() abort
  return expand('%') =~# 'autoload'
        \ ? substitute(matchstr(expand('%:p'),'autoload/\zs.*\ze.vim'),'[/\\]','#','g').'#'
        \ : 's:'
endfunction
