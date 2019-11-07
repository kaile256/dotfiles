" From: myplug.toml
" Repo: kaile256/vim-window-picker

noremap <silent> <a-space><space>   :<c-u>WindowPKreduce<cr>
noremap <silent> <a-space><a-space> :<c-u>WindowPKreduce<cr>
"noremap <silent> <a-space><space>   :<c-u>windo if &bt == ('nofile' <bar><bar> 'nowrite' <bar><bar> 'quickfix') <bar> quit <bar> endif<cr>
"noremap <silent> <a-space><a-space> :<c-u>windo if &bt == ('nofile' <bar><bar> 'nowrite' <bar><bar> 'quickfix') <bar> quit <bar> endif<cr>

let g:windowPK_label2patterns = {}
let g:windowPK_label2patterns.default = {
      \ '&buftype': [
      \   'nofile',
      \   'nowrite',
      \   'quickfix',
      \   'help',
      \   ],
      \
      \ 'path': [
      \   'twiggy:\/\/',
      \   '.git\/',
      \   ],
      \ }

"let g:windowPK_label2excmd = {}

augroup WindowPKonDiff
  function! s:diff_keymaps() abort "{{{
    if !exists('s:_diff_bufnrs')
      " TODO: get all the diff bufnrs
      let s:_diff_bufnrs = []
    endif
    if index(s:_diff_bufnrs, bufnr('%')) | return | endif

    " Note: on dein's hook on update, have deleted the line of dq from plugin/
    nnoremap <buffer><nowait> dq         :<c-u>WindowPKreduce<cr>
    xnoremap <buffer><nowait> dq         :<c-u>WindowPKreduce<cr>
    nnoremap <buffer><nowait> <c-w>o     :<c-u>WindowPKonly<cr>
    xnoremap <buffer><nowait> <c-w>o     :<c-u>WindowPKonly<cr>
    nnoremap <buffer><nowait> <c-w><c-o> :<c-u>WindowPKonly<cr>
    xnoremap <buffer><nowait> <c-w><c-o> :<c-u>WindowPKonly<cr>

    call add(s:_diff_bufnrs, bufnr('%'))
  endfunction "}}}
  au OptionSet,WinEnter * if &diff | call s:diff_keymaps() | endif
  function! s:diff_unmap() abort "{{{
    if !exists('s:_diff_bufnrs') | return | endif
    let bufnrs = get(s:, '_diff_bufnrs', [])
    for bufnr in bufnrs
      if getbufvar(bufnr, '&diff') | return | endif

      silent! exe bufnr 'bufdo nunmap <buffer> dq'
      silent! exe bufnr 'bufdo xunmap <buffer> dq'
      silent! exe bufnr 'bufdo nunmap <buffer> <c-w>o'
      silent! exe bufnr 'bufdo xunmap <buffer> <c-w>o'
      silent! exe bufnr 'bufdo nunmap <buffer> <c-w><c-o>'
      silent! exe bufnr 'bufdo xunmap <buffer> <c-w><c-o>'

      silent! call remove(bufnrs, bufnr)
      if empty(bufnrs) | return | endif
    endfor
  endfunction "}}}
  au OptionSet,BufLeave * call s:diff_unmap()
augroup END
