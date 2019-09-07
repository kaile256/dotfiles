" From: tool.toml

" direct-install      [dein#direct_install] install a plugin directly
cnoreabbr <expr> din (getcmdtype() == ':' && getcmdline() =~ '^din$')? 'Dein dinrect-install' : 'din'

" rollback            [dein#rollback] rollback plugins
cnoreabbr <expr> drb (getcmdtype() == ':' && getcmdline() =~ '^drb$')? 'Dein rollback' : 'drb'


" check-lazy-plugins  [dein#check_lazy_plugins] check nonsense lazy plugins
cnoreabbr <expr> dlz (getcmdtype() == ':' && getcmdline() =~ '^dlz$')? 'Dein check-lazy-plugins' : 'dlz'

" log                 [dein#get_log] show the dein log
cnoreabbr <expr> dlog (getcmdtype() == ':' && getcmdline() =~ '^dlog$')? 'Dein log' : 'dlog'

" Original
" clean               [original] clean plugins directories
cnoreabbr <expr> dcl (getcmdtype() == ':' && getcmdline() =~ '^dcl$')? 'Dein clean' : 'dcl'
" list                [original] print a list of configured bundles
cnoreabbr <expr> dls (getcmdtype() == ':' && getcmdline() =~ '^dls$')? 'Dein list' : 'dls'

" update              [dein#update] update a plugin
" check-clean         [dein#check_clean] check unused plugins directories
" source              [dein#source] :source plugins
" clear-state         [dein#clear_state] clear the dein state file
" updates-log         [dein#get_updates_log] show the dein update log
" each                [dein#each] execute shell command for each plugins
" check-install       [dein#check_install] check plugins installation
" install             [dein#install] install a plugin
" check-update        [dein#check_update] check plugins update
