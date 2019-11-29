" From: motion.toml
" Repo: arthurxavierx/vim-caser

"let g:caser_prefix = 'qc'
let g:caser_no_mappings = 1

" Mnemonic: Replace the object
nmap \rm <Plug>CaserMixedCase
xmap \rm <Plug>CaserVMixedCase

nmap \rc <Plug>CaserCamelCase
xmap \rc <Plug>CaserVCamelCase

nmap \rt <Plug>CaserTitleCase
xmap \rt <Plug>CaserVTitleCase

nmap \ru <Plug>CaserUpperCase
xmap \ru <Plug>CaserVUpperCase
nmap \rU <Plug>CaserUpperCase
xmap \rU <Plug>CaserVUpperCase

nmap \r_ <Plug>CaserSnakeCase
xmap \r_ <Plug>CaserVSnakeCase

nmap \r( <Plug>CaserSentenceCase
nmap \r) <Plug>CaserSentenceCase
xmap \r( <Plug>CaserVSentenceCase
xmap \r) <Plug>CaserVSentenceCase

nmap \r<space> <Plug>CaserSpaceCase
xmap \r<space> <Plug>CaserVSpaceCase

nmap \r- <Plug>CaserKebabCase
xmap \r- <Plug>CaserVKebabCase

nmap \r. <Plug>CaserDotCase
xmap \r. <Plug>CaserVDotCase
