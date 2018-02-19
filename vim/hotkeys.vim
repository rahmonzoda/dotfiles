"=====================================================
" User hotkeys
"=====================================================

let mapleader = '\'

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

" Move up / down with Alt + j / k
if has('mac')
  nnoremap ∆ :m .+1<CR>==
  nnoremap ˚ :m .-2<CR>==
  inoremap ∆ <Esc>:m .+1<CR>==gi
  inoremap ˚ <Esc>:m .-2<CR>==gi
  vnoremap ∆ :m '>+1<CR>gv=gv
  vnoremap ˚ :m '<-2<CR>gv=gv
else
  nnoremap <A-j> :m .+1<CR>==
  nnoremap <A-k> :m .-2<CR>==
  inoremap <A-j> <Esc>:m .+1<CR>==gi
  inoremap <A-k> <Esc>:m .-2<CR>==gi
  vnoremap <A-j> :m '>+1<CR>gv=gv
  vnoremap <A-k> :m '<-2<CR>gv=gv
endif

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
nnoremap <silent> <Leader>tt :TagbarToggle<CR>

" Window
nnoremap <silent> <Leader>+ :resize +5<CR>
nnoremap <silent> <Leader>- :resize -5<CR>
nnoremap <silent> <Leader>v+ :vertical resize +5<CR>
nnoremap <silent> <Leader>v- :vertical resize -5<CR>

" Git
nnoremap <silent> <Leader>gk :Agit <CR>
nnoremap <silent> <Leader>gd :Gdiff <CR>
nnoremap <silent> <Leader>gf :GFiles <CR>
nnoremap <silent> <Leader>gb :Gblame <CR>
nnoremap <silent> <Leader>gs :Gstatus <CR>
nnoremap <silent> <Leader>gc :Gcommit <CR>
nnoremap <silent> <Leader>go :.Gbrowse <CR>

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

let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map z#  <Plug>(asterisk-z#)
map gz* <Plug>(asterisk-gz*)
map gz# <Plug>(asterisk-gz#)

augroup go
  autocmd!

  autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)

  autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)

  autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)

  autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)

  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)

  " I like these more!
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

nmap <silent> [s <Plug>(ale_previous_wrap)
nmap <silent> ]s <Plug>(ale_next_wrap)
nmap <leader>= <Plug>(ale_fix)

" <Tab>
imap <C-k> <Plug>(neosnippet_expand_or_jump)
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"

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

function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction

function! NerdToggle()
  if bufname('%') == '' || &readonly || !filereadable(bufname('$'))
    exe "NERDTreeToggle"
  else
    if exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
      exe "NERDTreeClose"
    else
      exe "NERDTreeFind"
    endif
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
