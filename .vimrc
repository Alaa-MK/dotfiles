set number
set ttimeoutlen=10
set clipboard=unnamedplus
set ignorecase
set smartcase
set nowrap

" cursorline
set cursorline
set cursorlineopt=number,line

" keep the undo history across buffer sessions
" set undofile

" 4 spaces tab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Indent multiple times
vnoremap < <gv
vnoremap > >gv

" exit insert mode
inoremap jk <ESC>
inoremap JK <ESC>

" move inside wrapped lines
nnoremap <S-j> gj
nnoremap <S-k> gk

" keep 5 lines at the bottom
set scrolloff=6

" fold by syntax
set foldmethod=syntax
set foldlevelstart=99

" conceal level
" set conceallevel=2
augroup SetConcealLevel
  autocmd!
  autocmd FileType norg setlocal conceallevel=2
augroup END

" split windows to the right
set splitright
set splitbelow

set list
set listchars=tab:│——,lead:‧,leadmultispace:│‧‧‧,extends:»,precedes:«

" treesitter folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

filetype plugin on
