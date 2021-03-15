" TOML: browse.toml
" Repo: Shougo/defx.nvim
" Another: add/defx.vim
" Another: post/defx.vim

nnoremap <silent><buffer><nowait> U :<C-u> call defx#redraw() <CR>

" Explore {{{1
" Explore; hjkl {{{2
nnoremap <silent><nowait><buffer> gg :2<cr>
nnoremap <silent><nowait><buffer><expr> h
      \ defx#do_action('cd', ['..'])
" Note: 'zb' to always show all dir/file
nnoremap <silent><nowait><buffer><expr> l
      \ defx#do_action('open_directory')
      \ .'zb'
      "\ <SID>defx_is_wide()?
      "\ defx#do_action('open_tree')
" Explore; CWD {{{2
nnoremap <silent><nowait><buffer><expr> <c-g>
      \ defx#do_action('print')
"" CWD; defx's
nnoremap <silent><nowait><buffer><expr> ~
      \ defx#do_action('cd')
      \ .':echo "cd" $HOME<CR>'
"" CWD; vim's
" Note: @% will be 'foo/[defx]'
nnoremap <silent><nowait><buffer><expr> <space>ww
      \ defx#do_action('change_vim_cwd')
      \ .':echo "cd" expand("<cfile>:p:h")<CR>'
      "\ . `:echo 'cd' ` . getcwd()
" Explore; Manipulate File/Directory {{{2
" Mnemonic: Create File/Directory
nnoremap <silent><nowait><buffer><expr> cf
      \ defx#do_action('new_multiple_files')
nnoremap <silent><nowait><buffer><expr> cd
      \ defx#do_action('new_directory')
nnoremap <silent><nowait><buffer><expr> cw
      \ defx#do_action('rename')
xnoremap <silent><nowait><buffer><expr> cw
      \ defx#do_action('multi',
      \     ['clear_select_all', 'toggle_select_visual', 'rename'])

" Explore; netrw-like {{{2
" nnoremap <silent><nowait><buffer><expr> -
"       \ defx#do_action('cd', ['..'])
nnoremap <silent><nowait><buffer><expr> D
      \ getcwd() =~# '^'. $XDG_DATA_HOME .'/Trash/' ?
      \ defx#do_action('remove') :
      \ defx#do_action('remove_trash')
xnoremap <silent><nowait><buffer><expr> D
      \ getcwd() =~# '^'. $XDG_DATA_HOME .'/Trash/'
      \   ? <SID>defx_do_action_visual('remove')
      \   : <SID>defx_do_action_visual('remove_trash')
nnoremap <silent><nowait><buffer><expr> \D
      \ defx#do_action('remove')
nnoremap <silent><nowait><buffer><expr> R
      \ defx#do_action('rename')
xnoremap <silent><nowait><buffer><expr> R
      \ defx#do_action('multi',
      \     ['clear_select_all', 'toggle_select_visual', 'rename'])
nnoremap <silent><nowait><buffer><expr> d
      \ defx#do_action('new_directory')
nnoremap <silent><nowait><buffer><expr> %
      \ defx#do_action('new_file')
" Explore; Sort {{{2
nnoremap <silent><nowait><buffer><expr> st
      \ defx#do_action('multi', ['toggle_sort', 'time', 'redraw'])
nnoremap <silent><nowait><buffer><expr> ss
      \ defx#do_action('multi', ['toggle_sort', 'size', 'redraw'])
nnoremap <silent><nowait><buffer><expr> sz
      \ defx#do_action('multi', ['toggle_sort', 'size', 'redraw'])
nnoremap <silent><nowait><buffer><expr> sx
      \ defx#do_action('multi', ['toggle_sort', 'extention', 'redraw'])
nnoremap <silent><nowait><buffer><expr> sf
      \ defx#do_action('multi', ['toggle_sort', 'filename', 'redraw'])
nnoremap <silent><nowait><buffer><expr> sn
      \ defx#do_action('multi', ['toggle_sort', 'filename', 'redraw'])
"nnoremap <silent><nowait><buffer><expr> C
"      \ defx#do_action('toggle_columns',
"      \                'mark:indent:icon:filename:type:size:time')

" Explore; Split Window {{{2
nnoremap <silent><nowait><buffer><expr> <C-w>v
      \ ":\<C-u>vs ". <SID>get_cwd() ."\<CR>"
nnoremap <silent><nowait><buffer><expr> <C-w>s
      \ ":\<C-u>sp ". <SID>get_cwd() ."\<CR>"
nmap <nowait><buffer> <C-w><C-v> <C-w>v
nmap <nowait><buffer> <C-w><C-s> <C-w>s

