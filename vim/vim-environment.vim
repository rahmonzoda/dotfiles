set nocompatible " be iMproved, required

syntax on
filetype plugin indent on
set cursorline
set termguicolors
set background=dark

set number
" set relativenumber
set backspace=indent,eol,start

set nobackup
set noswapfile
set nowritebackup

" set fillchar
set fillchars+=vert:│

" hide cmd
set noshowcmd

set nowrap

" indent
set cindent
set autoindent
set smartindent

" show wildmenu
set wildmenu

" do not break words.
set linebreak

" tab options:
set smarttab
set tabstop=4
set noexpandtab
set shiftwidth=4
set softtabstop=0

" no fold enable
set nofoldenable

set matchtime=0
set showmatch
set showmode
set complete=.,w,b,u,t

" limit completion menu height
set pumheight=15
set incsearch
set hlsearch
set laststatus=2
set wildignorecase
set hidden
set ttimeout
set lazyredraw
set inccommand=nosplit

" scrolling
set scrolloff=4
set sidescrolloff=8
set sidescroll=1

" updatetime, default 4000
set updatetime=100

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" menuone: show the pupmenu when only one match
" disable preview scratch window,
set completeopt=menu,menuone,longest

" Mark tabs and trailing spaces
set list listchars=nbsp:·,tab:→\ ,trail:·,extends:>,precedes:<
set listchars=tab:>·,trail:·,nbsp:¬

" Set character encoding to use in vim
set fenc=utf-8
set encoding=utf-8

" Auto reload changed files
set autoread

" interaction
set mouse=a                           " enable mouse support
set mousehide                         " hide the mouse cursor while typing
set whichwrap=b,s,h,l,<,>,[,]         " backspace and cursor keys wrap too
set history=50

" Activate a permanent ruler and add line highlightng as well as numbers.
" Also disable the sucking pydoc preview window for the omni completion
" and highlight current line.
set ruler
set ttyfast

" Customize the wildmenu
set wildmenu
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/tmp/*,*.so,*.swp,*.zip,*node_modules*
set wildmode=longest:full,full

" Hide some panels
set guioptions-=m " Hide menu bar.
set guioptions-=T " Hide toolbar
set guioptions-=L " Hide left-hand scrollbar
set guioptions-=r " Hide right-hand scrollbar
set guioptions-=b " Hide bottom scrollbar
set guioptions-=e " Hide tab
set showtabline=0 " Hide tabline

" Open new split panes to right and bottom
set splitbelow
set splitright

set concealcursor=
