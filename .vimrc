execute pathogen#infect()
syntax on
filetype plugin indent on

map <C-n> :NERDTree <Enter>
set number
set autochdir " (the working directory is always the one where the active buffer is located)
au FileType cpp SetExtensionName e " for ctk plugin to set compiled programs' name
colorscheme wombat

nnoremap h <Left>
nnoremap t <Down>
nnoremap n <Up>
nnoremap s <Right>
nnoremap j s
nnoremap q n
nnoremap Q N
