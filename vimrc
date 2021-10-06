call plug#begin()

" Asynchronously lint and fix files, with Language Server Protocol (LSP) support.
Plug 'w0rp/ale'

" Pairs of handy bracket mappings.
Plug 'tpope/vim-unimpaired'

" Surround things with other things.
Plug 'tpope/vim-surround'

" Expand and collapse abbreviations.
Plug 'mattn/emmet-vim'

" Commenting.
Plug 'scrooloose/nerdcommenter'

" Dark color theme.
Plug 'tomasiser/vim-code-dark'

" Status tabline.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Shows a git diff in the gutter and stages/undoes hunks and partial hunks.
Plug 'airblade/vim-gitgutter'

" General-purpose fuzzy finder.
Plug '/usr/local/opt/fzf'

" Most Recently Used (MRU) files.
Plug 'yegappan/mru'

" Note taking.
Plug 'vimwiki/vimwiki'

" Spell checker.
Plug 'kamykn/spelunker.vim'

call plug#end()

" ==============================================================================
" Plugin-specific Configuration
" ==============================================================================

" Spelunker
" ==============================================================================
set nospell

" Vim Wiki
" ==============================================================================
set runtimepath+=~/vw_tmp/vimwiki
let wiki = {}
let wiki.path = '~/vw_tmp/wiki'
let wiki.path_html = '~/vw_tmp/wiki/html'
let wiki.syntax = 'default'
let wiki.ext = '.wiki'
let g:vimwiki_list = [wiki]

" NERDCommenter
" ==============================================================================
set nocompatible
filetype plugin on

" Theme & Airline
" ==============================================================================
colorscheme codedark
let g:airline_theme = 'codedark'

" Git Gutter
" ==============================================================================
set updatetime=100

" FZF
" ==============================================================================
nmap ; :FZF<CR>

" MRU
" ==============================================================================
nmap ' :MRU<CR>

" ==============================================================================
" General Configuration
" ==============================================================================

" Code Folding
" ==============================================================================
set foldmethod=indent
set foldlevel=99

" PEP 8 Indentation
" ==============================================================================
set foldmethod=indent
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Web Development Indentation
" ==============================================================================
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" Syntax Highlighting
" ==============================================================================
let python_highlight_all=1
syntax on

" UTF-8 Support
" ==============================================================================
set encoding=utf-8

" Enable Line Numbering
" ==============================================================================
set nu

" Context Lines Above/Below Cursor
" ==============================================================================
set scrolloff=5

" Remove Trailing Whitespace
" ==============================================================================
autocmd BufWritePre * :%s/\s\+$//e

" Flag Unnecessary Whitespace
" ==============================================================================
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Auto Completion (Command)
" ==============================================================================
set wildmode=longest,list,full
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Retain Edit Position
" ==============================================================================
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
