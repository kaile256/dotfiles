" From: tool.toml
" Repo: simnalamburt/vim-mundo
" Another: source/mundo.vim

nnoremap <silent> <a-u> :<c-u>MundoToggle<cr>

augroup myMundoAdd
  if exists('#myMundoAdd') | au! myMundoAdd
  endif
  " also available on git-diff
  " FIXME: make it work
  au TextYankPost *{d,D}iff* call s:trim_head()
augroup END

function! s:trim_head() abort
  let regname = v:event.regname
  if empty(regname)
    " FIXME: care for blackhole-register(_)
    let regname = '"'
  endif
  let pat = '\(^\|\n\)\zs\s*[-+]'
  exe 'let @'. regname "= substitute('@'". regname ", pat, '', 'g')"
endfunction
