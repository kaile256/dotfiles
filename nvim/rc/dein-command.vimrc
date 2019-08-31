" From: tool.toml

cnoreabbr <expr> dein (getcmdtype() == ':' && getcmdline() =~ '^dein$')? 'Dein' : 'dein'
" search              [original] seach vim plugins from GitHub
cnoreabbr <expr> ds (getcmdtype() == ':' && getcmdline() =~ '^ds$')? 'Dein search' : 'ds'

" direct-install      [dein#direct_install] install a plugin directly
cnoreabbr <expr> di (getcmdtype() == ':' && getcmdline() =~ '^di$')? 'Dein direct-install' : 'di'
" reinstall           [dein#reinstall] reinstall a plugin
cnoreabbr <expr> dri (getcmdtype() == ':' && getcmdline() =~ '^dri$')? 'Dein reinstall' : 'dri'

" rollback            [dein#rollback] rollback plugins
cnoreabbr <expr> drb (getcmdtype() == ':' && getcmdline() =~ '^drb$')? 'Dein rollback' : 'drb'

" recache-runtimepath [dein#recache_runtimepath] re-make runtimepath cache and execute :helptags
cnoreabbr <expr> drc (getcmdtype() == ':' && getcmdline() =~ '^drc$')? 'Dein recache-runtimepath' : 'drc'

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
