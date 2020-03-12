" From: tool.toml
" Repo: simnalamburt/vim-mundo
" Another: source/mundo.vim

nnoremap <silent> <a-u> :<c-u>MundoToggle<cr>

augroup myMundoAddTrimHead
  " also available on git-diff
  au!
  au TextYankPost *{d,D}iff* call s:trim_head()
augroup END

function! s:trim_head() abort
  let regname = v:event.regname
  if empty(regname)
    " FIXME: care for blackhole-register(_)
    let regname = '"'
  endif
  let pat = '\(^\|\n\)\zs\s*[-+]'
  let @{regnamem} = substitute(regname, pat, '', 'g')
endfunction
