" TOML: browse.toml
" Repo: lambdalisue/fern.vim
" Another: add/fern.vim

let g:fern#disable_default_mappings = 1

augroup myFernSo
  au!
  au FileType fern setlocal nonumber
  au FileType fern call s:keymaps()
augroup END

function! s:keymaps() abort
  nmap <buffer><nowait> <C-g> <Plug>(fern-action-cancel)
  nmap <buffer><nowait> h <Plug>(fern-action-leave)
  nmap <buffer><nowait> l <Plug>(fern-action-enter)

  nmap <buffer><nowait> e <Plug>(fern-action-cd:cursor)
  nmap <buffer><nowait> e <Plug>(fern-action-cd:root)
  nmap <buffer><nowait> e <Plug>(fern-action-lcd:cursor)
  nmap <buffer><nowait> e <Plug>(fern-action-lcd:root)
  nmap <buffer><nowait> e <Plug>(fern-action-tcd:cursor)
  nmap <buffer><nowait> e <Plug>(fern-action-tcd:root)

  nmap <buffer><nowait> e <Plug>(fern-action-choice)

  nmap <buffer><nowait> zc <Plug>(fern-action-collapse)
  nmap <buffer><nowait> zo <Plug>(fern-action-expand)

  " nmap <buffer><nowait> e <Plug>(fern-action-debug)
  nmap <buffer><nowait> x <Plug>(fern-action-move)
  nmap <buffer><nowait> c <Plug>(fern-action-copy)

  nmap <buffer><nowait> e <Plug>(fern-action-exclude)
  nmap <buffer><nowait> e <Plug>(fern-action-include)

  " nmap <buffer><nowait> / <Plug>(fern-action-grep)

  nmap <buffer><nowait> ? <Plug>(fern-action-help)
  nmap <buffer><nowait> g? <Plug>(fern-action-help:all)

  nmap <buffer><nowait> e <Plug>(fern-action-hidden-set)
  nmap <buffer><nowait> e <Plug>(fern-action-hidden-toggle)
  nmap <buffer><nowait> e <Plug>(fern-action-hidden-unset)


  nmap <buffer><nowait> e <Plug>(fern-action-mark-clear)
  nmap <buffer><nowait> e <Plug>(fern-action-mark-set)
  nmap <buffer><nowait> e <Plug>(fern-action-mark-toggle)
  nmap <buffer><nowait> e <Plug>(fern-action-mark-unset

  nmap <buffer><nowait> d <Plug>(fern-action-new-dir)
  nmap <buffer><nowait> % <Plug>(fern-action-new-file)

  nmap <buffer><nowait> <CR> <Plug>(fern-action-open:edit-or-error)
  nmap <buffer><nowait> e <Plug>(fern-action-open:edit-or-error)
  nmap <buffer><nowait> m <Plug>(fern-action-open:select)
  nmap <buffer><nowait> o <Plug>(fern-action-open:split)
  nmap <buffer><nowait> e <Plug>(fern-action-open:system)
  nmap <buffer><nowait> e <Plug>(fern-action-open:tabedit)
  nmap <buffer><nowait> e <Plug>(fern-action-open:vsplit)

  nmap <buffer><nowait> e <Plug>(fern-action-redraw)
  nmap <buffer><nowait> e <Plug>(fern-action-reload)

  nmap <buffer><nowait> D  <Plug>(fern-action-trash)
  nmap <buffer><nowait> \D <Plug>(fern-action-remove)

  nmap <buffer><nowait> r <Plug>(fern-action-rename:edit-or-error)
  nmap <buffer><nowait> e <Plug>(fern-action-rename:select)
  nmap <buffer><nowait> e <Plug>(fern-action-rename:split)

  nmap <buffer><nowait> . <Plug>(fern-action-repeat)

  nmap <buffer><nowait> e <Plug>(fern-action-reveal)

  nmap <buffer><nowait> e <Plug>(fern-action-terminal:edit-or-error)

  " fern-action-zoom: expand fern-window
  nmap <buffer><nowait> zR <Plug>(fern-action-zoom:half)
  " nmap <buffer><nowait> e <Plug>(fern-wait)
endfunction
