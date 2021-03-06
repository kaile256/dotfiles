finish

" Ref: /usr/share/nvim/runtime/ftplugin/help.vim @25
function! s:help_toc(mods) abort "{{{
  " TODO: toggle! see :TagbarToggle
  let bufname = bufname('%')
  let info = getloclist(0, {'winid': 1})

  if !empty(info) && getwinvar(info.winid, 'qf_toc') ==# bufname
    lopen
    return
  endif

  let toc = []
  let lnum = 2
  let last_line = line('$') - 1
  let last_index = 0
  let has_section = 0
  let has_sub_section = 0
  let toc_width = 0

  while lnum && lnum <= last_line "{{{
    let level = 0
    let index = ''
    let text = getline(lnum)

    if text =~# '^=\+$' && lnum + 1 < last_line
      " A de-facto section heading.  Other headings are inferred.
      let has_section = 1
      let has_sub_section = 0
      let lnum = nextnonblank(lnum + 1)
      let text = getline(lnum)
      let index = text

      while index =~# '\*[^*]\+\*\s*$'
        let index = matchstr(index, '.*\ze\*[^*]\+\*\s*$')
      endwhile

    elseif text =~# '^[A-Z0-9][-A-ZA-Z0-9 .][-A-Z0-9 .():]*\%([ \t]\+\*.\+\*\)\?$'
      " Any line that's yelling is important.
      let has_sub_section = 1
      let level = has_section
      let index = matchstr(text, '.\{-}\ze\s*\%([ \t]\+\*.\+\*\)\?$')

    elseif text =~# '\~$'
          \ && matchstr(text, '^\s*\zs.\{-}\ze\s*\~$') !~# '\t\|\s\{2,}'
          \ && getline(lnum - 1) =~# '^\s*<\?$\|^\s*\*.*\*$'
          \ && getline(lnum + 1) =~# '^\s*>\?$\|^\s*\*.*\*$'
      " These lines could be headers or code examples.  We only want the
      " ones that have subsequent lines at the same indent or more.
      let l = nextnonblank(lnum + 1)

      if getline(l) =~# '\*[^*]\+\*$'
        " Ignore tag lines
        let l = nextnonblank(l + 1)
      endif

      if indent(lnum) <= indent(l)
        let level = has_section + has_sub_section
        let index = matchstr(text, '\S.*')
      endif
    endif

    let index = substitute(index, '\s\+$', '', 'ge')

    let is_index = !empty(index) && last_index != lnum
    if is_index
      let last_index = lnum
      " Note: [bufnr, lnum] is necessary to jump when <CR>
      " TODO: hide [bufnr, lnum] when toc appears.
      call add(toc, {
            \ 'text': repeat('  ', level) .
            \   toupper(matchstr(index, '\a')) . tolower(index[matchstrpos(index, '\a')[1] + 1:]),
            \ 'bufnr': bufnr('%'),
            \ 'lnum': lnum,
            \ })

      if strlen(index) > toc_width
        let toc_width = strlen(index) + 2
      endif
    endif

    let lnum = nextnonblank(lnum + 1)
  endwhile "}}}

  "call setloclist(0, filter(toc, 'lnum'), ' ', 'text')
  call setloclist(0, toc, ' ', 'text')
  call setloclist(0, [], 'a', {'title': 'Help TOC'})

  exe a:mods toc_width 'lopen'
  " Note: sometimes fails to open correctly,
  "       i.e., open TOC with unnecessary path and numbers,
  "       but when ':lopen' twice, works correct
  wincmd p
  exe a:mods toc_width 'lopen'

  setl winfixwidth nonumber nowrap
  setl foldmethod=indent fdl=0
  let w:qf_toc = bufname

endfunction "}}}

function! s:help_toc_mappings() abort "{{{1
  nnoremap <silent><buffer> p     <cr><c-w>p
  nnoremap <silent><buffer> <cr>  <cr>:lclose<cr>
  nnoremap <silent><buffer> gO    :<c-u>vert bot HelpTOC<cr>
  nnoremap <silent><buffer> <a-i> :<c-u>vert bot HelpTOC<cr>
endfunction

call s:help_toc_mappings()

command! -bar HelpTOC :call s:help_toc(<q-mods>)


