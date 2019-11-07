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
    if !exists('g:_diff_started_bufnrs')
      " TODO: get all the diff bufnrs
      let g:_diff_started_bufnrs = []
    endif
    call add(g:_diff_started_bufnrs, bufnr('%'))

    " Note: on dein's hook on update, have deleted the line of dq from plugin/
    nnoremap <buffer><nowait> dq         :<c-u>WindowPKreduce<cr>
    xnoremap <buffer><nowait> dq         :<c-u>WindowPKreduce<cr>
    nnoremap <buffer><nowait> <c-w>o     :<c-u>WindowPKonly<cr>
    xnoremap <buffer><nowait> <c-w>o     :<c-u>WindowPKonly<cr>
    nnoremap <buffer><nowait> <c-w><c-o> :<c-u>WindowPKonly<cr>
    xnoremap <buffer><nowait> <c-w><c-o> :<c-u>WindowPKonly<cr>

    augroup WindowPKunmapDiff "{{{
      if !exists('*s:diff_unmap')
        function! s:diff_unmap(bufnrs) abort
          for bufnr in a:bufnrs
            if getbufvar(bufnr, '&diff') | return | endif

            silent! exe bufnr 'bufdo nunmap <buffer> dq'
            silent! exe bufnr 'bufdo xunmap <buffer> dq'
            silent! exe bufnr 'bufdo nunmap <buffer> <c-w>o'
            silent! exe bufnr 'bufdo xunmap <buffer> <c-w>o'
            silent! exe bufnr 'bufdo nunmap <buffer> <c-w><c-o>'
            silent! exe bufnr 'bufdo xunmap <buffer> <c-w><c-o>'

            silent! call remove(a:bufnrs, bufnr)
            if empty(a:bufnrs) | return | endif
          endfor
        endfunction
      endif
      au OptionSet,BufLeave * call s:diff_unmap(g:_diff_started_bufnrs)
    augroup END "}}}
  endfunction "}}}
  au OptionSet * if &diff | call s:diff_keymaps() | endif
augroup END
