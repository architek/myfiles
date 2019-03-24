" pathogen load
filetype off
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on
syntax on
let g:pymode_python = 'python3'
"let g:pymode_lint_ignore = "E501,W"
let g:pymode_options_max_line_length = 120
let g:pymode_virtualenv = 0


colorscheme evening
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
let g:syntastic_rst_checkers=['sphinx']
