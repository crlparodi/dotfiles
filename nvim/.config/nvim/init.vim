set langmap=é~
lmap é ~

syntax on

set number

execute pathogen#infect()
filetype plugin indent on

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='monochrome'
let g:airline_powerline_fonts = 1
