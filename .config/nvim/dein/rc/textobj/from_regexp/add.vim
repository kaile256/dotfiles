" TOML: textobj.toml
" Repo: osyo-manga/vim-textobj-from_regexp

function! s:get_path() abort
  const pat_scheme = '\%([a-z]\+:\/\/\)\='
  const pat_url_char = '[^*|''" \t]'
  const pat_path = pat_scheme .. pat_url_char .. '\+\/' .. pat_url_char .. '*'
  return textobj#from_regexp#mapexpr(pat_path)
endfunction
omap <expr> <SID>(textobj-get-path) <SID>get_path()
xmap <expr> <SID>(textobj-get-path) <SID>get_path()

omap <expr> <SID>(textobj-get-method) textobj#from_regexp#mapexpr('\h[0-9a-zA-Z_#]*\ze(')
xmap <expr> <SID>(textobj-get-method) textobj#from_regexp#mapexpr('\h[0-9a-zA-Z_#]*\ze(')


omap gp <SID>(textobj-get-path)
xmap gp <SID>(textobj-get-path)

omap gm <SID>(textobj-get-method)
xmap gm <SID>(textobj-get-method)
