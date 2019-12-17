" From: tool.toml
" Repo: Shougo/vinarise.vim

let g:vinarise_enable_auto_detect     = 1
let g:vinarise_objdump_intel_assembly = 1
"let g:vinarise_guifont = 'Hack\ Nerd\ Font:h14'

command! -nargs=* -bar -complete=customlist,vinarise#complete
      \ HexEditVinarise
      \ :Vinarise
