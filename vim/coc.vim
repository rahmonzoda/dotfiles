" CoC

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-Tab>'

nnoremap <leader>es :call OpenSnippetFile()<cr>
nnoremap <leader>ec :CocConfig<cr>

" Diagnostics Navigate
nmap <silent>[[ <Plug>(coc-diagnostic-prev)
nmap <silent>]] <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent>K :call <SID>showDocumentation()<cr>

" rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for do codeAction of selected region, current line or motion. ex: `<leader>aap` for current paragraph
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>af <Plug>(coc-fix-current)

" Commands List
nnoremap <leader>c :<C-u>CocList commands<cr>

" Prettier format action
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
nnoremap <leader>= :<C-u>CocCommand prettier.formatFile<cr>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:showDocumentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  elseif &filetype == 'tmux'
    call tmux#man()
  else
    call CocAction('doHover')
  endif
endfunction
