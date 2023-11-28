" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set nocompatible

set number

" File type config"
set nocp
filetype on
filetype plugin on 
filetyp indent on

set t_Co=256
syntax on
set comments=sl:/*,mb:\ *,elx:\ */

"Clip board
set clipboard=unnamed

" space and tabs"
set expandtab
set tabstop=4
set shiftwidth=4     " indent also with 4 spaces
set autoindent
set smartindent

set nobackup
set history=1000
set showcmd

"Window opening
set splitbelow
set splitright

set nowrap

"search"
set incsearch
set showmatch
set hlsearch

"auto comlplite tab"
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>
" Load standard tag files
let OmniCpp_NamespaceSearch = 2
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4

" provide path directly to the library file
let g:clang_library_path='/usr/lib/llvm-10/lib/libclang-10.so.1'


" in diff mode we use the spell check keys for merging
if &diff
  ” diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
  " spell settings
  :setlocal spell spelllang=en
  " set the spellfile - folders must exist
  set spellfile=~/.vim/spellfile.add
  map <M-Down> ]s
  map <M-Up> [s
endif


    "" PLUGINS ---------------------------------------------------------------- {{{
    call plug#begin()

    Plug 'morhetz/gruvbox'
    Plug 'bfrg/vim-cpp-modern'
    Plug 'xavierd/clang_complete'
    "Plug 'vim-airline/vim-airline'
    Plug 'vim-scripts/indentpython.vim'
    Plug 'vim-syntastic/syntastic'
    Plug 'ycm-core/YouCompleteMe'
    Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
    Plug 'preservim/nerdtree'
    Plug 'nvie/vim-flake8'

    call plug#end()
    " }}}


" MAPPINGS --------------------------------------------------------------- {{{

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++ .<CR>

" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>

" Window mappings
nmap <C-j> <C-w>j 
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.
autocmd vimenter * ++nested colorscheme gruvbox
 
" Start NERDTree and put the cursor back in the other window
autocmd VimEnter * NERDTree | wincmd p

" }}}

" Py specific -------------------------------------------------------------- {{{

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"let python_highlight_all=0

"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}
"
"theam
set background=dark    " Setting dark mode

"
"
