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


" (Plugin) Coc
" ==============================================================================

" " if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
