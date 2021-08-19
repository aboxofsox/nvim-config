"Emmet Config
let g:user_emmet_leader_key='<C-e>'

" Enable for only HTML & CSS
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Snippets
" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))

