" TOML: appearance.toml
" Repo: kevinhwang91/nvim-hlslens

nnoremap <SID>(hlslens-on)  <Cmd>lua require('hlslens').start()<CR>
nnoremap <SID>(hlslens-off) <Cmd>lua require('hlslens').disable()<CR>
inoremap <SID>(hlslens-off) <Cmd>lua require('hlslens').disable()<CR>


nmap *  <Plug>(asterisk-gz*)<SID>(hlslens-on)
nmap #  <Plug>(asterisk-gz#)<SID>(hlslens-on)
nmap g* <Plug>(asterisk-g*)<SID>(hlslens-on)
nmap g# <Plug>(asterisk-g#)<SID>(hlslens-on)

xmap *  <Plug>(asterisk-gz*)<SID>(hlslens-on)
xmap #  <Plug>(asterisk-gz#)<SID>(hlslens-on)
xmap g* <Plug>(asterisk-g*)<SID>(hlslens-on)
xmap g# <Plug>(asterisk-g#)<SID>(hlslens-on)


nnoremap <script> n n<SID>(hlslens-on)zv
nnoremap <script> N N<SID>(hlslens-on)zv

nnoremap <script> <SID>(highlight-off)
      \ <SID>(hlslens-off)<Cmd>noh <bar> redraw! <CR>
inoremap <script> <SID>(highlight-off)
      \ <SID>(hlslens-off)<Cmd>noh <bar> mode <CR>

nnoremap <script> <C-c> <SID>(highlight-off)<Cmd>exe "silent norm! \<C-c>"<CR>
inoremap <script> <C-l> <SID>(highlight-off)
