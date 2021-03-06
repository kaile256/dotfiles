" From: essential.toml
" Repo: junegunn/fzf.vim
" Another: source/fzf.vim
" Another: post/fzf.vim

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
      \ 'Trash':     $MY_TRASH_HOME,
      \ 'Usrs':      '/usr',
      \ }

" Note: :Ghqs is not actually in ghq
" TODO: in :Usrs, ignore all the files permission-denied
for s:cmd in keys(s:cmd_to_path)
  exe 'command! -bar -bang -nargs=*' s:cmd
        \ ':exe "Files"' string(s:cmd_to_path[s:cmd])
endfor
unlet s:cmd
unlet s:cmd_to_path

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
      \ '.': $DOTFILES_HOME,
      \ '<C-h>': $MY_TRASH_HOME,
      \ '<space>': '<C-r>=FindRootDirectory()<CR>',
      \ 'c': $DEIN_CACHE_HOME,
      \ 'd': $MY_DEV,
      \ 'f': $XDG_CONFIG_HOME,
      \ 'h': $HOME,
      \ 'l': $XDG_DATA_HOME,
      \ 'm': $MY_MEMO,
      \ 'n': '%:p:h',
      \ 'q': $GHQ_ROOT,
      \ 'r': $VIMRUNTIME,
      \ 's': '$SNIPPETS_HOME',
      \ 't': $VIM_TEMPLATE_HOME,
      \ 'v': '$DOTFILES_HOME/.config/nvim',
      \ 'w': '%:p:h',
      \ }

function! s:fzf_maps(prefix, command, ...) abort
  " To: like :Fzf
  let map_arg = '<silent>'
  let lhs_raw = map_arg . a:prefix

  for l:key in keys(s:path_dict)
    let lhs = lhs_raw . l:key
    let l:cd = ':<c-u>cd '. s:path_dict[l:key]

    " TODO: close fzf-window before another starts;
    "   the error statement is 'E16: Invalid range: 2wincmd w'
    " let close_fzf = ":<c-u>windo if &ft ==# 'fzf' <bar> close <bar> endif"
    " let rhs = close_fzf .'<bar>'. l:cd .'<bar>'. a:command .'<cr>'

    let rhs = l:cd .'<bar>'. a:command .'<cr>'

    let modes = a:0 > 0 ? a:1 : 'nx'
    let modes = split(modes, '\ze')

    for mode in modes
      exe mode .'noremap ' lhs rhs
    endfor

  endfor
endfunction

call s:fzf_maps('<space>z', 'Files')
call s:fzf_maps('<space>r', 'Rg')
call s:fzf_maps('<space>a', 'Ag', 'n')

" Keymaps {{{1
"imap <c-x><c-f> <c-o>:cd ~<cr><plug>(fzf-complete-file-ag)
"imap <c-x>f     <c-o>:cd ~<cr><plug>(fzf-complete-file-ag)

nnoremap <silent> <space>zg :<c-u> GFiles?<cr>
nnoremap <silent> <space>zG :<c-u> GFiles<cr>
nnoremap <silent> <space>zb :<c-u> Buffers<cr>

" Mnemonic: Search in Current File
nnoremap <silent> <space>z/ :<c-u> BLines<cr>

" Mnemonic: 'Old' Buffer
nnoremap <silent> <space>zo :<c-u> History<cr>

nnoremap <silent> <space>z? :<c-u> History/<cr>

nnoremap <silent> <space>z; :<c-u> History:<cr>
nnoremap <silent> <space>z: :<c-u> History:<cr>
