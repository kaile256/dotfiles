" Repo: HerringtonDarkholme/yats.vim

runtime! syntax/jsx.vim

" Sample:
" `<` is set by jsxTag.
"
" <Head> <- jsxComponentName
"     <title> <- jsxTagName
"       Create Next App
"     </title>
"   <link rel="icon" href="/favicon.ico" />
" </Head>
"

hi! link jsxTag NonText
hi! link jsxEqual Normal

" hi! link jsxTagName Identifier
hi! link jsxComponentName Function

" Link syntax of pairs
hi! link jsxEndTag jsxTag
hi! link jsxEndString jsxTagName
hi! link jsxEndComponentName jsxComponentName