" Explore; Quit {{{2
" Note: The built-in `quit` hondles something like closing previews of defx.
" Note: Without the following `:quit<CR>`, defx trys to keep the window that
" defx has occupied.
nnoremap <silent><nowait><expr> <SID>(defx-quit)
      \ defx#do_action('quit') .':quit<CR>'
nmap <silent><nowait><buffer> ZZ <SID>(defx-quit)
nmap <silent><nowait><buffer> ZQ <SID>(defx-quit)
nmap <silent><nowait><buffer> Zz <SID>(defx-quit)
nmap <silent><nowait><buffer> Zq <SID>(defx-quit)

" Open File {{{1
" Edit {{{2
nnoremap <silent><nowait><buffer><expr> <C-j>
      \ <SID>is_in_wide_window()
      \ ? defx#do_action('open', 'edit')
      \ : defx#do_action('multi', ['drop', 'quit'])
nnoremap <silent><nowait><buffer><expr> <CR>
      \ <SID>is_in_wide_window()
      \ ? defx#do_action('open', 'edit')
      \ : defx#do_action('multi', ['drop', 'quit'])
xnoremap <silent><nowait><buffer><expr> <c-j>
      \ defx#async_action('multi',
      \ ['clear_select_all', 'toggle_select_visual', 'drop', 'quit'])
xnoremap <silent><nowait><buffer><expr> <CR>
      \ defx#async_action('multi',
      \ ['clear_select_all', 'toggle_select_visual', 'drop', 'quit'])
" Split {{{2
nnoremap <silent><nowait><buffer><expr> o
      \ defx#is_directory()
      \ ? defx#do_action('open')
      \ : defx#do_action('multi', [['drop', 'bel split'], 'quit'])
      "\ defx#do_action('drop', 'bel split')
xnoremap <silent><nowait><buffer><expr> o
      \ defx#is_directory()
      \ ? '<Esc>'. defx#do_action('open')
      \ : defx#async_action('multi',
      \   ['clear_select_all', 'toggle_select_visual',
      \   ['drop', 'bel split'], 'quit'])
      "\ ['clear_select_all', 'toggle_select_visual', ['drop', 'bel split']])
nnoremap <silent><nowait><buffer><expr> O
      \ defx#is_directory()
      \ ? defx#do_action('open')
      \ : defx#do_action('multi', [['open', 'bot vsplit'], 'quit'])
      "\ defx#do_action('open', 'bot vsplit')
" TODO: open multiple buffers in each new windows in visualmode
xnoremap <silent><nowait><buffer><expr> O
      \ defx#is_directory()
      \ ? '<Esc>'. defx#do_action('open')
      \ : defx#async_action('multi',
      \   ['clear_select_all', 'toggle_select_visual',
      \   ['open', 'bot vsplit'], 'quit'])
      "\ ['toggle_select_visual', ['open', 'bot vsplit']])
nnoremap <silent><nowait><buffer><expr> gO
      \ defx#do_action('open', 'tabe')
xnoremap <silent><nowait><buffer><expr> gO
      \ defx#async_action('multi',
      \ ['clear_select_all', 'toggle_select_visual', ['open', 'tabe']])
" Note: <c-s> freezes screen on some unix.
"nnoremap <silent><nowait><buffer> <c-w>v
"      \ :`expand('g:defx_sidebar_width')` wincmd v setl winfixwidth'<cr>
" Append window {{{3
nnoremap <silent><nowait><buffer><expr> A
      \ defx#do_action('open', 'bot vsplit')
      \ .'<c-w>p'
xnoremap <silent><nowait><buffer><expr> A
      \ defx#async_action('multi',
      \ ['clear_select_all', 'toggle_select_visual', ['open', 'bot vsplit']])
      \ .'<c-w>p'
" FIXME: always keep cursor on defx after drop to :split ANYWHERE
nnoremap <silent><nowait><buffer><expr> a
      \ <SID>is_in_wide_window()
      \ ? defx#do_action('open', 'bel split') .'<c-w>k'
      \ : defx#do_action('drop', 'bel split') .'<c-w>h'
xnoremap <silent><nowait><buffer><expr> a
      \ defx#async_action('multi',
      \ ['clear_select_all', 'toggle_select_visual', ['drop', 'bel split']])
      \ .'<c-w>h'
