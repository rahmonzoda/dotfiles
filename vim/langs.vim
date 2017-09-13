"=====================================================
" Autocomplete
"=====================================================

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_refresh_always=0
let g:deoplete#file#enable_buffer_path=1
let g:deoplete#sources#ternjs#filetypes = [
  \ 'jsx',
  \ 'javascript',
  \ 'javascript.jsx',
  \ ]

"" Deoplete-tern settings
let g:tern_request_timeout=1
let g:tern_show_signature_in_pum=1

"=====================================================
" Languages support
"=====================================================

" --- HTML ---
autocmd FileType html,xhtml,jinja,xml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" --- CSS ---
autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" --- JavaScript ---
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript let b:javascript_fold = 0

let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_javascript_enabled_makers = ['eslint']

" --- Python ---
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

let g:pymode_lint = 0
let g:pymode_lint_write = 0
let g:pymode_lint_cwindow = 0

let g:pymode_python = 'python3'
let g:pymode_virtualenv = 1

let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_flake8_maker = { 'args': ['--ignore=E501,E402,E128,E225,E231,F403,F405,E126'], }

" Don't autofold code
let g:pymode_folding = 0

let g:pymode_options_colorcolumn = 0

" Get possibility to run Python code
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'

let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>ab'

let g:pymode_rope = 0

let python_slow_sync=1
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0

let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

let g:jedi#popup_on_dot = 1         " Enable autocomplete on dot
let g:jedi#popup_select_first = 0   " Disable first select from auto-complete
let g:jedi#auto_vim_configuration = 0
let g:jedi#show_call_signatures = 1

autocmd CompleteDone * pclose " To close preview window of deoplete automagically

" --- Go ---
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = 'goimports'

" --- Vim ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" --- Other ---
let g:vim_json_syntax_conceal = 0
autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

let g:user_emmet_install_global = 0
autocmd FileType html,css,less,scss,javascript.jsx EmmetInstall
