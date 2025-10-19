/home/$USER/.config/nvim/init.vim

set number                  " Show line numbers
set relativenumber          " Relative line numbers
"set cursorline              " Highlight the current line
set tabstop=2               " Number of spaces a <Tab> counts for
set shiftwidth=2            " Number of spaces for indentation
set expandtab               " Use spaces instead of tabs
set smartindent             " Smart indentation
set autoindent              " Automatically indent new lines
set wrap                    " Wrap lines


set ignorecase              " Ignore case in searches
set smartcase               " Case-sensitive search if uppercase is used
set incsearch               " Show search matches as you type
set hlsearch                " Highlight search results

set showmatch               " Show matching parentheses and brackets
set clipboard=unnamedplus   " Use system clipboard (requires neovim 0.5+)
set background=dark         " Set dark background
set termguicolors           " Enable true color support
set scrolloff=8             " Keep 8 lines above and below the cursor when scrolling

syntax enable
colorscheme industry              " Change this to your preferred color scheme
