" My .vimrc
" Turn on syntax highlighting
syntax on
source ~/dotfile/coc.nvim

" Use Vim-Plug
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vim-Plug and initialize
call plug#begin()

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" vim utilities
Plug 'airblade/vim-rooter'
Plug 'dense-analysis/ale'
Plug 'godlygeek/tabular' " For vim-markdown; must come before
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'rking/ag.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

" language-related
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'bfrg/vim-cpp-modern'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'python-mode/python-mode'

" All of your Plugins must be added before the following line
call plug#end()              " required

filetype plugin indent on    " required

" Set to auto read when a file is changed from the outside
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Encoding, Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color theme and font
if has('termguicolors')
  set termguicolors
endif
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set guifont=Fira\Code:h12

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

" Fix backspace indent whenever needed
set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Interface and Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent          " Maintain existing indentation. 
set number              " Show line numbers
set showcmd             " Show command in bottom bar
set showmatch           " highlight matching [{()}]
set cursorline          " highlight current line
set wildmenu            " Turn on the WiLd menu
set lazyredraw          " Redraw only when we need to.
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set splitbelow          " split window below
set mouse=a             " Mouse click on navigation

" Set cursor to line in Insert mode
" Set up vertical vs block cursor for insert/normal mode
if &term =~ "screen."
    let &t_ti.="\eP\e[1 q\e\\"
    let &t_SI.="\eP\e[5 q\e\\"
    let &t_EI.="\eP\e[1 q\e\\"
    let &t_te.="\eP\e[0 q\e\\"
else
    let &t_ti.="\<Esc>[1 q"
    let &t_SI.="\<Esc>[5 q"
    let &t_EI.="\<Esc>[1 q"
    let &t_te.="\<Esc>[0 q"
endif

" Vim Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
set laststatus=2 " Status bar
set path+=** " Include opened directory to Vim's path

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation for different filetypes
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=120
set colorcolumn=120

augroup python
  autocmd!
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79 expandtab commentstring=#\ %s
augroup END

augroup go
  autocmd!
  autocmd FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END

augroup cpp
  autocmd!
  autocmd FileType cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
augroup END

set wrap
set linebreak

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configurations 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable Vim Emmet only for HTML/CSS
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,eruby,javascriptreact,less,htmldjango EmmetInstall

" Turn on python-mode autocompletion mode
let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_lint = 1

" Using ack.vim for Ag
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" Ale C/C++ Linter
let g:ale_linters = {'c': ['clang'], 'cpp': ['clang', 'g++']}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MAPLEADER COMMA
let mapleader=","

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" save session, open with: vim -S
nnoremap <leader>s :mksession<CR>

" Using abbreviation for NERDTree
nnoremap <leader>ne :NERDTreeToggle<CR>

nnoremap <leader>c :noh<CR>

" => MAPLEADER SPACE
" use fzf.vim
let mapleader = "\<Space>"
nnoremap <silent> <leader><space> :Files<CR>
set hidden " Enable hidden buffers (don't need to save when switching files) 

" Use space leader to map vertical and horizontal splits
nnoremap <leader>vs :vsplit<CR>
nnoremap <leader>hs :split<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" Open NERDTree with Ctrl + t
nnoremap <C-t> :NERDTreeToggle<CR>

" Toggle to next buffer (:bnext) and previous buffer (:bprevious)
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" Open up tagbar with fn + F8 key
nnoremap <F8> :TagbarToggle<CR>

" space open/closes folds
nnoremap <space> za

" esc in insert mode
inoremap jk <Esc>

" tab and enter behavior on suggestion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TERMINAL Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! Vterm :vsp term://zsh " Open a terminal in a vertical split
command! Hterm :sp term://zsh " Open a terminal in a horizontal split

" Put the cursor in the right place when it enters a terminal buffer
function EnterTerminal()
    exec "norm! gg"
    exec "startinsert"
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TMUX Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

