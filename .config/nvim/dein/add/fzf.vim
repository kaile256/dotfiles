" From: browse.toml
" Repo: junegunn/fzf.vim
" Another: source/fzf.vim
" Another: post/fzf.vim

" TODO: override on-going fzf-buffer
"nnoremap <silent> <space>z :call system('killall fzf') <bar> call feedkeys("\<space>z", 'x')<cr>

command! -bar -bang -nargs=* Fzf :Files <args>

command! -bar -bang Functions
      \ :call fzf#vim#functions({'options': '--multi --reverse'})
" TODO: show preview as :function shows
      "\ fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:60%:wrap'),
      "\ <bang>0)

" TODO: selector of terminal-buffer.
command! -bar -bang -nargs=* -complete=buffer Terminal
      \ call fzf#vim#buffers(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview({'prefix': "'.git/", 'options': '--multi --reverse'}, 'right:65%')
      \                         : fzf#vim#with_preview({'prefix': "'.git/", 'options': '--multi --reverse'}, 'right:65%'),
      \                 <bang>0)

" commands on directory {{{1
" TODO: get :Ghqs to include the files under $GOPATH/src/, too.
let s:cmd_to_path = {
      \ 'Config':    $XDG_CONFIG_HOME,
      \ 'Data':      $XDG_DATA_HOME,
      \ 'Dotfiles':  g:dotfiles_home,
      \ 'Downloads': '~/Downloads',
      \ 'Etcs':      '/etc',
      \ 'Ghqs':      $GHQ_ROOT,
      \ 'Pictures':  '~/Pictures',
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

command! -bar -bang -nargs=* Polybars
      \ :cd ~/.config/polybar | Rg

command! Neighbours call s:fzf_neighbours() "{{{1
function! s:fzf_neighbours() abort
  let current_file = expand('%')
  let cwd = fnamemodify(current_file, ':p:h')
  let command = 'ag --filename-pattern "" --follow' . cwd . ' --depth 0'

  call fzf#vim#files('', fzf#vim#with_preview({
        \ 'source': command,
        \ 'sink':   'e',
        \ 'options': '--multi --extended --no-sort',
        \ })
        \ )
endfunction
"nnoremap <silent> <space>zn :<c-u>Neighbours<cr>

" Command: Maps {{{1
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

command! -bar -nargs=* H    :Helptags <args>
command! -bar -nargs=* He   :Helptags <args>
command! -bar -nargs=* Hel  :Helptags <args>
command! -bar -nargs=* Help :Helptags <args>

" Command: wiki {{{1
" Note: the commands below are all wrapper,
"       so that they must be loaded on hook_add.
command! AgWiki  :cd ~/vimwiki                   <bar> Ag
command! RgWiki  :cd ~/vimwiki                   <bar> Rg
command! AgDiary :cd ~/vimwiki/diary             <bar> Ag
command! RgDiary :cd ~/vimwiki/diary             <bar> Rg
command! AgHelp  :cd /usr/share/nvim/runtime/doc <bar> Ag
command! RgHelp  :cd /usr/share/nvim/runtime/doc <bar> Rg

" Keymaps {{{1
"imap <c-x><c-f> <c-o>:cd ~<cr><plug>(fzf-complete-file-ag)
"imap <c-x>f     <c-o>:cd ~<cr><plug>(fzf-complete-file-ag)

nmap <silent> <space>zb :<c-u> Buffers<cr>
nmap <silent> <space>zG :<c-u> GFiles<cr>
nmap <silent> <space>zg :<c-u> GFiles?<cr>
"" Mnemonic: 'Old' Buffer
nmap <silent> <space>zo :<c-u> History<cr>
"" Mnemonic: Search in Current File
nmap <silent> <space>z/ :<c-u> BLines<cr>
nmap <silent> <space>z; :<c-u> History:<cr>

" Keymaps for Files {{{1
let s:path_dict = {
      \ '.': '.',
      \ '<space>': ':<c-u>silent FindRoot',
      \ 'c': g:dein_cache_dir,
      \ 'd': g:dotfiles_home,
      \ 'f': $XDG_CONFIG_HOME,
      \ 'h': '~',
      \ 'l': $XDG_DATA_HOME,
      \ 'm': $MYMEMO,
      \ 'n': '%:p:h',
      \ 'q': $GHQ_ROOT,
      \ 'r': $VIMRUNTIME,
      \ 't': g:my_trash_root,
      \ 'v': g:nvim_home,
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
