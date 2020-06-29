" TOML: default.toml
" Repo: simnalamburt/vim-mundo
" Another: source/mundo.vim

nnoremap <silent> <a-u> :<c-u>call <SID>mundo_toggle()<cr>

function! s:mundo_toggle() abort
  if bufwinnr(bufnr("__Mundo__")) != -1
        \ || bufwinnr(bufnr("__Mundo_Preview__")) != -1
    MundoHide
    return
  endif

  if len(tabpagebuflist()) > 2
    wincmd v
    wincmd T
    echo 'Mundo: the buffer is copied into a new tab'
  endif

  " Set mundo-windows' size dyntamically.
  let g:mundo_width          = (&columns / 2)
  let g:mundo_preview_height = (&lines /2)

  MundoShow
endfunction

augroup myMundoAdd
  if exists('#myMundoAdd') | au! myMundoAdd
  endif
  " also available on git-diff
  au TextYankPost *Mundo* call s:trim_head()
augroup END

function! s:trim_head() abort
  let regname = v:event.regname
  let lines = split(getreg(regname), "\n")
  let lines_modifed = map(lines, 'substitute(v:val, ''^\s*\zs[-+]'', " ", "")')
  let contents = join(lines_modifed, "\n")

  call setreg(regname, contents, 'l')
endfunction
