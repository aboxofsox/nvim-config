" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall
endif

call plug#begin()

"if has('nvim')
"    Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
" else
"    Plug 'Shougo/deoplete.nvim'
"    Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

Plug 'neomake/neomake', { 'on': 'Neomake' }
" Plug 'ludovicchabant/vim-gutentags'


"Javascript Plugins
"Plug 'pangloss/vim-javascript'
"Plug 'carlitux/deoplete-ternjs'
"Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'MaxMEllon/vim-jsx-pretty'

"Emmet
Plug 'mattn/emmet-vim'

"Typescript Plugins
"Plug 'Shougo/vimproc.vim', { 'do': 'make' }
"Plug 'Quramy/tsuquyomi'
"Plug 'mhartington/deoplete-typescript'

" LSP
Plug 'neovim/nvim-lspconfig'

"NERDTree
Plug 'preservim/nerdtree'

"FZF
Plug 'junegunn/fzf', {'do': {-> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'stefandtw/quickfix-reflector.vim'

" ALE
Plug 'dense-analysis/ale'

"TreeSitter
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Themes
Plug 'arzg/vim-colors-xcode'
Plug 'dracula/vim', {'as':'dracula'}

" Prettier
Plug 'prettier/vim-prettier', {'do': 'npm install'}


" Color picker
Plug 'KabbAmine/vCoolor.vim'
Plug 'dracula/dracula-theme'

" CoC
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" LuaLine
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Go
Plug 'fatih/vim-go'

" Lua Autocomplete
Plug 'nvim-lua/completion-nvim'
Plug 'aca/completion-tabnine', {'do': './install.sh'}

" Compe
Plug 'hrsh7th/nvim-compe'

call plug#end()

" Telescope config
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffer<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0

let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]

" call deoplete#custom#option('num_processes', 4)

let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#tss#javascript_support = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1

" Providers
let g:loaded_ruby_provider = 0
" let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

autocmd! BufWritePost * Neomake
let g:neomake_warning_sign = {
\ 'text': '?',
\ 'texthl': 'WarningMsg',
\ }

let g:neomake_error_sign = {
\ 'text': 'X',
\ 'texthl': 'ErrorMsg',
\ }

" ALE Configuration
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent>] c <Plug>(ale_next_wrap)
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" Omni Completition
filetype plugin on
set omnifunc=syntaxcomplete#Complete

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
" colorscheme xcodedark
colorscheme dracula

" Enable line numbers
set number

" Set Indention
filetype indent on
set smartindent
set shiftwidth=4

" Color picker config
nmap <C-r> :VCoolor<CR>

" Completition config
let g:completion_chain_complete_list = {
    \ 'default': [
    \	{'complete_items':['lsp', 'snippet', 'tabnine']},
    \	{'mode': '<c-p>'},
    \	{'mode': '<c-n>'},
    \]    
\}


" tabnine priority (default: 0)
" Defaults to lowest priority
let g:completion_tabnine_priority = 0

" tabnine binary path (default: expand("<sfile>:p:h:h") .. "/binaries/TabNine_Linux")
" let g:completion_tabnine_tabnine_path = ""

" max tabnine completion options(default: 7)
let g:completion_tabnine_max_num_results=7

" sort by tabnine score (default: 0)
let g:completion_tabnine_sort_by_details=1

" max line for tabnine input(default: 1000)
" from current line -1000 ~ +1000 lines is passed as input
let g:completion_tabnine_max_lines=1000


let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true


lua << EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.gopls.setup{}
require'lualine'.setup()
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}
EOF
