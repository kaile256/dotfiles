" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

let g:sensible_split#gf#preview_winwidth_vertical   = '&tw > 0 ? &tw + 2 : 80'
let g:sensible_split#gf#preview_winheight_horizontal = '&lines / 2'

" Ref: $GHQ_ROOT/github.com/neovim/neovim/src/nvim/normal.c @6906 nv_gotofile
" if a number follows filename/path, jump to the linenumber on the buffer:
"     init.vim:10
"     init.vim @ 20
"     init.vim (30)
"     /init.vim 40

function! s:is_fugitive_available() abort
  " Check on g:loaded_fugitive may fail if user uses plugin-manager's lazy-load
  " feature like dein; make sure fugitive is loaded. Assume those user set
  " either 'Fugitive' or 'fugitive#' in on_func, or ':G' in on_cmd, at least.
  silent! echo FugitiveHead()
  silent! echo fugitive#Head()
  return exists(':G') != 0
endfunction

function! s:is_hash() abort
  if !s:is_fugitive_available()
    return 0
  endif
  return expand('<cword>') =~# '^\x\{6,}$'
endfunction

function! s:preview(open) abort
  pclose

  let mods = 'bot'
  exe mods 'G'. a:open expand('<cword>')

  if a:open =~# 'vsplit'
    exe 'vertical resize' (g:sensible_split#gf#preview_winwidth_vertical)
  elseif a:open =~# 'split'
    exe 'resize' (g:sensible_split#gf#preview_winheight_horizontal)
  endif

  setlocal previewwindow
  keepjumps wincmd p
endfunction

function! sensible#gf#_Gopen(open) abort
  let filetypes_to_preview = ['gitrebase', 'gitblame', 'fugitive']
  let is_to_preview = &ft =~# join(filetypes_to_preview, '\|')

  if is_to_preview
    call s:preview(a:open)
  else
    exe 'G'. a:open expand('<cword>')
  endif
endfunction

function! sensible#gf#edit() abort
  " This function is only for parity to default Vim.
  if s:is_hash()
    return ":call sensible#gf#_Gopen('edit')\<CR>"
  endif
  return 'gF'
endfunction

function! sensible#gf#split() abort
  if s:is_hash()
    return ":call sensible#gf#_Gopen(sensible#split()) \<CR>"
  endif

  let style = sensible#style()
  if style ==? 'tab'
    return "\<C-w>gF"
  elseif style ==? 'horizontal'
    return "\<C-w>F"
  endif

  " If vertical:
  if has('nvim-0.3.0')
    return "\<Cmd> vertical wincmd F \<CR>"
  endif

  if mode(0) =~# '[vV\<C-v>]'
    let path = getline('.')[col("'<") - 1 : col("'>") - 1]
    return ":\<C-u> vertical sfind ". path ."\<CR>"
  endif
  return ":\<C-u> vertical wincmd F \<CR>"
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
