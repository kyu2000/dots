" Plugins
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

    Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    Plug 'vim-airline/vim-airline'

    Plug 'preservim/nerdtree'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" :PlugInstall to install plugins

" Colors
syntax enable
filetype plugin on
set termguicolors
set background=dark

let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme material

" Tabs and Spaces
filetype indent on
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set backspace=indent,eol,start

" File Find
set path+=**
set wildmenu
set wildignore+=**/node_modules/** 
set hidden

" UI
let mapleader=","
set number
set relativenumber
set modelines=1
set showcmd
set ruler
set cursorline
set scrolloff=10

set cmdheight=2
set updatetime=300
set shortmess+=c

if has("nvim-0.5.0") || has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif

" Searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" let g:airline_symbols.colnr = ' '
let g:airline_theme = 'material'

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" COC
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ CheckBackspace() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" VIMRC
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC <bar> :doautocmd BufRead<CR>
