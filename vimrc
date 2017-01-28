set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
"Plugin 'fholgado/minibufexpl.vim'
Plugin 'WolfgangMehner/vim-plugins'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'rakr/vim-one'
Plugin 'joshdick/onedark.vim'
Plugin 'jordwalke/flatlandia'
Plugin 'JBakamovic/yaflandia'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" -------------------------------------------------------
" Enable file type detection
"filetype on
" Turn on plugin loading and tailored indenting based on file type
filetype plugin indent on
" Enable syntax highlighting
syntax enable
set nofoldenable
set tabstop=4
set backspace=indent,eol,start
set autoindent
set copyindent
set shiftwidth=4
set shiftround
set incsearch
set softtabstop=4
set textwidth=80

" Tabs in command line mode behave like bash
set wildmode=longest,list,full
set wildmenu
set hlsearch

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======
"exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
"set list
" Persistent undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

fixdel
set modelines=5
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set spell spelllang=en_us
" Show trailing whitespace:
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" Fix C indenting behavior:
" http://stackoverflow.com/questions/28217118/vim-indents-c-c-functions-badly-when-the-type-and-name-are-in-different-lines
set cinoptions+=t0
" Trigger CMake mode for various file extensions
:autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in setf cmake
:autocmd BufRead,BufNewFile *.ctest,*.ctest.in setf cmake
" Tcl resources:
:autocmd BufRead,BufNewFile *.tcl,*.tcl.in setf tcl

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

set mouse=a
set ttymouse=xterm2
set mousefocus

" Infere the case-sensitivity
set infercase

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tag_files = 1
set completeopt=longest,menu

" syntastic Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" System clipboard
set clipboard=unnamed

" no swap files
set noswapfile

" airline
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" NERDTree automatically open at startup
"autocmd vimenter * NERDTree

colorscheme onedark
