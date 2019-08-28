"cnoreabbr <expr> te (getcmdtype() == ':' && getcmdline() =~ '^te$')? 'Tnew' : 'te'
"cnoreabbr <expr> teb (getcmdtype() == ':' && getcmdline() =~ '^teb$')? 'tab sp <bar> Tnew' : 'teb'
"cnoreabbr <expr> tes (getcmdtype() == ':' && getcmdline() =~ '^tes$')? 'sp <bar> Tnew' : 'tes'
"cnoreabbr <expr> tev (getcmdtype() == ':' && getcmdline() =~ '^tev$')? 'vs <bar> Tnew' : 'tev'

"nnoremap <silent> rc :TREPLSendFile<cr>
"nnoremap <silent> rl :TREPLSendLine<cr>
"vnoremap <silent> rl :TREPLSendSelection<cr>
"nnoremap <silent> vu :Ttoggle<cr>

" Hotkey; Open neoterm
""" Open Tnew; with Direction {{{
"noremap <silent><nowait> <a-t><a-.> :<c-u>    <space> <space>   Tnew<cr>
"noremap <silent><nowait> <a-t><a-e> :<c-u>    <space> <space>   Tnew<cr>
"noremap <silent><nowait> <a-t><a-s> :<c-u>bel <bar>   Tnew<cr>
"noremap <silent><nowait> <a-t><a-v> :<c-u>vert <bar>   Tnew<cr>
"noremap <silent><nowait> <a-t><a-b> :<c-u>tab <bar>   Tnew<cr>
"noremap <silent><nowait> <a-t>.     :<c-u>    <space> <space> Tnew<cr>
"noremap <silent><nowait> <a-t>e     :<c-u>    <space> <space> Tnew<cr>
"noremap <silent><nowait> <a-t>s     :<c-u>bel  <bar>   Tnew<cr>
"noremap <silent><nowait> <a-t>v     :<c-u>vert  <bar>   Tnew<cr>
"noremap <silent><nowait> <a-t>b     :<c-u>tab <bar>   Tnew<cr>
""}}}
""" Open Tnew; With cd {{{
"noremap <silent><nowait> <a-t><a-.> :<c-u>   <space>    <bar>Tnew<cr>
"noremap <silent><nowait> <a-t><a-w> :<c-u>cd %:p:h      <bar>Tnew<cr>
"noremap <silent><nowait> <a-t><a-h> :<c-u>cd ~          <bar>Tnew<cr>
"noremap <silent><nowait> <a-t><a-o> :<c-u>cd ~/org      <bar>Tnew<cr>
"noremap <silent><nowait> <a-t><a-d> :<c-u>cd ~/dotfiles <bar>Tnew<cr>
"noremap <silent><nowait> <a-t><a-f> :<c-u>cd ~/.config  <bar>Tnew<cr>
"noremap <silent><nowait> <a-t><a-c> :<c-u>cd ~/.cache   <bar>Tnew<cr>
"noremap <silent><nowait> <a-t>.     :<c-u>   <space>    <bar>Tnew<cr>
"noremap <silent><nowait> <a-t>w     :<c-u>cd %:p:h      <bar>Tnew<cr>
"noremap <silent><nowait> <a-t>h     :<c-u>cd ~          <bar>Tnew<cr>
"noremap <silent><nowait> <a-t>o     :<c-u>cd ~/org      <bar>Tnew<cr>
"noremap <silent><nowait> <a-t>d     :<c-u>cd ~/dotfiles <bar>Tnew<cr>
"noremap <silent><nowait> <a-t>c     :<c-u>cd ~/.config  <bar>Tnew<cr>
"noremap <silent><nowait> <a-t>c     :<c-u>cd ~/.cache   <bar>Tnew<cr>
""}}}

" Hotkey; Neovim Standard terminal
""" Standard Term; with direction {{{
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
""" Standard Term; with cd {{{
"noremap <silent><nowait> <a-t><a-n>w :<c-u>cd   %:p:h<bar> :Tnew<cr>
"noremap <silent><nowait> <a-t><a-n>h :<c-u>cd ~          <bar>:Tnew<cr>
"noremap <silent><nowait> <a-t><a-n>o :<c-u>cd ~/org      <bar>:Tnew<cr>
"noremap <silent><nowait> <a-t><a-n>d :<c-u>cd ~/dotfiles <bar>:Tnew<cr>
"noremap <silent><nowait> <a-t><a-n>f :<c-u>cd ~/.config  <bar>:Tnew<cr>
"
"noremap <silent><nowait> <a-t>nw     :<c-u>cd %:p:h      <bar>:Tnew<cr>
"noremap <silent><nowait> <a-t>nh     :<c-u>cd ~          <bar>:Tnew<cr>
"noremap <silent><nowait> <a-t>no     :<c-u>cd ~/org      <bar>:Tnew<cr>
"noremap <silent><nowait> <a-t>nd     :<c-u>cd ~/dotfiles <bar>:Tnew<cr>
"noremap <silent><nowait> <a-t>nf     :<c-u>cd ~/.config  <bar>:Tnew<cr>
""}}}
