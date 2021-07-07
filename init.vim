" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall
endif

call plug#begin()

function! DoRemote(arg)
UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'neomake/neomake', { 'on': 'Neomake' }
Plug 'ludovicchabant/vim-gutentags'


"Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'carlitux/deoplete-ternjs'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }

"Emmet
Plug 'mattn/emmet-vim'

"Typescript Plugins
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Quramy/tsuquyomi'
Plug 'mhartington/deoplete-typescript'

"NERDTree
Plug 'preservim/nerdtree'

"FZF
Plug 'junegunn/fzf', {'do': {-> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'stefandtw/quickfix-reflector.vim'

"TreeSitter
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Themes
Plug 'arzg/vim-colors-xcode'

call plug#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#tss#javascript_support = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1

autocmd! BufWritePost * Neomake
let g:neomake_warning_sign = {
\ 'text': '?',
\ 'texthl': 'WarningMsg',
\ }

let g:neomake_error_sign = {
\ 'text': 'X',
\ 'texthl': 'ErrorMsg',
\ }

" NERDTree Config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-m> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" FZF Config

let g:fzf_command_prefx = 'Fzf'
let g:fzf_layout = {'window': {'width' : 0.9, 'height' : 0.6}}
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(blue)%cr%C(white)"'
let $FZF_DEFAULT_OPTS= '--layout=reverse --bind ctrl-a:select-all'
autocmd! FileType fzf
autocmd FileType fzf set nonu nornu

nmap <C-p> :Files<CR>

function! s:build_quickfix_list(lines)
	call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
	copen
	cc
endfunction

"Emmet Config
let g:user_emmet_leader_key='<C-e>'

"Set colorscheme
colorscheme xcodedark

"Treesitter Config


