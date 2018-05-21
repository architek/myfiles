" pathogen load
filetype off
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on
syntax on
let g:pymode_python = 'python3'


"colorscheme evening
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
