syntax on 		" syntax highlighting

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HELPFUL DIRECTORIES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set directory=~/.local/share/nvim/swap
set undodir=~/.local/share/nvim/undo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY BINDINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" don't use arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" really, just don't (not even in insert mode)
"inoremap <Up>    <NOP>
"inoremap <Down>  <NOP>
"inoremap <Left>  <NOP>
"inoremap <Right> <NOP>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set title " Show the filename in the window titlebar
set undofile " Persistent Undo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugs')

" nord colorscheme, get their term colorscheme from 
" https://github.com/arcticicestudio/nord-vim
Plug 'arcticicestudio/nord-vim'

" semantic-based completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --ts-completer' }

" JavaScript Highlight & Improved Indentation
Plug 'pangloss/vim-javascript'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Lisp dev environment
Plug 'l04m33/vlime', { 'do': 'clisp vlime/lisp/start-vlime.lisp' }

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
" NERDTree
let NERDTreeShowHidden=1
map <silent> <C-o> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VISUAL CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set 256 colors
set t_Co=256

" allow italic comments
let g:nord_italic = 1
let g:nord_italic_comments = 1

" set colorscheme
colorscheme nord

" set line numbers
set relativenumber
set number
