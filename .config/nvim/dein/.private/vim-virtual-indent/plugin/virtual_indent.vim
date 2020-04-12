" Starts From: https://www.reddit.com/r/neovim/comments/fxjjqh/indent_guides_on_blank_lines_with_virtual_text/?utm_name=iossmf

let g:virtual_indent_namespace = get(g:, 'virtual_indent_namespace',
      \ nvim_create_namespace('virtual_indent'))

function! s:virtual_indent() abort
  if !&modifiable | return | endif

  call nvim_buf_clear_namespace(0, g:virtual_indent_namespace, 1, -1)

  let save_view = winsaveview()
  let save_fdo  = &foldopen
  let save_so   = &scrolloff
  set foldopen=
  set scrolloff=0

  norm! L
  let bot_line = winline()
  norm! H

  while winline() < bot_line
    norm! j
    if getline('.') !~# '^$' | continue | endif

    let line = line('.')
    let l:indent = cindent(line)
    if l:indent > 0
      call nvim_buf_set_virtual_text(
            \   0,
            \   g:virtual_indent_namespace,
            \   line - 1,
            \   [[repeat(repeat(' ', &shiftwidth - 1) .'¦', l:indent / &shiftwidth),
            \     'VirtualIndent']],
            \   {}
            \ )
    endif
  endwhile

  let &foldopen  = save_fdo
  let &scrolloff = save_so
  call winrestview(save_view)
endfunction

hi! link VirtualIndent NonText

augroup VirtualIndent
  if exists('#VirtualIndent') | au! VirtualIndent
  endif
  au BufEnter,InsertLeave,TextChanged * call s:virtual_indent()
augroup END
