function! vplug#name#plugin() abort "{{{1
  return matchstr(expand('%:p'), '/\%[vim-]\zs[^/]*\ze\%[.n]\%[vim]/\(autoload/\|plugin\/\)')
endfunction

function! vplug#name#file() abort "{{{1
  return matchstr(expand('%:p:.'), '\(autoload\|plugin\)/.*')
endfunction

function! vplug#name#repo() abort "{{{1
  return matchstr(expand('%:p'), '[^/]\+\ze/\(autoload\|plugin\)/')
endfunction

function! vplug#name#repo_underscored(name) abort "{{{1
substitute(matchstr(expand('%:p'), '/\%[vim-]\zs[^/]*\ze\%[.n]\%[vim]/\(autoload/\|plugin\/\)'), '/', '_', 'g')
endfunction
