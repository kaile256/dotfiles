" From: motion.toml
" Repo: scrooloose/nerdcommenter

let g:NERDCommenterMappings = 0
let g:NERDSpaceDelims       = 1
"let g:NERDTrimTrailingWhitespace = 1

nmap <space>nd <Plug>NERDCommenterAltDelims
nmap <space>nu <Plug>NERDCommenterUncomment
nmap <space>nl <Plug>NERDCommenterAlignLeft
nmap <space>nb <Plug>NERDCommenterAlignBoth
nmap <space>nm <Plug>NERDCommenterMinimal
nmap <space>nc <Plug>NERDCommenterComment
nmap \h <Plug>NERDCommenterToggle
nmap <space>nn <Plug>NERDCommenterNested
nmap <space>ni <Plug>NERDCommenterInvert
nmap <space>na <Plug>NERDCommenterAppend
nmap <space>ne <Plug>NERDCommenterToEOL
nmap <space>ny <Plug>NERDCommenterYank
nmap <space>ns <Plug>NERDCommenterSexy

xmap <space>nu <Plug>NERDCommenterUncomment
xmap <space>nl <Plug>NERDCommenterAlignLeft
xmap <space>nb <Plug>NERDCommenterAlignBoth
xmap <space>nm <Plug>NERDCommenterMinimal
xmap <space>nc <Plug>NERDCommenterComment
xmap \h <Plug>NERDCommenterToggle
xmap <space>nn <Plug>NERDCommenterNested
xmap <space>ni <Plug>NERDCommenterInvert
xmap <space>ny <Plug>NERDCommenterYank
xmap <space>ns <Plug>NERDCommenterSexy
