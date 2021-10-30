call plug#begin()

Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug '/usr/local/opt/fzf'
Plug 'yegappan/mru'
Plug 'vimwiki/vimwiki', { 'on': 'VimwikiIndex' }
Plug 'kamykn/spelunker.vim', { 'for': 'markdown' }

call plug#end()

" ==============================================================================
" Plugin-specific Configuration
" ==============================================================================

" Spelunker
set nospell

" Vim Wiki
set runtimepath+=~/vw_tmp/vimwiki
let wiki = {}
let wiki.path = '~/vw_tmp/wiki'
let wiki.path_html = '~/vw_tmp/wiki/html'
let wiki.syntax = 'default'
let wiki.ext = '.wiki'
let g:vimwiki_list = [wiki]

" FZF
nmap ; :FZF<CR>

" MRU
nmap ' :MRU<CR>

" ==============================================================================
" General Configuration
" ==============================================================================

" Code Folding
set foldmethod=indent
set foldlevel=99

" PEP 8 Indentation
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
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" Syntax Highlighting
let python_highlight_all=1
syntax on

" UTF-8 Support
set encoding=utf-8

" Enable Line Numbering
set nu

" Context Lines Above/Below Cursor
set scrolloff=5

" Remove Trailing Whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Flag Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Auto Completion (Command)
set wildmode=longest,list,full
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Retain Edit Position
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Statusline
:set laststatus=2
:set statusline=%m\ %F\ %y\ %{&fileencoding?&fileencoding:&encoding}\ %=%(C:%c\ L:%l\ %P%)

