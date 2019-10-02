" Plugin manager is vim-plug for simplicity.

call plug#begin()

" Language Support
" ==============================================================================

" Intellisense engine with full Language Server Protocol (LSP) support.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Asynchronously lint and fix files, with Language Server Protocol (LSP) support.
Plug 'w0rp/ale'

" Syntax highlighting support for TOML.
Plug 'cespare/vim-toml', { 'for': 'toml' }

" Syntax highlighting and indentation for Haskell.
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }

" Automatically format Haskell code.
Plug 'alx741/vim-hindent'

" Editor Actions & Shortcuts
" ==============================================================================

" Pairs of handy bracket mappings.
Plug 'tpope/vim-unimpaired'

" Surround things with other things.
Plug 'tpope/vim-surround'

" Expand and collapse abbreviations.
Plug 'mattn/emmet-vim'

" Commenting.
Plug 'scrooloose/nerdcommenter'

" Themes & Appearance
" ==============================================================================

" Dark color theme.
Plug 'tomasiser/vim-code-dark'

" Status tabline.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Shows a git diff in the gutter and stages/undoes hunks and partial hunks.
Plug 'airblade/vim-gitgutter'

" File Search & Navigation
" ==============================================================================

" General-purpose fuzzy finder.
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Most Recently Used (MRU) files.
Plug 'yegappan/mru'

" A file system explorer.
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

call plug#end()



" (Plugin) Haskell-Vim
" ==============================================================================
"
let g:haskell_indent_disable=1

" (Plugin) NERDCommenter
" ==============================================================================

filetype plugin on

" Theme & (Plugin) Airline
" ==============================================================================

colorscheme codedark
let g:airline_theme = 'codedark'

" (Plugin) Git Gutter
" ==============================================================================

set updatetime=100

" (Plugin) FZF
" ==============================================================================

nmap ; :Files<CR>

" (Plugin) MRU
" ==============================================================================

nmap ' :MRU<CR>

" (Plugin) NERDTree
" ==============================================================================

" If NERDTree is the only window left, close Vim.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <F4> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']


" Other
" ==============================================================================

" Code Folding
set foldmethod=indent
set foldlevel=99

" Remap the spacebar to toggle folding code.
nnoremap <space> za

" PEP 8 Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Haskell Indentation
au BufNewFile,BufRead *.hs
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Web Development Indentation
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" Syntax Highlighting
let python_highlight_all=1
syntax on

" UTF-8 Support
set encoding=utf-8

" Enable line numbering.
set nu

" Context lines above and below the cursor.
set scrolloff=5

" Remove trailing whitespace on save.
autocmd BufWritePre * :%s/\s\+$//e

" Flag Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Auto Completion (Command)
set wildmode=longest,list,full
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
