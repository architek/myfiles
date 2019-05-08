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
au BufWritePre *.py PymodeLintAuto
let g:pymode_lint_ignore = ["E501", "E265"]
"let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe', ]
"let g:pymode_lint_checkers = ['pylint', ]
let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe', 'pyflakes']


" Rope compl
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<C-Space>'



" Color
colorscheme evening

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
