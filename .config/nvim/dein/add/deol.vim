scriptencoding utf-8
" From: shell.toml
" Repo: Shougo/deol.nvim

let g:deol#prompt_pattern = '^.\{-}❯❯❯ '
let g:deol#shell_history_path = $XDG_DATA_HOME .'/nvim/deol'

augroup deol-disable-dwm
  au!
  au BufEnter * if &ft ==# 'deol' && t:deol.options.split ==# 'floating' && !get(b:, 'dwm_disabled', 0) | let b:dwm_disabled = 1 | endif
  if exists('&winblend')
  au FileType deol setl winblend=20
endif
augroup END

function! s:open_deol_in_floating() abort
  let winheight = &lines > 52 ? &lines / 4 * 3 : 40
  let winrow = &lines > winheight ? (&lines - winheight) / 2 : 0
  let winwidth = &columns > 240 ? &columns / 2 : 120
  let wincol = &columns > winwidth ? (&columns - winwidth) / 2 : 0
  exe 'Deol -split=floating -winwidth=' . winwidth '-winheight=' . winheight '-winrow=' . winrow '-wincol=' . wincol
endfunction

" TODO: work it out
nnoremap <a-t><a-q> <SID>open_deol_in_floating()

  "cnoreabbr <expr> te (getcmdtype() == ':' && getcmdline() =~ '^te$')? 'Deol' : 'te'
  "cnoreabbr <expr> tb (getcmdtype() == ':' && getcmdline() =~ '^tb$')? 'tab sp <bar> Deol' : 'tb'
  "cnoreabbr <expr> ts (getcmdtype() == ':' && getcmdline() =~ '^ts$')? 'sp <bar> Deol' : 'ts'
  "cnoreabbr <expr> tv (getcmdtype() == ':' && getcmdline() =~ '^tv$')? 'vs <bar> Deol' : 'tv'

  "" Comment Out Below all
  "" Open Deol; with Direction {{{
  "noremap <silent><nowait> <a-t><a-.> :<c-u>    <space> <space>   Deol<cr>
  "noremap <silent><nowait> <a-t><a-e> :<c-u>    <space> <space>   Deol<cr>
  "noremap <silent><nowait> <a-t><a-s> :<c-u>sp  <space> <bar>   Deol<cr>
  "noremap <silent><nowait> <a-t><a-v> :<c-u>vs  <space> <bar>   Deol<cr>
  "noremap <silent><nowait> <a-t><a-b> :<c-u>tab sp      <bar>   Deol<cr>
  "noremap <silent><nowait> <a-t>.     :<c-u>    <space> <space> Deol<cr>
  "noremap <silent><nowait> <a-t>e     :<c-u>    <space> <space> Deol<cr>
  "noremap <silent><nowait> <a-t>s     :<c-u>sp  <space> <bar>   Deol<cr>
  "noremap <silent><nowait> <a-t>v     :<c-u>vs  <space> <bar>   Deol<cr>
  "noremap <silent><nowait> <a-t>b     :<c-u>tab sp      <bar>   Deol<cr>
  ""}}}
  "" Open Deol; With cd {{{
  "noremap <silent><nowait> <a-t><a-.> :<c-u>   <space>    <bar>Deol<cr>
  "noremap <silent><nowait> <a-t><a-w> :<c-u>cd %:p:h      <bar>Deol<cr>
  "noremap <silent><nowait> <a-t><a-h> :<c-u>cd ~          <bar>Deol<cr>
  "noremap <silent><nowait> <a-t><a-o> :<c-u>cd ~/org      <bar>Deol<cr>
  "noremap <silent><nowait> <a-t><a-d> :<c-u>cd ~/dotfiles <bar>Deol<cr>
  "noremap <silent><nowait> <a-t><a-f> :<c-u>cd ~/.config  <bar>Deol<cr>
  "noremap <silent><nowait> <a-t><a-c> :<c-u>cd ~/.cache   <bar>Deol<cr>
  "noremap <silent><nowait> <a-t>.     :<c-u>   <space>    <bar>Deol<cr>
  "noremap <silent><nowait> <a-t>w     :<c-u>cd %:p:h      <bar>Deol<cr>
  "noremap <silent><nowait> <a-t>h     :<c-u>cd ~          <bar>Deol<cr>
  "noremap <silent><nowait> <a-t>o     :<c-u>cd ~/org      <bar>Deol<cr>
  "noremap <silent><nowait> <a-t>d     :<c-u>cd ~/dotfiles <bar>Deol<cr>
  "noremap <silent><nowait> <a-t>c     :<c-u>cd ~/.config  <bar>Deol<cr>
  "noremap <silent><nowait> <a-t>c     :<c-u>cd ~/.cache   <bar>Deol<cr>
  ""}}}
  " Hotkey; Neovim Standard terminal
  " Mnemonic: Terminal New
  "" Standard Term; with direction {{{
  "noremap <silent><nowait> <a-t><a-n>e :<c-u>     <cr> :te<cr>
  "noremap <silent><nowait> <a-t><a-n>b :<c-u>tabe <cr> :te<cr>
  "noremap <silent><nowait> <a-t><a-n>s :<c-u>bel  sp   <cr> :te<cr>
  "noremap <silent><nowait> <a-t><a-n>v :<c-u>     vert bel  vs <cr> :te<cr>
  "
  "noremap <silent><nowait> <a-t>ne     :<c-u>     <cr>    :te<cr>
  "noremap <silent><nowait> <a-t>ns     :<c-u>bel sp   <cr>      :te<cr>
  "noremap <silent><nowait> <a-t>nv     :<c-u> vert bel vs   <cr>      :te<cr>
  "noremap <silent><nowait> <a-t>nb     :<c-u>tabe <cr> :te<cr>
  "noremap <silent><nowait> <a-t>nb     :<c-u>tabe <cr> :te<cr>
  ""}}}
  "" Standard Term; with cd {{{
  "noremap <silent><nowait> <a-t><a-n>w :<c-u>cd   %:p:h<bar> :Deol<cr>
  "noremap <silent><nowait> <a-t><a-n>h :<c-u>cd ~          <bar>:Deol<cr>
  "noremap <silent><nowait> <a-t><a-n>o :<c-u>cd ~/org      <bar>:Deol<cr>
  "noremap <silent><nowait> <a-t><a-n>d :<c-u>cd ~/dotfiles <bar>:Deol<cr>
  "noremap <silent><nowait> <a-t><a-n>f :<c-u>cd ~/.config  <bar>:Deol<cr>
  "
  "noremap <silent><nowait> <a-t>nw     :<c-u>cd %:p:h      <bar>:Deol<cr>
  "noremap <silent><nowait> <a-t>nh     :<c-u>cd ~          <bar>:Deol<cr>
  "noremap <silent><nowait> <a-t>no     :<c-u>cd ~/org      <bar>:Deol<cr>
  "noremap <silent><nowait> <a-t>nd     :<c-u>cd ~/dotfiles <bar>:Deol<cr>
  "noremap <silent><nowait> <a-t>nf     :<c-u>cd ~/.config  <bar>:Deol<cr>
  ""}}}
