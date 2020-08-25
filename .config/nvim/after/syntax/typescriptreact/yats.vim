" Repo: HerringtonDarkholme/yats.vim

runtime! syntax/tsx.vim

" Sample:
" `<` is set by tsxTag.
"
" <Head> <- tsxComponentName
"     <title> <- tsxTagName
"       Create Next App
"     </title>
"   <link rel="icon" href="/favicon.ico" />
" </Head>
"

hi! link tsxTag NonText
hi! link tsxEqual Normal

" hi! link tsxTagName Identifier
hi! link tsxComponentName Function

" Link syntax of pairs
hi! link tsxCloseTag tsxTag
hi! link tsxCloseString tsxTagName
hi! link tsxCloseComponentName tsxComponentName

hi! tsxRegion ctermfg=252 guifg=#d0d0d0
