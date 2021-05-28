set cursorline
set nu
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
filetype plugin indent on
syntax on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'preservim/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplete.vim'
call vundle#end()
let g:neocomplete#enable_at_startup = 1
let mapleader= ","
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" support css word with -
autocmd FileType css,scss,slim,html,eruby,coffee,javascript setlocal iskeyword+=-
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype sh setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype yml setlocal tabstop=2 shiftwidth=2 softtabstop=2

map <silent><F8> :NERDTree<CR>
map <silent><F9> :NERDTreeClose<CR>
map <leader>r :NERDTreeFind<cr>
map <leader>e :NERDTreeToggle<cr>
map <leader>y "+y<cr>
map <leader>p "+p<cr>
:inoremap ( ()<Esc>i
:inoremap { {}<Esc>i
:inoremap [ []<Esc>i
:inoremap < <><Esc>i
:inoremap " ""<Esc>i
:inoremap ' ''<Esc>i
map <left> <c-w>w
map <right> <c-w>w
nmap - :bp<cr>
nmap = :bn<cr>
nmap \ :vsp<cr>
set hlsearch
