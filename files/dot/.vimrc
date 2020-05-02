" pathogen load
filetype off
let g:pymode_virtualenv = 0
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on
syntax on

" Python
" See pymode.txt for python mode
let g:pymode_python = 'python3'
let g:pymode_lint_sort = ['E', 'C', 'I'] 
let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe', 'pyflakes']
au BufWritePre *.py PymodeLintAuto

" Rope compl
let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_rope_show_doc_bind = '<C-c>d'



" Color
colorscheme evening
if has("gui_running")
    set guioptions -=T
endif

" Base options
set showmatch
set expandtab
set shiftwidth=4
set softtabstop=4

"syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_rst_checkers=['sphinx']
let g:syntastic_python_pylint_post_args="--max-line-length=120"
