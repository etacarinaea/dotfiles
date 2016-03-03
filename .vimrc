" Disable arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Mappings
map <F2> :TagbarToggle<CR>

" Indent automatically depending on filetype
filetype indent on
set autoindent

" Turn on line numbering. Turn it off with "set nonu" 
set number

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

syntax on

" Case insensitive search
set ic

" Highlight search
set hls

" Highlight current line
set cursorline

" Wrap text instead of being on one line
set lbr

" persistent undo
set undofile
set undodir=/home/yuki/.vimundo/

colorscheme yuki
