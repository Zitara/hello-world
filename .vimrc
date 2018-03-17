set nocompatible

" ---------------------------------------------------------------------------- "
" Plugins                                                                      "
" ---------------------------------------------------------------------------- "

call plug#begin('~/.vim/plugged')

Plug 'ciaranm/detectindent'
Plug 'junegunn/fzf',                        { 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'moll/vim-bbye'
Plug 'scrooloose/nerdtree',                 "{ 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
Plug 'shougo/vimproc',                      { 'do': 'make' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'chiel92/vim-autoformat',              { 'on': 'Autoformat' }
Plug 'majutsushi/tagbar',                   { 'on': 'TagbarToggle' }

Plug 'vim-scripts/doxygentoolkit.vim',      { 'for': 'cpp' }
Plug 'octol/vim-cpp-enhanced-highlight',    { 'for': 'cpp' }
Plug 'twinside/vim-hoogle',                 { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim',                 { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc',                   { 'for': 'haskell' }
Plug 'mpickering/hlint-refactor-vim',       { 'for': 'haskell' }
"Plug 'fatih/vim-go',                        "{ 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'jdevlieghere/llvm.vim',               { 'for': 'llvm' }
Plug 'racer-rust/vim-racer',                { 'for': 'rust' }
Plug 'rust-lang/rust.vim',                  { 'for': 'rust' }
"Plug 'ctrlpvim/ctrlp.vim' " Super Searching
"Plug 'brookhong/cscope.vim'

Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'JBakamovic/yaflandia'
Plug 'jordwalke/flatlandia'
Plug 'thinkpixellab/flatland'
Plug 'morhetz/gruvbox'

Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

Plug 'https://github.com/pboettch/vim-cmake-syntax'

if has("python")
    Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer'}    " --gocode-completer --racer-completer' }
else
    Plug 'ajh17/vimcompletesme'
endif

call plug#end()

" ---------------------------------------------------------------------------- "
" General Settings                                                             "
" ---------------------------------------------------------------------------- "

filetype plugin indent on

try
    "colorscheme solarized
    colorscheme onedark
catch
endtry
call togglebg#map("<F5>")       " Toggle dark or light background

if !exists("g:syntax_on")
    syntax enable
endif

set autoread                    " Auto reload file after external command
set background=dark             " Use a dark background
set backspace=indent,eol,start  " Delete over line breaks
set binary                      " Enable binary support
set colorcolumn=80,120          " Show ruler columns
set encoding=utf-8              " Use UTF-8 encoding
set hidden                      " Hide buffers instead of closing them
set laststatus=2                " Always display the status line
set nofoldenable                " Disable folding
set lazyredraw                  " Use lazy redrawing
set noshowmode                  " Don't show mode
set number                      " Show line numbers
set pastetoggle=<F2>            " Toggle paste mode with F2
set ruler                       " Show ruler
set showcmd                     " Show current command
set showmatch                   " Show matching bracket/parenthesis/etc
set showmode                    " Show current mode
set tags=tags;                  " Find tags recursively
set title                       " Change terminal title
set ttyfast                     " Fast terminal
set wildmenu                    " Visual autocomplete for command menu
set clipboard^=unnamed,unnamedplus
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set ffs=unix,dos                " File format

" Temp Files
set nobackup                    " No backup file
set noswapfile                  " No swap file

" Search
set incsearch                   " Incremental search
set hlsearch                    " Highlight matches
set ignorecase                  " Case-insensitive search...
set smartcase                   " ...unless search contains uppercase letter

" Indentation
set smarttab                    " Better tabs
set smartindent                 " Insert new level of indentation
set autoindent                  " Copy indentation from previous line
set tabstop=2                   " Columns a tab counts for
set softtabstop=2               " Columns a tab inserts in insert mode
set shiftwidth=2                " Columns inserted with the reindent operations
set shiftround                  " Always indent by multiple of shiftwidth
set expandtab                   " Always use spaces instead of tabs

" Key sequence timeout
set ttimeout                    " Enable time out
set ttimeoutlen=0               " Disable key code delay

" Wrapping
set wrap                      " Don't wrap long lines
set linebreak                   " When wrapping, only at certain characters
set textwidth=80                 " Turn off physical line wrapping
set wrapmargin=80                " Turn off physical line wrapping
set nolist                      " For "soft" wrapping

" Joining
set nojoinspaces                " Only one space when joining lines
set formatoptions+=j            " Remove comment leader when joining lines

" Scroll
set sidescrolloff=5             " Keep at least 5 lines left/right
set scrolloff=5                 " Keep at least 5 lines above/below

" Mouse
set mousehide                   " Hide mouse when typing
set mouse=nicr                  " Disable mouse

" Disable bell
set visualbell                  " Disable visual bell
set noerrorbells                " Disable error bell

" Treat given characters as a word boundary
set iskeyword-=.                " '.' is an end of word designator
set iskeyword-=#                " '#' is an end of word designator

" Splits
set splitbelow                  " Horizontal split below
set splitright                  " Vertical split right

" Spell checking
set spelllang=en_us             " English as default language
set spell                       " Enable by default

" Invisible characters
set nolist
set listchars=eol:¬,tab:▶\ ,trail:~,extends:⟩,precedes:⟨,nbsp:␣
set showbreak=↳\ \ \ "

" Make completion menu behave like an IDE
set completeopt=longest,menuone

" Encryption
if has("crypt-blowfish2")
    set cm=blowfish2
endif

" History
set history=1000                " Remember more commands
if has('persistent_undo')
    set undofile                " Persistent undo
    set undodir=~/.vim/undo     " Location to store undo history
    set undolevels=1000         " Max number of changes
    set undoreload=10000        " Max lines to save for undo on a buffer reload
endif

" ---------------------------------------------------------------------------- "
" Colors & User Interface                                                      "
" ---------------------------------------------------------------------------- "

if has("gui_running")
    set guifont=Source\ Code\ Pro\ Light:h12
    set antialias
end

" Same color for sign column and line numbers
highlight clear SignColumn

" Custom spell-checking highlighting
highlight SpellBad     term=underline cterm=underline
highlight SpellCap     term=underline cterm=underline
highlight SpellRare    term=underline cterm=underline
highlight SpellLocal   term=underline cterm=underline

" ---------------------------------------------------------------------------- "
" Key Mappings                                                                 "
" ---------------------------------------------------------------------------- "

" Typos
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa

" Save file which you forgot to open with sudo
cnoremap w!! w !sudo tee % >/dev/null

" Wrap the current visual selection
vnoremap Q gq

" Wrap the current paragraph
nnoremap Q gqap

" Search for current visual selection
vnoremap // y/\V<C-R>"<CR>

" Move between open buffers.
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" ---------------------------------------------------------------------------- "
" Leader Mappings                                                              "
" ---------------------------------------------------------------------------- "

" Clear search highlight
nnoremap <leader><space> :noh<CR>

" Yank
nnoremap <leader>yf :let @+=expand("%:p")<CR>
nnoremap <leader>yl :let @+=expand('%:t') . ':' . line(".")<CR>

" Toggle
nnoremap <leader>ts :setlocal spell!<CR>
nnoremap <leader>tl :set list!<CR>

" Buffers
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bf :bfirst<CR>
nnoremap <leader>bl :blast<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" Windows
nnoremap <leader>wd <C-w>c
nnoremap <leader>wo <C-w>o

" ---------------------------------------------------------------------------- "
" Auto Commands                                                                "
" ---------------------------------------------------------------------------- "

" Filetype specific settings
augroup filtypes
    autocmd!
    autocmd FileType c,cpp setlocal commentstring=///\ %s
    autocmd FileType crontab setlocal nobackup nowritebackup
augroup end

" Remove trailing whitespace
augroup remove_trailing_whitespace
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
augroup end

" Watch my .vimrc
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup end

" ---------------------------------------------------------------------------- "
" Plugin Configuration                                                         "
" ---------------------------------------------------------------------------- "

" vim-bbye
nnoremap <silent> <leader>bd :Bdelete!<CR>

" vim-signify
let g:signify_vcs_list=['git']
let g:signify_update_on_bufenter=0

" fzf.vim
let g:fzf_buffers_jump=1
nnoremap <leader>a :Ag<SPACE>
vnoremap <leader>a y :Ag <C-R>"<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-b> :Buffers<CR>

" vim-airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

" detectindent
let g:detectindent_preferred_expandtab=1
let g:detectindent_preferred_indent=2

augroup detect_indent
    autocmd!
    autocmd BufReadPost * :DetectIndent
augroup end

" nerdtree
let g:NERDTreeIgnore=['\.job$', '^CVS$', '\.orig', '\~$']
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=35

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"autocmd vimenter * NERDTree
"map <C-n> :NERDTreeToggle<CR>

nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <leader>tn :NERDTreeToggle<CR>

augroup close_nerdtree
    autocmd!
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup end

" tagbar
"let g:tagbar_autofocus=0
"let g:tagbar_compact=1
"let g:tagbar_right=1
"let g:tagbar_width=35
"let g:tagbar_show_linenumbers = 1
nnoremap <leader>tt :TagbarToggle<CR>
"autocmd VimEnter * nested :TagbarOpen
"autocmd VimEnter * nested :call tagbar#autoopen(1)

" vim-autoformat
let g:formatters_python=['yapf', 'autopep8']
let g:formatter_yapf_style='pep8'

" doxygentoolkit.vim
let g:DoxygenToolkit_commentType="C++"

" youcompleteme
let g:ycm_extra_conf_globlist=['~/.vim/*']
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_error_symbol='✗'
let g:ycm_warning_symbol='▲'
"let g:ycm_server_python_interpreter= '/usr/bin/python'
"let g:ycm_python_binary_path = '/usr/bin/python'
let g:ycm_python_binary_path = 'python3'
"let g:ycm_server_use_vim_stdout = 1
"let g:ycm_server_log_level = 'debug'
"let g:ycm_confirm_extra_conf = 1
"let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

