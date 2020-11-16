" From: browse.toml
" Repo: junegunn/fzf.vim
" Another: source/fzf.vim
" Another: post/fzf.vim

function! s:p(bang, ...) abort
  " junegunn/fzf.vim/plugin/fzf.vim @ 42
  let preview_window = get(g:, 'fzf_preview_window', a:bang && &columns >= 80 || &columns >= 120 ? 'right': '')
  if len(preview_window)
    return call('fzf#vim#with_preview', add(copy(a:000), preview_window))
  endif
  return {}
endfunction

command! -bar -bang -nargs=* Fzf :Files <args>

command! -bar -bang Functions
      \ :call fzf#vim#functions({'options': '--multi --reverse'})
" TODO: show preview as :function shows
      "\ fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:60%:wrap'),
      "\ <bang>0)

" commands on directory {{{1
" TODO: get :Ghqs to include the files under $GOPATH/src/, too.
let s:cmd_to_path = {
      \ 'Config':    $XDG_CONFIG_HOME,
      \ 'Data':      $XDG_DATA_HOME,
      \ 'Dotfiles':  $DOTFILES_HOME,
      \ 'Downloads': '~/Downloads',
      \ 'Etcs':      '/etc',
      \ 'Ghqs':      $GHQ_ROOT,
      \ 'Pictures':  '~/Pictures',
      \ 'Runtimes':   $VIMRUNTIME,
      \ 'Tmps':      '/tmp',
      \ 'Trash':     g:my_trash_root,
      \ 'Usrs':      '/usr',
      \ }

" Note: :Ghqs is not actually in ghq
" TODO: in :Usrs, ignore all the files permission-denied
for cmd in keys(s:cmd_to_path)
  exe 'command! -bar -bang -nargs=*' cmd
        \ ':exe "Files"' string(s:cmd_to_path[cmd])
endfor

" Command: Maps with keymaps {{{1
" TODO: set options reverse
command! -bar -bang -nargs=* Nmaps call fzf#vim#maps('n', <bang>0)
command! -bar -bang -nargs=* Imaps call fzf#vim#maps('i', <bang>0)
command! -bar -bang -nargs=* Xmaps call fzf#vim#maps('x', <bang>0)
command! -bar -bang -nargs=* Smaps call fzf#vim#maps('s', <bang>0)
command! -bar -bang -nargs=* Vmaps call fzf#vim#maps('v', <bang>0)
command! -bar -bang -nargs=* Cmaps call fzf#vim#maps('c', <bang>0)
command! -bar -bang -nargs=* Omaps call fzf#vim#maps('o', <bang>0)
command! -bar -bang -nargs=* Tmaps call fzf#vim#maps('t', <bang>0)

" Command: shortcut {{{1
command! -bar -bang -nargs=* Cmds :Commands
" Note: :Cmaps isn't so often needed.
command! -bar -bang -nargs=* Cm   :Commands

command! -bar -nargs=* Co :Colors <args>

command! -bar -nargs=* -complete=help H :Helptags <args>

" Keymaps for Files {{{1
let s:path_dict = {
      \ '.': '.',
      \ '<space>': ':<C-u>silent Rooter',
      \ 'c': $DEIN_CACHE_HOME,
      \ 'd': $DOTFILES_HOME,
      \ 'f': $XDG_CONFIG_HOME,
      \ 'h': '~',
      \ 'l': $XDG_DATA_HOME,
      \ 'm': $MY_MEMO .'/note',
      \ 'n': '%:p:h',
      \ 'q': $GHQ_ROOT,
      \ 'r': $VIMRUNTIME,
      \ 't': g:my_trash_root,
      \ 'v': $DOTFILES_HOME .'/.config/nvim',
      \ 'w': '%:p:h',
      \ }

function! s:fzf_maps(prefix, command, ...) abort
  " To: like :Fzf
  let map_arg = '<silent>'
  let lhs_raw = map_arg . a:prefix

  for l:key in keys(s:path_dict)
    let lhs = lhs_raw . l:key

    if s:path_dict[l:key] =~# '^:'
      " To: otherwise, commands to cd.
      " Note: if E:trainling-character, check if ':command -bar' in plugin's vimscript.
      let l:cd = s:path_dict[l:key]
    else
      let l:cd = ':<c-u>cd '. s:path_dict[l:key]
    endif

    " TODO: close fzf-window before another starts;
    "   the error statement is 'E16: Invalid range: 2wincmd w'
    " let close_fzf = ":<c-u>windo if &ft ==# 'fzf' <bar> close <bar> endif"
    " let rhs = close_fzf .'<bar>'. l:cd .'<bar>'. a:command .'<cr>'

    let rhs = l:cd .'<bar>'. a:command .'<cr>'

    let modes = a:0 > 0 ? a:1 : 'nx'
    let modes = split(modes, '\ze')

    for mode in modes
      exe mode .'map ' lhs rhs
    endfor

  endfor
endfunction

call s:fzf_maps('<space>z', 'Fzf')
call s:fzf_maps('<space>r', 'Rg')
call s:fzf_maps('<space>a', 'Ag', 'n')

" Keymaps {{{1
"imap <c-x><c-f> <c-o>:cd ~<cr><plug>(fzf-complete-file-ag)
"imap <c-x>f     <c-o>:cd ~<cr><plug>(fzf-complete-file-ag)

nmap <silent> <space>zg :<c-u> GFiles?<cr>
nmap <silent> <space>zG :<c-u> GFiles<cr>
nmap <silent> <space>zb :<c-u> Buffers<cr>

" Mnemonic: Search in Current File
nmap <silent> <space>z/ :<c-u> BLines<cr>

" Mnemonic: 'Old' Buffer
nmap <silent> <space>zo :<c-u> History<cr>

nmap <silent> <space>z? :<c-u> History/<cr>

nmap <silent> <space>z; :<c-u> History:<cr>
nmap <silent> <space>z: :<c-u> History:<cr>
