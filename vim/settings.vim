"=====================================================
" General settings
"=====================================================

set t_Co=256
set termguicolors
set background=dark
colorscheme gruvbox
let g:gruvbox_terminal_colors = 1

set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
hi VertSplit guibg=#fbf1c7 guifg=#e7e9e1
set cursorline

set rnu
set number
set laststatus=2
set backspace=indent,eol,start
set noswapfile
set nobackup
set tags=./tags,tags;$HOME

" set fillchar
set fillchars+=vert:│

" hide cmd
set noshowcmd

" indent
set autoindent
set smartindent
set cindent

" show wildmenu
set wildmenu

" do not break words.
set linebreak

" tab options:
set smarttab
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

" no fold enable
set nofoldenable
set nowritebackup
set matchtime=0
set showmatch
set showmode
set complete=.,w,b,u,t
set wildmenu

" limit completion menu height
set pumheight=15
set scrolloff=5
set incsearch
set hlsearch
set laststatus=2
set wildignorecase
set mouse=nv
set hidden
set ttimeout
set lazyredraw
set inccommand=nosplit

" menuone: show the pupmenu when only one match
" disable preview scratch window,
set completeopt=menu,menuone,longest

" Show a vertical line on a 80th character
set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=DarkGrey

" Mark tabs and trailing spaces
set list listchars=nbsp:·,tab:→\ ,trail:·,extends:>,precedes:<
set listchars=tab:>·,trail:·,nbsp:¬

set encoding=utf-8

" interaction
set mouse=a                           " enable mouse support
set mousehide                         " hide the mouse cursor while typing
set whichwrap=b,s,h,l,<,>,[,]         " backspace and cursor keys wrap too

" Activate a permanent ruler and add line highlightng as well as numbers.
" Also disable the sucking pydoc preview window for the omni completion
" and highlight current line and disable the blinking cursor.
set ruler
set gcr=a:blinkon0
set ttyfast

syntax on
if has("gui_running")
  set macmeta
  set lines=50 columns=125
endif

" Customize the wildmenu
set wildmenu
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/tmp/*,*.so,*.swp,*.zip,*node_modules*
set wildmode=longest:full,full

autocmd BufWinEnter quickfix nnoremap <silent> <buffer>q :cclose<cr>:lclose<cr>
autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) | bd | q | endif
autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

set nocompatible " be iMproved, required
autocmd VimEnter * nested if argc() > 1 && !&diff | tab sball | tabfirst | endif

" Swaps and backups
set dir=/tmp
set backupdir=/tmp

" Hide some panels
set guioptions-=m " Hide menu bar.
set guioptions-=T " Hide toolbar
set guioptions-=L " Hide left-hand scrollbar
set guioptions-=r " Hide right-hand scrollbar
set guioptions-=b " Hide bottom scrollbar
set guioptions-=e " Hide tab
set showtabline=0 " Hide tabline

let g:indentLine_setColors = 0

let g:tagbar_sort = 0
let g:tagbar_width = 30
let g:tagbar_compact = 0

" Lint after save
let g:neomake_verbose = 0
let g:neomake_list_height = 0
let g:neomake_error_sign = {'text': '✖', 'texthl': 'GruvboxRedSign'}
let g:neomake_warning_sign = {'text': '➤', 'texthl': 'GruvboxYellowSign'}

autocmd! BufWritePost * Neomake

let g:indentLine_conceallevel = 2
let g:rooter_silent_chdir = 1

let g:indentLine_fileTypeExclude = ['help', 'startify', 'nerdtree']

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.dotfiles/vim/snippets'

" Start Banner
let g:startify_files_number = 6
let g:startify_update_oldfiles = 1
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_change_to_dir = 0

let g:startify_skiplist = [
  \ 'COMMIT_EDITMSG',
  \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
  \ 'bundle/.*/doc',
  \ ]

let g:startify_custom_header = [
  \ "         ( )            ",
  \ "          H             ",
  \ "          H             ",
  \ "         _H_            ",
  \ "      .-'-.-'-.         ",
  \ "     /         \        ",
  \ "    |           |       ",
  \ "    |   .-------'._     ",
  \ "    |  / /  '.' '. \    ",
  \ "    |  \ \ @   @ / /    ",
  \ "    |   '---------'     ",
  \ "    |    _______|       ",
  \ "    |  .'-+-+-+|        ",
  \ "    |  '.-+-+-+|        ",
  \ '    |    """""" |       ',
  \ "    '-.__   __.-'       ",
  \ '         """            ']

let g:startify_list_order = [
  \ ['   Most recently used files in the current directory:'],
  \ 'dir',
  \ ['   Most recently used files:'],
  \ 'files',
  \ ['   Sessions:'],
  \ 'sessions',
  \ ['   Bookmarks:'],
  \ 'bookmarks',
  \ ]

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" NERDTree
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeWinSize = 30
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" --- Airline ---
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#fnametruncate = 0
let g:airline#extensions#tabline#buffers_label = 'BUFFERS'
let g:airline#extensions#tabline#tabs_label = 'TABS'

let g:airline_symbols = {}
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.space = "\ua0"
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.maxlinenr = ' ☰'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

" Emmet
"""""""""""""""""""""""""""""""""""""
let g:user_emmet_settings = {
  \ 'javascript.jsx': {
  \   'extends': 'jsx',
  \ },
  \}
