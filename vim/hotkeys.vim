"=====================================================
" User hotkeys
"=====================================================

let mapleader = '\'

inoremap <c-u> <esc>hviwUea

"exit insert more with jj
inoremap jj <ESC>

" Move by visual line when wrapping (not real lines)
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
inoremap <expr><Down> pumvisible() ? '<C-n>' : '<C-o>gj'
inoremap <expr><Up> pumvisible() ? '<C-p>' : '<C-o>gk'

" " Center window when moving up and down
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

"classic C-a to select all document
nnoremap <C-a> ggVG

" Duplicate lines
nnoremap <Leader>d m`YP``
vnoremap <Leader>d YPgv

" Fast saving
nnoremap <silent><C-s> :<C-u>write<CR>
vnoremap <silent><C-s> :<C-u>write<CR>
cnoremap <silent><C-s> <C-u>write<CR>

" copy to system buffer
xnoremap <Leader>y "*y

" Move right / left
xnoremap < <gv
xnoremap > >gv|

" Navigate splits with <Ctrl-hjkl>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" j and k by lines on screen, as with modern editors
nnoremap j gj
nnoremap k gk

" Insert current file directory path (without file name)
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Navigation in command line
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-l> <Right>

inoremap <C-b> <Left>
inoremap <C-l> <Right>

" Toggle paste mode
nnoremap <silent> <leader>tp :set invpaste<CR>:set paste?<CR>

nnoremap <silent> <Leader>bd :bd <CR>
nnoremap <silent> <Leader>bh :Startify <CR>

nnoremap <silent> <C-o> :Files<CR>
nnoremap <silent> <C-e> :Buffers<CR>
nnoremap <silent> <Leader>fg :Ag<CR>
xnoremap <silent> <Leader>fg y:Ag <C-R>"<CR>

nnoremap <silent> <C-p> :call NerdToggle()<CR>

" Window
nnoremap <silent> <Leader>+ :resize +5<CR>
nnoremap <silent> <Leader>- :resize -5<CR>
nnoremap <silent> <Leader>v+ :vertical resize +5<CR>
nnoremap <silent> <Leader>v- :vertical resize -5<CR>

" Git
nnoremap <silent> <Leader>gd :Gdiff <CR>
nnoremap <silent> <Leader>gb :Git blame <CR>
nnoremap <silent> <Leader>gs :Git status <CR>
nnoremap <silent> <Leader>gc :Git commit <CR>
nnoremap <silent> <Leader>gf :Git fetch <CR>
nnoremap <silent> <Leader>gl :Git pull <CR>
nnoremap <silent> <Leader>gp :Git push <CR>
nnoremap <silent> <Leader>gk :Commits <CR>
nnoremap <silent> <Leader>go :.Gbrowse <CR>
nnoremap <silent> <Leader>gh :GitGutterStageHunk<CR>

nnoremap <silent> <Leader>hf :History <CR>
nnoremap <silent> <Leader>hc :History: <CR>
nnoremap <silent> <Leader>hs :History/ <CR>

" Terminal
nnoremap <silent> <Leader>ts :bo sp term://zsh\|resize 20<Cr>i
nnoremap <silent> <Leader>tv :bo vsp term://zsh<Cr>i

tnoremap <Esc> <C-\><C-n>
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l
tnoremap <C-w>w <C-\><C-n><C-w>w
tnoremap <C-w>q <C-\><C-n>: bd!<CR>

" Improve scroll, credits: https://github.com/Shougo
nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ?
  \ 'zt' : (winline() == 1) ? 'zb' : 'zz'
noremap <expr> <C-f> max([winheight(0) - 2, 1])
  \ ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
noremap <expr> <C-b> max([winheight(0) - 2, 1])
  \ ."\<C-u>".(line('w0') <= 1 ? "H" : "M")

" Cursor position after expanding tag
autocmd FileType html,htmldjango,htmljinja,xml,javascript.jsx
  \ inoremap <expr> <CR> TagExpander()

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

autocmd FileType help,diff,git,godoc,man nnoremap <buffer><silent> q :bd!<CR>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" disable command history
map q: :

" Don't use Ex mode, use Q for formatting
map Q gq

function! NerdToggle()
  if bufname('%') == '' || &readonly || !filereadable(bufname('$'))
    exe "NERDTreeToggle"
  elseif exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
    exe "NERDTreeClose"
  else
    exe "NERDTreeFind"
  endif
endfunction

function! TagExpander()
  let line   = getline(".")
  let col    = col(".")
  let first  = line[col-2]
  let second = line[col-1]
  let third  = line[col]

  if first ==# ">"
    if second ==# "<" && third ==# "/"
      return "\<CR>\<C-o>==\<C-o>O"
    else
      return "\<CR>"
    endif
  else
    return "\<CR>"
  endif
endfunction
