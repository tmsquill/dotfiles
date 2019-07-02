" ==============================================================================
" Maintainer: Troy Squillaci
" ==============================================================================

" ==============================================================================
" Plugin manager is vim-plug for simplicity.
" ==============================================================================

call plug#begin()

" Linting
Plug 'w0rp/ale'
Plug 'nvie/vim-flake8'
Plug 'cespare/vim-toml'

" Git
Plug 'airblade/vim-gitgutter'

" Just Vim Stuff
Plug 'itchyny/lightline.vim'
Plug 'townk/vim-autoclose'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'tpope/vim-surround'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'mattn/emmet-vim'

" Commenting
Plug 'scrooloose/nerdcommenter'

" File Search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'yegappan/mru'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

call plug#end()

" ==============================================================================
" (P) NERDTree
" ==============================================================================

" If NERDTree is the only window left, close Vim.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle NERDTree with <F4>.
nnoremap <F4> :NERDTreeToggle<CR> 

" Ignore files by extension.
let NERDTreeIgnore=['\.pyc$', '\~$']

" ==============================================================================
" (P) Git Gutter
" ==============================================================================

" Refresh every 100ms for responsiveness.
set updatetime=100

" ==============================================================================
" (P) FZF
" ==============================================================================

map ; :Files<CR>

" ==============================================================================
" (P) Lightline 
" ==============================================================================

set laststatus=2
set noshowmode

" ==============================================================================
" (P) SimpylFold 
" ==============================================================================

" See the docstrings for the folded code.
let g:SimpylFold_docstring_preview=1

" ==============================================================================
" Code Folding
" ==============================================================================

set foldmethod=indent
set foldlevel=99

" Remap the spacebar to toggle folding code.
nnoremap <space> za

" ==============================================================================
" Indentation
" ==============================================================================

" PEP 8 Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Web Development Indentation
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" ==============================================================================
" Flag Unnecessary Whitespace
" ==============================================================================

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" ==============================================================================
" UTF-8 Support
" ==============================================================================

set encoding=utf-8

" ==============================================================================
" Syntax Highlighting
" ==============================================================================

let python_highlight_all=1
syntax on

" ==============================================================================
" Line Numbering
" ==============================================================================

set nu

" ==============================================================================
" Color Schemes
" ==============================================================================

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" ==============================================================================
" Auto Completion (Command) 
" ==============================================================================

set wildmode=longest,list,full
