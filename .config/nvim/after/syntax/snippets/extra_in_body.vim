" TOML: insert.toml
" Repo: SirVer/ultisnips
" Ref: Related Syntax
"  - $VIMRUNTIME/syntax/vim.vim
"  - SirVer/ultisnips/syntax/snippets.vim

let b:loaded_syntax_extra = 1

function! s:detect_extra_filetype() abort
  let full_path = expand('%:p')

  let roots = get(g:, 'UltiSnipsSnippetDirectories')
  let roots = map(roots, 'substitute(v:val, "/*$", "", "")')

  for r in sort(roots)
    let rel_path = matchstr(full_path, r .'/\zs\f\+')
    if !empty(rel_path) && rel_path !=# full_path
      let ft = matchstr(rel_path, '\v\f{-}\ze(/|\.)')
      return ft
    endif
  endfor

  return ''
endfunction
let s:ft = s:detect_extra_filetype()
delfunction s:detect_extra_filetype

function! s:override_extra_syntax() abort
  let ft = s:ft
  if empty(ft) || ft ==# 'snippets'
    return
  endif

  let default_group = '@Extra'

  let Extra = ft =~# 'sh\|all' ? '@Shell'
        \ : ft ==# 'python' ? '@Python'
        \ : ft ==# 'vim' ? '@Viml'
        \ : default_group

  if Extra ==# default_group
    try
      exe 'syntax include' Extra 'syntax/'. ft .'.vim'
      unlet b:current_syntax
    catch /E403/
      " Ignore errors about syntax files that can't be loaded more than once
    endtry
  endif

  exe 'syn region snipSnippetBody start="\_." end="^\zeendsnippet\s*$"'
        \ 'contained'
        \ 'nextgroup=snipSnippetFooter'
        \ 'contains=snipLeadingSpaces,@snipTokens,'. Extra
endfunction
call s:override_extra_syntax()
delfunction s:override_extra_syntax
