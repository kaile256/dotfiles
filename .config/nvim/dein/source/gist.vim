" From: memo.toml
" Repo: mattn/gist-vim

"let g:gist_detect_filetype = 1

"let g:gist_use_password_in_gitconfig = 1

"let g:gist_open_browser_after_post = 1
"let g:gist_browser_command = 'w3m %URL%'
"let g:gist_browser_command = 'opera %URL% &'

"let g:gist_api_url = 'http://your-github-enterprise-domain/api/v3'

"let g:gist_namelength = 20

let g:gist_show_privates = 1
let g:gist_post_private  = 1 " Post to private (with -p) as default; with -P to public
"let g:gist_post_anonymous = 1

"let g:gist_extmap = { ".swift": "swift" }
let g:gist_edit_with_buffers = 1
let g:gist_get_multiplefile = 1

let g:gist_list_vsplit = 1

" 2: update a gist only on :w!
" else: both on :w and :w!
let g:gist_update_on_write = 2
