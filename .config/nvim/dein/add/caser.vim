" From: motion.toml
" Repo: arthurxavierx/vim-caser

" Note: the prefix setting only works after the plugin was loaded
"let g:caser_prefix = 'qc'

let g:caser_no_mappings = 1

nmap \u <Nop>
xmap \u <Nop>

" reset sentence normally
nmap \u<space> <Plug>CaserSpaceCase
xmap \u<space> <Plug>CaserVSpaceCase

" Start at capitalized and the rest in lower case.
nmap \u( <Plug>CaserSentenceCase
nmap \u) <Plug>CaserSentenceCase
xmap \u( <Plug>CaserVSentenceCase
xmap \u) <Plug>CaserVSentenceCase

" Title Case
nmap \ut <Plug>CaserTitleCase
xmap \ut <Plug>CaserVTitleCase

" Case for Programming {{{1
" CamelCaseButStartsInCapitalized
" Mnemonic: change case like gu/gU
nmap \um <Plug>CaserMixedCase
xmap \um <Plug>CaserVMixedCase

" camelCase
nmap \uc <Plug>CaserCamelCase
xmap \uc <Plug>CaserVCamelCase

" snake_case
nmap \u_ <Plug>CaserSnakeCase
xmap \u_ <Plug>CaserVSnakeCase
nmap \_ <Plug>CaserSnakeCase
xmap \_ <Plug>CaserVSnakeCase

" SNAKE_CASE_IN_UPPER
nmap \U <Plug>CaserUpperCase
xmap \U <Plug>CaserVUpperCase

" hyphen-in-lower-case
nmap \u- <Plug>CaserKebabCase
xmap \u- <Plug>CaserVKebabCase
nmap \- <Plug>CaserKebabCase
xmap \- <Plug>CaserVKebabCase

" dot.in.lower.case
nmap \u. <Plug>CaserDotCase
xmap \u. <Plug>CaserVDotCase
nmap \. <Plug>CaserDotCase
xmap \. <Plug>CaserVDotCase
