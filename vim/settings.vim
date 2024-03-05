colorscheme gruvbox
let g:gruvbox_terminal_colors = 1
set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Reduce delay when switching between modes.
augroup NoInsertKeycodes
  autocmd!
  autocmd InsertEnter * set ttimeoutlen=0
  autocmd InsertLeave * set ttimeoutlen=500
augroup END

" Add all TODO items to the quickfix list relative to where you opened Vim.
command! Todo call s:todo()

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" Make sure Vim returns to the same line when you reopen a file.
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" Automatically adjust quickfix window depending on how much text there is
autocmd FileType qf call AdjustWindowHeight(3, 20)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) | bd | q | endif
autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
autocmd BufEnter * call CleanEmptyBuffers()
autocmd BufWinEnter quickfix nnoremap <silent> <buffer>q :cclose<cr>:lclose<cr>

autocmd VimEnter * nested if argc() > 1 && !&diff | tab sball | tabfirst | endif

let g:rooter_silent_chdir = 1
let g:rooter_patterns = ['.git', 'Makefile']

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
autocmd FileType startify setlocal scrolloff=0 nowrap

" Unset paste on InsertLeave.
autocmd InsertLeave * silent! set nopaste

" NERDTree
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', '\.log$', '\.o$', '__pycache__$']
let NERDTreeWinSize = 30
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1

" Close vim if the only window left open is a NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

let g:user_emmet_leader_key='<C-z>'
let g:user_emmet_install_global = 0
let g:user_emmet_settings = {
  \  'javascript.jsx': {'extends': 'html', 'attribute_name': {
    \  'for': 'htmlFor',
    \  'class': 'className'
    \ }}
  \ }

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

let g:node_host_prog = system('volta which neovim-node-host | tr -d "\n"')

autocmd FileType html,htmljinja,htmldjango,xml,javascript.jsx EmmetInstall
autocmd FileType css,less,scss setlocal iskeyword+=-

" Make sure all types of requirements.txt files get syntax highlighting.
autocmd BufNewFile,BufRead requirements*.txt set syntax=python
autocmd BufNewFile,BufRead *.pug.html set syntax=pug

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Default file explore
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_winsize = 30
let g:netrw_browse_split = 4

autocmd TermOpen * setlocal nonumber norelativenumber

function! CleanEmptyBuffers()
  let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0 && !getbufvar(v:val, "&mod")')
  if !empty(buffers)
    exe 'bw ' . join(buffers, ' ')
  endif
endfunction

function! s:todo() abort
  let entries = []
  for cmd in ['git grep -niIw -e TODO -e FIXME 2> /dev/null',
            \ 'grep -rniIw -e TODO -e FIXME . 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction
