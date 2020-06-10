" TOML: browse.toml
" Repo: https://github.com/kana/vim-altr
" Another: post/altr.vim

call altr#define('autoload/%.vim', 'plugin/%.vim')
call altr#define('ftplugin/%.vim', 'syntax/%.vim')
call altr#define('add/%.vim', 'source/%.vim', 'post/%.vim')

call altr#define('%.h', '%.c')
call altr#define('%.hxx', '%.cxx')
call altr#define('%.hpp', '%.cpp')
