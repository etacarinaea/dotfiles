" Cycle through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Disable arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Enable filetype plugin
filetype plugin on

" Enable mouse
set mouse=a
let g:NERDTreeMouseMode=3

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

set list
set listchars=tab:>-

syntax on

" Case insensitive search
set ic

" Highlight search
set hls

" Highlight current line
set cursorline

" Highlight column 81
set colorcolumn=81

" Wrap text instead of being on one line
set lbr

" Persistent undo
set undofile
set undodir=/home/yuki/.vimundo/

" Jump to last position on reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Plugins
execute pathogen#infect()
map <F1> :TagbarToggle<CR>
map <F2> :NERDTreeToggle<CR>

" Syntastic
map <F3> :lopen<CR>
map <F4> :lclose<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_error_symbol = "Δ"
let g:syntastic_warning_symbol = "!"
let g:syntastic_style_error_symbol = "Δ"
let g:syntastic_style_warning_symbol = "!"
let g:syntastic_loc_list_height = 4
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Disable for rst files
let g:syntastic_mode_map = {"mode": "active", "passive_filetypes": ["rst"]}

" YouCompleteMe
" let g:ycm_global_ycm_extra_conf = "/home/yuki/.vim/.ycm_extra_conf.py"

" Airline
set laststatus=2
let g:airline_theme = "yuki"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 0

" Colorscheme
colorscheme yuki-alt
