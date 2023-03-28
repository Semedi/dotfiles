set nocompatible                                " Don't try vi compatible
syntax on                                       " enable syntax highlighting
set background=dark                             " we like it dark!
"set background=light                             

highlight Pmenu ctermbg=black guibg=black     | " fix popup color so it's easier to read
filetype plugin on                              " load plugins based on file type filetype indent on                        
set shiftwidth=2                                " number of spaces to use for indenting
set softtabstop=2                               " number of spaces to use when inserting a tab
set tabstop=2                                   " show tabs as 2 spaces
set expandtab                                   " convert tabs into spaces
set autoindent                                  " copy indent from previous line
set wrap                                        " wrap longlines
set ignorecase smartcase                        " search case-insensitively unless uppercase characters are used
set hidden                                      " allow unsaved buffers to be hidden
set ruler                                       " show cursor line and column in status
set showcmd                                     " show current command in status line
set notimeout                                   " disable timeout for finishing a mapping key sequence
set visualbell                                  " visual bell = no sounds
set undofile                                    " store undo info in a file
set undodir=~/.vim-undo                         " where to store undo info
set dir=~/tmp,/tmp                              " store swap files in $HOME/tmp or /tmp, whichever is available
set scrolloff=3                                 " keep 3 lines visible above/below the cursor when scrolling
set sidescrolloff=7                             " keep 7 characters visible to the left/right of the cursor when scrolling
set sidescroll=1                                " scroll left/right one character at a time
set splitbelow splitright                       " put new windows below or to the right
set number                                      " show line numbers
set relativenumber                              " show line numbers relative
set mouse=a
                       
" scape works in the terminal and no display line number
tnoremap <Esc> <C-\><C-n>
autocmd TermOpen * setlocal nonumber norelativenumber

" leader mappings
nnoremap <space> <nop>
let mapleader=" "
nnoremap <leader>r :source /home/semedi/.config/nvim/init.vim<CR>

" system clipboard
vnoremap Y "+y
vnoremap X "+d

"buf navigation
nnoremap <Tab> :bn <CR>
nnoremap <S-Tab> :bp <CR>
nnoremap gb :ls<CR>:buffer<Space>


"""""""""""""""""""""""""""
" PLUGINS 
"""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
  Plug 'Avimitin/nerd-galaxyline'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'akinsho/nvim-bufferline.lua'

  Plug 'hashivim/vim-terraform'

  " Plug 'joshdick/onedark.vim'
  Plug 'dracula/vim'

  " git integration
  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-signify'

  " Language Server
  " Plug 'neovim/nvim-lspconfig'
  " Plug 'hrsh7th/nvim-compe'
  
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

if (has("termguicolors"))
  set termguicolors
endif

colorscheme dracula

" Nerdree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" FzF
nnoremap <silent> <C-p> :Files<CR>
nnoremap <C-g> :Rg<Cr>
let g:fzf_layout = { 'down': '~35%' }

" Vim go
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Lua loaders
luafile ~/.config/nvim/lua/plugins.lua
lua require("bufferline").setup{}

luafile ~/.config/nvim/lsp.lua
"luafile ~/.config/nvim/eviline.lua
