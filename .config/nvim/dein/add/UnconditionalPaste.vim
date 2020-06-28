" TOML: default.toml
" Repo: inkarkat/vim-UnconditionalPaste
" Another: source/UnconditionalPaste.vim

" Note: UnconditionalPaste.vim has only nmap, imap and cmap.

" Excerpt: imap
"     Char, Comma, Unjoin, Escape, Queried, Inlined, Togglecase,
"     RecallUnjoin, RecallEscape, RecallQueried,
"     RecallCombinatorial, RecallQueriedJoined,
"     CharCondensed, QueriedJoined,
"     Combinatorial,

" imap i_CTRL-R_CTRL-C        CharI
" imap i_CTRL-R_CTRL-I        InlinedI
" imap i_CTRL-R_CTRL-C_CTRL-C CharCondensedI

" imap i_CTRL-R_, CommaI

" imap i_CTRL-R_CTRL-Q                      QueriedI
" imap i_CTRL-R_CTRL-Q_CTRL-Q               RecallQueriedI
" imap i_CTRL-R_CTRL-Q_CTRL-G               QueriedJoinedI
" imap i_CTRL-R_CTRL-Q_CTRL-Q_CTRL-G_CTRL-G RecallQueriedJoinedI

" imap i_CTRL-R_CTRL-U        UnjoinI
" imap i_CTRL-R_CTRL-U_CTRL-U RecallUnjoinI

" imap i_CTRL-R_CTRL-\        EscapeI
" imap i_CTRL-R_CTRL-\_CTRL-\ RecallEscapeI

" imap i_CTRL-R_~ TogglecaseI

" imap i_CTRL-R_CTRL-H        CombinatorialI
" imap i_CTRL-R_CTRL-H_CTRL-H RecallCombinatorialI

" Excerpt: nmap
"     After/Before

" nmap gcp  CharAfter
" nmap glp  LineAfter
" nmap gpp  PlusAfter
" nmap grp  GrepAfter
" nmap g,p  CommaAfter
" nmap gPp  GPlusAfter
" nmap gbp  BlockAfter
" nmap gcP  CharBefore
" nmap glP  LineBefore
" nmap gpP  PlusBefore
" nmap grP  GrepBefore
" nmap g,P  CommaBefore
" nmap gBp  JaggedAfter
" nmap gPP  GPlusBefore
" nmap g\p  EscapeAfter
" nmap gbP  BlockBefore
" nmap gsp  SpacedAfter
" nmap gujp UnjoinAfter
" nmap g,op CommaOrAfter
" nmap g>p  ShiftedAfter
" nmap gBP  JaggedBefore
" nmap g\P  EscapeBefore
" nmap gcip InlinedAfter
" nmap gqp  QueriedAfter
" nmap gsP  SpacedBefore
" nmap gujP UnjoinBefore

" nmap g,ap CommaAndAfter
" nmap g,np CommaNorAfter
" nmap g,oP CommaOrBefore
" nmap g>P  ShiftedBefore
" nmap g]p  IndentedAfter
" nmap gciP InlinedBefore
" nmap gqP  QueriedBefore
" nmap g#p  CommentedAfter
" nmap g,aP CommaAndBefore
" nmap g,nP CommaNorBefore
" nmap gUp  UppercaseAfter
" nmap g[P  IndentedBefore
" nmap g[p  IndentedBefore
" nmap g]P  IndentedBefore
" nmap gqbp DelimitedAfter
" nmap gup  LowercaseAfter
" nmap g#P  CommentedBefore
" nmap g=p  ExpressionAfter
" nmap gRp  RecallGrepAfter
" nmap gUP  UppercaseBefore
" nmap g[[p LessIndentAfter
" nmap g]]p MoreIndentAfter
" nmap gcgp JustJoinedAfter
" nmap gqbP DelimitedBefore
" nmap guP  LowercaseBefore
" nmap g~p  TogglecaseAfter
" nmap g=P  ExpressionBefore
" nmap gRP  RecallGrepBefore
" nmap gSp  ParagraphedAfter
" nmap g[[P LessIndentBefore

" nmap g[[P LessIndentBefore
" nmap g]]P MoreIndentBefore
" nmap gcgP JustJoinedBefore
" nmap g~P  TogglecaseBefore
" nmap gSP  ParagraphedBefore
" nmap gUJp RecallUnjoinAfter
" nmap g\\p RecallEscapeAfter
" nmap gr!p InvertedGrepAfter
" nmap gCp  CharCondensedAfter
" nmap gQp  RecallQueriedAfter
" nmap gUJP RecallUnjoinBefore
" nmap g\\P RecallEscapeBefore
" nmap ghp  CombinatorialAfter
" nmap gqgp QueriedJoinedAfter
" nmap gr!P InvertedGrepBefore
" nmap gCP  CharCondensedBefore
" nmap gQP  RecallQueriedBefore
" nmap ghP  CombinatorialBefore
" nmap gqgP QueriedJoinedBefore
" nmap gQBp RecallDelimitedAfter
" nmap g,"p CommaDoubleQuoteAfter
" nmap g,'p CommaSingleQuoteAfter
" nmap g==p RecallExpressionAfter
" nmap gQBP RecallDelimitedBefore
" nmap g,"P CommaDoubleQuoteBefore
" nmap g,'P CommaSingleQuoteBefore
" nmap g==P RecallExpressionBefore
" nmap gR!p RecallInvertedGrepAfter
" nmap gHp  RecallCombinatorialAfter
" nmap gQgp RecallQueriedJoinedAfter
" nmap gR!P RecallInvertedGrepBefore
" nmap gHP  RecallCombinatorialBefore
" nmap gQgP RecallQueriedJoinedBefore
