" From: motion.toml

let g:textobj_function_no_default_key_mappings = 1

augroup LetTextobjFuncOnlyWhenRequired
  au!
  au FileType vim nmap <buffer> af  <Plug>(textobj-function-a)
  au FileType vim nmap <buffer> if  <Plug>(textobj-function-i)
  au FileType vim nmap <buffer> aF  <Plug>(textobj-function-A)
  au FileType vim nmap <buffer> iF  <Plug>(textobj-function-I)
augroup END