" Preview {{{3
" " Mnemonic: Insert a preview in actual windows
" " Note: :pclose to change location between vertical/horizontal
" nnoremap <silent><nowait><buffer><expr> <SID>(defx-preview-vertical)
"      \ <SID>defx_preview('vert bot')
" " FIXME: keep cursor on defx after :pedit ANYWHERE
" nnoremap <silent><nowait><buffer><expr> <SID>(defx-preview-horizontal)
"      \ <SID>defx_preview('bot')
"
" nmap <buffer> I <SID>(defx-preview-vertical)
" nmap <buffer> i <SID>(defx-preview-horizontal)

nnoremap <silent><buffer><expr> p
      \ defx#do_action('preview')

" Mnemonic: Zip Preview
nnoremap <silent><nowait><buffer> zp <c-w>z
" in Tree {{{2
nnoremap <silent><nowait><buffer><expr> za
      \ defx#do_action('open_or_close_tree')
nnoremap <silent><nowait><buffer><expr> zo
      \ defx#is_opened_tree()
      \ ? ''
      \ : defx#do_action('open_tree')
nnoremap <silent><nowait><buffer><expr> zO
      \ defx#is_opened_tree()
      \ ? ''
      \ : defx#do_action('open_tree_recursive')
nnoremap <silent><nowait><buffer><expr> zu
      \ defx#do_action('open_tree')
nnoremap <silent><nowait><buffer><expr> zc
      \ defx#do_action('close_tree')
" Note: CANNOT open multiple trees presently
"nnoremap <silent><nowait><buffer><expr> zr
"      \ defx#async_action('multi', [
"      \ 'clear_select_all',
"      \ 'toggle_select_all',
"      \ 'open_tree',
"      \ ])
"nnoremap <silent><nowait><buffer><expr> zR
"      \ defx#async_action('multi', [
"      \ 'clear_select_all',
"      \ 'toggle_select_all',
"      \ 'open_tree_recursive',
"      \ ])

" Register {{{1
nnoremap <buffer><nowait><silent><expr> <SID>(defx-copy-symbolic-link)
      \ defx#do_action('link')
nnoremap <buffer><nowait><silent><script> cl
      \ <SID>(defx-copy-symbolic-link)

" yank_path: yank in plus register
nnoremap <nowait><buffer><expr> y<C-g>
      \ defx#do_action('yank_path')
" copy: yank in defx's register
nnoremap <nowait><buffer><expr> yy
      \ defx#do_action('copy')
xnoremap <nowait><buffer><expr> y
      \ defx#do_action('multi',
      \ ['clear_select_all', 'toggle_select_visual', 'copy'])
" TODO: send 'r' to select rename at the prompt
"   Note:
"     ':call feedkeys("r", "nt")<cr>' only append the text itself to fname.
nnoremap <nowait><buffer><expr> x
      \ defx#do_action('move')
xnoremap <nowait><buffer><expr> x
      \ defx#do_action('multi',
      \ ['clear_select_all', 'toggle_select_visual', 'move'])
nnoremap <nowait><buffer><expr> P
      \ defx#do_action('paste')

" Execute {{{2
nnoremap <silent><nowait><buffer><expr> X
      \ defx#do_action('execute_system')
" Toggle {{{1
" Toggle; Mark {{{2
nnoremap <silent><nowait><buffer><expr> mm
      \ defx#do_action('toggle_select')
nnoremap <silent><nowait><buffer><expr> mj
      \ defx#do_action('toggle_select') . 'j' .
      \ defx#do_action('toggle_select') . 'j'
nnoremap <silent><nowait><buffer><expr> mk
      \ defx#do_action('toggle_select') . 'k' .
      \ defx#do_action('toggle_select') . 'k'
nnoremap <silent><nowait><buffer><expr> mc
      \ defx#do_action('clear_select_all')
"" Mark; All
nnoremap <silent><nowait><buffer><expr> ma
      \ defx#async_action('multi', ['clear_select_all', 'toggle_select_all'])
nnoremap <silent><nowait><buffer><expr> mgg
      \ defx#async_action('clear_select_all').
      \ 'vggj'.
      \ defx#async_action('toggle_select_visual')
nnoremap <silent><nowait><buffer><expr> mG
      \ defx#async_action('clear_select_all').
      \ 'vG'.
      \ defx#async_action('toggle_select_visual')
"" Mark; Reverse selected conditions.
nnoremap <silent><nowait><buffer><expr> mr
      \ defx#do_action('toggle_select_all')
xnoremap <silent><nowait><buffer><expr> m
      \ defx#do_action('toggle_select_visual')
" Toggle; Hidden Files {{{2
nnoremap <silent><nowait><buffer><expr> z.
      \ defx#do_action('toggle_ignored_files')

" Mnemonic: Full format
nnoremap <silent><buffer><expr> zf
      \ defx#do_action('toggle_columns', g:defx_format_full)
