" Disable arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

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

" Persistent undo
set undofile
set undodir=/home/yuki/.vimundo/

" Jump to last position on reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

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
let g:syntastic_error_symbol = "∙Δ"
let g:syntastic_warning_symbol = "∙!"
let g:syntastic_style_error_symbol = "∘Δ"
let g:syntastic_style_warning_symbol = "∘!"
let g:syntastic_loc_list_height = 4
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Airline
set laststatus=2
let g:airline_theme = "yuki"
let g:airline_powerline_fonts = 1


" Colorscheme
colorscheme yuki-alt
