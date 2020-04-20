" From: browse.toml
" Repo: junegunn/fzf.vim
" Fork: kaile256/fzf.vim
" Another: add/fzf-keymaps.vim
" Another: source/fzf.vim
" Another: post/fzf.vim

" TODO: override on-going fzf-buffer
"nnoremap <silent> <space>z :call system('killall fzf') <bar> call feedkeys("\<space>z", 'x')<cr>

command! -bar -bang -nargs=* Fzf :Files <args>

command! GrepCWORD
      \ :FindRoot
      \ | Ag expand('<cWORD>')

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

nnoremap <silent> <space>zb :<c-u> Buffers<cr>
nnoremap <silent> <space>zG :<c-u> Gfiles<cr>
nnoremap <silent> <space>zg :<c-u> Gfiles?<cr>
"" Mnemonic: 'Old' Buffer
nnoremap <silent> <space>zo :<c-u> History<cr>
"" Mnemonic: Search in Current File
nnoremap <silent> <space>z/ :<c-u> BLines<cr>
nnoremap <silent> <space>z; :<c-u> History:<cr>

nnoremap <silent> gG :GrepCWORD<cr>