" Mnemonic: Delimited format
nnoremap <silent><buffer><expr> zd
      \ defx#do_action('toggle_columns', g:defx_format_delimited)

" Mnemonic: None of extra chars to be concealed
nnoremap <silent><buffer> zn :<C-u>setlocal concealcursor=nvc<CR>
" Mnemonic: Nothing are concealed
nnoremap <silent><buffer> zN :<C-u>setlocal concealcursor=<CR>

" Resize; {{{2
nnoremap <silent><nowait><buffer><expr> +
      \ defx#do_action('resize',
      \ defx#get_context().winwidth + 10)
nnoremap <silent><nowait><buffer><expr> -
      \ defx#do_action('resize',
      \ defx#get_context().winwidth - 10)
nnoremap <silent><nowait><buffer><expr> .
      \ defx#do_action('repeat')
" Git "{{{1
if dein#tap('repmo-vim')
  map <buffer><silent><expr> [c repmo#Key('<Plug>(defx-git-prev)', '<Plug>(defx-git-next)')
  map <buffer><silent><expr> ]c repmo#Key('<Plug>(defx-git-next)', '<Plug>(defx-git-prev)')
else
  map <buffer><silent> [c <Plug>(defx-git-prev)
  map <buffer><silent> ]c <Plug>(defx-git-next)
endif

nmap <silent><nowait><buffer> >> <Plug>(defx-git-stage)
nmap <silent><nowait><buffer> << <Plug>(defx-git-reset)

function! s:stage_visual() abort
  let save_cursor = getpos('.')
  let above = line("'<")
  let below = line("'>")

  exe above
  let last_cursor = getpos('.')
  while last_cursor[1] < below
    exe "norm \<Plug>(defx-git-stage)"
    exe "norm \<Plug>(defx-git-next)"
    if last_cursor == getpos('.') | break | endif
    let last_cursor = getpos('.')
  endwhile
  call setpos('.', save_cursor)
endfunction
xmap <silent><nowait><buffer> > :call <SID>stage_visual()<CR>
"}}}

if exists('s:is_loaded') | finish | endif
let s:is_loaded = 1

" Boolean: {{{1
function! s:is_in_wide_window() abort
  if @% =~# '\[defx]'
    return winwidth('.') > g:defx_sidebar_width
  endif
  return winwidth(bufwinnr('\[defx]')) > g:defx_sidebar_width
endfunction

function! s:is_in_narrow_window() abort
  return ! s:is_in_wide_window()
endfunction

function! s:single_window_with_defx() abort
  " Return if no other windows but two window (defx and the other).
  return len(tabpagebuflist()) <= 2
endfunction

" String: {{{1
function! s:get_cwd() abort
  return matchstr(getline(1), ':\zs\f\+')
endfunction

" Actions: {{{1
function! s:defx_do_action_visual(action, ...) abort
  " Note: it fails in multi sequence at once.
  return defx#do_action('multi', ['clear_select_all', 'toggle_select_visual'])
        \ . defx#do_action('multi', [a:action, join(a:000, ',')])
endfunction

function! s:defx_preview(mods) abort
  " Note: Most of `norm! [foo]` here is _not_ allowed in <expr>-mappings; use
  " autocmd instead.

  if a:mods =~# 'vert'
    let pedit = a:mods .' pedit'
    return "\<C-w>z".
          \ defx#do_action('open', pedit)
          \ ."\<c-w>="
  endif
  let s:defx_save_winid = win_getid()

  augroup defx-restore_previewheight
    au!

    let Go_to_preview = ":norm! \<lt>C-w>P"

    let preview_height = &lines * 2 / 3
    let Set_preview_height = 'resize '. preview_height

    let Go_back_to_defx = 'call win_gotoid(s:defx_save_winid)'

    exe 'au BufWinEnter * ++once' Go_to_preview
    exe 'au BufWinEnter * ++once' Set_preview_height

    " FIXME: `winid` seems to change when Defx invokes the action to preview
    " after VimResized; the fact causes layout collapse and the winid for Defx
    " will be pushed out to be new one by a new preview buffer.
    exe 'au WinEnter * ++once' Go_back_to_defx
  augroup END

  " TODO: set mods to 'bel' if winwidth(winnr('l')) is narrow.
  let pedit = "pclose \<bar> bot pedit"
  let open = s:is_in_wide_window() ? 'open' : 'drop'
  let defx_action = defx#do_action(open, pedit)

  return defx_action
endfunction

augroup myDefxFtplugin-CustomHooks
  au!
  au BufEnter <buffer> call defx#redraw()
augroup END
