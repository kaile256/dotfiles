" TOML: insert.toml
" Repo: SirVer/ultisnips

function! s:override_extra_syntax() abort
  function! s:detect_extra_filetype() abort closure
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

  let ft = s:detect_extra_filetype()
  if empty(ft) || ft ==# 'snippets'
    return
  endif

  let Extra = ft =~# 'sh\|all' ? '@Shell'
        \ : ft ==# 'python' ? '@Python'
        \ : ft ==# 'vim' ? '@Viml'
        \ : '@Extra'

  if Extra ==# '@Extra'
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
