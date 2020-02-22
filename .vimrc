set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
let g:ycm_confirm_extra_conf = 0

 " let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'

 Plugin 'scrooloose/nerdtree.git'

 Plugin 'tpope/vim-speeddating'

" Universal Text Linking
 Plugin 'vim-scripts/utl.vim'

 Plugin 'jceb/vim-orgmode'

 Plugin 'mattn/calendar-vim'

" Plugin 'Valloric/YouCompleteMe'

 Plugin 'vim-airline/vim-airline'

 Plugin 'vim-airline/vim-airline-themes'

 " vimtex
 Plugin 'tpope/vim-fugitive'

 Plugin 'scrooloose/nerdcommenter'

 " DO check out what it can do and configs
 Plugin 'easymotion/vim-easymotion'

 Plugin 'vim-scripts/taglist.vim'

 Plugin 'scrooloose/syntastic'

 " Underscores, italics and colors
 Plugin 'bpstahlman/txtfmt'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just  :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

"-- Syntastic syntax checker ----------
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0
    let g:syntastic_cpp_compiler = 'g++'
    let g:syntastic_cpp_include_dirs = ["/opt/boost_1_66_0"]
    let g:syntastic_cpp_compiler_options = ' -Wall -std=c++14 '


" Syntastic is waay to slow when working with boost, so I disable it and map
" <C-w>  e to check syntax
    let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
    nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
"-------------------------------------



map <C-n> :NERDTree <Enter>
map <C-t> :vert term <Enter>
let mapleader=","
set number
set autochdir " (the working directory is always the one where the active buffer is located)
set t_Co=256
set splitright
colorscheme zenburn

syntax on
