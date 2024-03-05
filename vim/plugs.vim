call plug#begin()

" --- UI ---
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'

" --- Edit ---
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'jiangmiao/auto-pairs'

" --- Coc ---
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install'}
Plug 'neoclide/coc-html', {'do': 'yarn install'}
Plug 'neoclide/coc-css', {'do': 'yarn install'}
Plug 'fannheyward/coc-styled-components', {'do': 'yarn install'}
Plug 'neoclide/coc-json', {'do': 'yarn install'}

" --- search ---
Plug 'junegunn/vim-slash'

" --- Files ---
Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeToggle', 'NERDTreeFind']}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

" --- Javascript ---
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
Plug 'HerringtonDarkholme/yats.vim', {'for': ['typescript', 'typescriptreact']}
Plug 'maxmellon/vim-jsx-pretty', {'for': ['typescriptreact', 'javascript.jsx']}
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}

" --- HTML, Xml ---
Plug 'othree/html5.vim', {'for': ['htm', 'html']}
Plug 'mattn/emmet-vim', {'on': 'EmmetInstall'}
Plug 'Valloric/MatchTagAlways', {'for': ['htm', 'html' , 'xhtml' , 'xml']}
Plug 'digitaltoad/vim-pug', {'for': ['html', 'htm', 'pug']}

" --- Styles ---
Plug 'JulesWang/css.vim', {'for': ['css', 'less', 'scss']}
Plug 'hail2u/vim-css3-syntax', {'for': ['css', 'less', 'scss']}
Plug 'groenewege/vim-less', {'for': 'less'}
Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}
Plug 'wavded/vim-stylus', {'for ': 'styl'}
Plug 'styled-components/vim-styled-components', {'for': 'js', 'branch': 'main'}

" --- Python ---
Plug 'vim-python/python-syntax', {'for': 'python'}
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}

" --- Git ---
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" --- Other ---
Plug 'airblade/vim-rooter'
Plug 'benizi/vim-automkdir'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'jparise/vim-graphql'
Plug 'prisma/vim-prisma'

call plug#end()
