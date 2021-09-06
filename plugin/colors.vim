fun! VimColors()
    syntax on

    " if exists('+termguicolors')
    "     let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    "     let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    " endif

    highlight ColorColumn ctermbg=0 guibg=grey
    " highlight Normal guibg=none

    " highlight LineNr guifg=#ff8659
    " highlight LineNr guifg=#aed75f
    highlight LineNr guifg=#5eacd3
    highlight netrwDir guifg=#5eacd3
    highlight qfFileName guifg=#aed75f
endfun
call VimColors()

nnoremap <leader>cwm :call VimColors() <cr>
autocmd VimEnter :call VimColors()
