" From: motion.toml
" Repo: arthurxavierx/vim-caser

" Note: the prefix setting only works after the plugin was loaded
"let g:caser_prefix = 'qc'

let g:caser_no_mappings = 1

nmap \( <Plug>CaserSentenceCase
xmap \( <Plug>CaserVSentenceCase
nmap \) <Plug>CaserSpaceCase
xmap \) <Plug>CaserVSpaceCase

nmap \_ <Plug>CaserSnakeCase
xmap \_ <Plug>CaserVSnakeCase
nmap \- <Plug>CaserKebabCase
xmap \- <Plug>CaserVKebabCase
nmap \. <Plug>CaserDotCase
xmap \. <Plug>CaserVDotCase


if dein#tap('vim-which-key') | finish | endif

nmap \u <Nop>
xmap \u <Nop>

" Start a sentence
nmap \u( <Plug>CaserSentenceCase
xmap \u( <Plug>CaserVSentenceCase
" continue a sentence
nmap \u) <Plug>CaserSpaceCase
xmap \u) <Plug>CaserVSpaceCase

" Title Case
nmap \ut <Plug>CaserTitleCase
xmap \ut <Plug>CaserVTitleCase

" Case for Programming {{{1
" PascalCase
" Mnemonic: change case like gu/gU
nmap \up <Plug>CaserMixedCase
xmap \up <Plug>CaserVMixedCase

" camelCase
nmap \uc <Plug>CaserCamelCase
xmap \uc <Plug>CaserVCamelCase

" snake_case
nmap \u_ <Plug>CaserSnakeCase
xmap \u_ <Plug>CaserVSnakeCase

" SNAKE_CASE_IN_UPPER
nmap \U <Plug>CaserUpperCase
xmap \U <Plug>CaserVUpperCase

" hyphen-in-lower-case
nmap \u- <Plug>CaserKebabCase
xmap \u- <Plug>CaserVKebabCase

" dot.in.lower.case
nmap \u. <Plug>CaserDotCase
xmap \u. <Plug>CaserVDotCase
