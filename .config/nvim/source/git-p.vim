" From: git.toml
" Repo: iamcco/git-p.nvim
" Another: add/git-p.vim

" enable virtual text to display blame and neovim support this
"let g:gitp_blame_virtual_text = 0

" format blame virtual text
" hash: commit hash
" account: commit account name
" date: YYYY-MM-DD
" time: HH:mm:ss
" ago: xxx ago
" zone: +xxxx
" commit: commit message
" lineNum: line number
let g:gitp_blame_format = ' %{commit} %{ago} by %{account}'

" NOTE: use %{hash:8} or %{hash:0:8} to use the first 8 characters

"" Statusline integrated: b:gitp_blame, b:gitp_diff_state {{{1
"" blame info:
" b:gitp_blame = {
"    hash: string
"    account: string
"    date: string
"    time: string
"    ago: string
"    zone: string
"    lineNum: string
"    lineString: string
"    commit: string
"    rawString: string
" }
"
"" diff lines stat:
"" Note: will trigger GitPDiffAndBlameUpdate event after these variables updated
" b:gitp_diff_state = { delete: number, add: number, modify: number }

"" custom diff-signs for signcolumn {{{1
"let g:gitp_add_sign = '■'
"let g:gitp_modify_sign = '▣'
"let g:gitp_delete_top_sign = '▤'
"let g:gitp_delete_bottom_sign = '▤'
"let g:gitp_delete_top_and_bottom_sign = '▤'

"" Highlight {{{1
"" Note: GitPFooHi is defined as default highlight
"" use custom highlight for blame virtual text
""hi link GitPBlameLine GitPBlameLineHi
"" for diff sign
"hi link GitPAdd                GitPAddHi
"hi link GitPModify             GitPModifyHi
"hi link GitPDeleteTop          GitPDeleteHi
"hi link GitPDeleteBottom       GitPDeleteHi
"hi link GitPDeleteTopAndBottom GitPDeleteHi
"
"hi link GitPDiffFloat Pmenu
"" let your sign column background same as line number column
" hi! link SignColumn LineNr

" do what iamcco/sran.nvim/plugin/sran.vim do, instead {{{1
let g:loaded_dict_nvim = 1
call sran#rpc#start_server()
