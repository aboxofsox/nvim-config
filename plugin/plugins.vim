if empty(glob('~/.config/nvim/autoload/plug.vim'))
silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall
endif

call plug#begin()


" Plug
Plug 'neomake/neomake', { 'on': 'Neomake' }

"Javascript Plugins
Plug 'MaxMEllon/vim-jsx-pretty'

"Emmet
Plug 'mattn/emmet-vim'

" LSP
Plug 'neovim/nvim-lspconfig'

"NERDTree
Plug 'preservim/nerdtree'

" ALE
Plug 'dense-analysis/ale'

"TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Themes
Plug 'arzg/vim-colors-xcode'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'gruvbox-community/gruvbox'

" Prettier
Plug 'prettier/vim-prettier', {'do': 'npm install'}

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

" GCC Comments
Plug 'tpope/vim-commentary'

call plug#end()