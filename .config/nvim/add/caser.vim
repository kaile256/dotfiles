" From: motion.toml
" Repo: arthurxavierx/vim-caser

"let g:caser_prefix = 'qc'
let g:caser_no_mappings = 1

nmap qcm <Plug>CaserMixedCase
xmap qcm <Plug>CaserVMixedCase

nmap qcc <Plug>CaserCamelCase
xmap qcc <Plug>CaserVCamelCase

nmap qct <Plug>CaserTitleCase
xmap qct <Plug>CaserVTitleCase

nmap qcu <Plug>CaserUpperCase
xmap qcu <Plug>CaserVUpperCase
nmap qcU <Plug>CaserUpperCase
xmap qcU <Plug>CaserVUpperCase

nmap qc_ <Plug>CaserSnakeCase
xmap qc_ <Plug>CaserVSnakeCase

nmap qc( <Plug>CaserSentenceCase
nmap qc) <Plug>CaserSentenceCase
xmap qc( <Plug>CaserVSentenceCase
xmap qc) <Plug>CaserVSentenceCase

nmap qc<space> <Plug>CaserSpaceCase
xmap qc<space> <Plug>CaserVSpaceCase

nmap qc- <Plug>CaserKebabCase
xmap qc- <Plug>CaserVKebabCase

nmap qc. <Plug>CaserDotCase
xmap qc. <Plug>CaserVDotCase
