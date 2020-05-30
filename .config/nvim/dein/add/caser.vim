" From: motion.toml
" Repo: arthurxavierx/vim-caser

" Note: the prefix setting only works after the plugin was loaded
"let g:caser_prefix = 'qc'

let g:caser_no_mappings = 1

nmap \u <Nop>
xmap \u <Nop>

" Mnemonic: change case like gu/gU
nmap \um <Plug>CaserMixedCase
xmap \um <Plug>CaserVMixedCase

nmap \ut <Plug>CaserTitleCase
xmap \ut <Plug>CaserVTitleCase

nmap \uc <Plug>CaserCamelCase
xmap \uc <Plug>CaserVCamelCase

nmap \u_ <Plug>CaserSnakeCase
xmap \u_ <Plug>CaserVSnakeCase
" make upper with underscores (snake case)
nmap \U <Plug>CaserUpperCase
xmap \U <Plug>CaserVUpperCase

nmap \u( <Plug>CaserSentenceCase
nmap \u) <Plug>CaserSentenceCase
xmap \u( <Plug>CaserVSentenceCase
xmap \u) <Plug>CaserVSentenceCase

" breaks sneak/camel cased characters with spaces
nmap \u<space> <Plug>CaserSpaceCase
xmap \u<space> <Plug>CaserVSpaceCase

" breaks characters with `-` in lower case
nmap \u- <Plug>CaserKebabCase
xmap \u- <Plug>CaserVKebabCase

nmap \u. <Plug>CaserDotCase
xmap \u. <Plug>CaserVDotCase

" w/o Prefix "{{{1

nmap \_ <Plug>CaserSnakeCase
xmap \_ <Plug>CaserVSnakeCase

nmap \- <Plug>CaserKebabCase
xmap \- <Plug>CaserVKebabCase

nmap \. <Plug>CaserDotCase
xmap \. <Plug>CaserVDotCase
