setlocal ft=dosini

let s:root = expand('%:p:h')
let &path = s:root .'/**'
setlocal suffixesadd=.ini,.conf

