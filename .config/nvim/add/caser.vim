" From: motion.toml
" Repo: arthurxavierx/vim-caser

" Note: the prefix setting only works after the plugin was loaded
"let g:caser_prefix = 'qc'

let g:caser_no_mappings = 1

" Mnemonic: change case like gu/gU
nmap \um <Plug>CaserMixedCase
xmap \um <Plug>CaserVMixedCase

nmap \uc <Plug>CaserCamelCase
xmap \uc <Plug>CaserVCamelCase

nmap \ut <Plug>CaserTitleCase
xmap \ut <Plug>CaserVTitleCase

nmap \uu <Plug>CaserUpperCase
xmap \uu <Plug>CaserVUpperCase
nmap \uU <Plug>CaserUpperCase
xmap \uU <Plug>CaserVUpperCase

nmap \u_ <Plug>CaserSnakeCase
xmap \u_ <Plug>CaserVSnakeCase

nmap \u( <Plug>CaserSentenceCase
nmap \u) <Plug>CaserSentenceCase
xmap \u( <Plug>CaserVSentenceCase
xmap \u) <Plug>CaserVSentenceCase

nmap \u<space> <Plug>CaserSpaceCase
xmap \u<space> <Plug>CaserVSpaceCase

nmap \u- <Plug>CaserKebabCase
xmap \u- <Plug>CaserVKebabCase

nmap \u. <Plug>CaserDotCase
xmap \u. <Plug>CaserVDotCase
