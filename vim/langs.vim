"=====================================================
" Autocomplete
"=====================================================

let g:jsx_ext_required = 1
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

" --- Python ---
let g:python_highlight_builtins = 1
let g:python_highlight_exceptions = 1
let g:python_highlight_builtin_objs = 1
let g:python_highlight_builtin_funcs = 1
let g:python_highlight_string_format = 1
let g:python_highlight_string_formatting = 1

" --- Other ---
let g:vim_json_syntax_conceal = 0
autocmd FileType htmljinja,htmldjango setlocal commentstring={#\ %s\ #}
autocmd BufRead,BufNewFile .{jscs,jshint,eslint,babel,prettier}rc set filetype=json
autocmd BufRead,BufNewFile *.wsdl setlocal filetype=xsd
" autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
autocmd FileType json syntax match Comment +\/\/.\+$+

" Show a vertical line on a 80th character
autocmd FileType python,go,sh,javascript,javascript.jsx setlocal textwidth=80 colorcolumn=+1
