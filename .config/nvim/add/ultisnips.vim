" From: insert.toml

let g:UltiSnipsEditSplit = 'tabdo'

let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/data/ultisnips']

let g:UltiSnipsExpandTrigger       = '<c-\>'
let g:UltiSnipsListSnippets        = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger  = '<c-n>'
let g:UltiSnipsJumpBackwardTrigger = '<c-p>'

noremap <silent> <a-s><a-p> :<c-u>UltiSnipsEdit<cr>
