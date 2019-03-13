let mapleader = (" ")
" swap files
set directory=~/.vim/swapfiles//

" Cycle through buffers
nnoremap <Tab> :bnext<CR>
noremap <S-Tab> :bprevious<CR>

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

" Enable spellchecking
set spell spelllang=en_gb

" Enable mouse
set mouse=a
let g:NERDTreeMouseMode=3

" Use "+ register by default
set clipboard=unnamedplus

" Indent automatically depending on filetype
filetype indent on
set autoindent

" Turn on line numbering. Turn it off with "set nonu"
set number

" Don't force to write buffer when switching
set hidden

" Indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set list
set listchars=tab:>-,nbsp:⋄,trail:×

syntax on

" Case insensitive search
" set ic

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
set undodir=/home/yuki/.vim/undo/

" Don't use preview window
set completeopt="menu"

" Jump to last position on reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Enable automatic folds
set foldmethod=syntax
set foldlevelstart=20
" set foldcolumn=3


" Custom commands
" ---------------

" Changes all expanded tabs with length initial to length final
function Tabtotab(initial, final)
  let &ts=a:initial
  let &sts=a:initial
  setlocal noet
  retab!
  let &ts=a:final
  let &sts=a:final
  setlocal et
  retab
endfunction

command -nargs=+ Retab call Tabtotab(<f-args>)


" Plugins
" -------

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

let g:NERDSpaceDelims = 1

" YouCompleteMe
let g:ycm_server_python_interpreter = "/bin/python"
let g:ycm_extra_conf_globlist = ["~/workspace/*"]

" UltiSnips
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snips"]
let g:UltiSnipsExpandTrigger = "<c-l>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" indentLine
let g:indentLine_char = "¦"
let g:indentLine_showFirstIndentLevel = 0

" Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

set laststatus=2
let g:airline_theme = "yuki"
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ""
let g:airline_right_sep = ""
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffers_label = 'bufs'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_min_count = 2

let g:airline_symbols.linenr = ''

let g:tagbar_type_rst = {
  \ 'ctagstype': 'rst',
  \ 'ctagsbin' : 'rst2ctags',
  \ 'ctagsargs' : '-f - --sort=yes',
  \ 'kinds' : [
    \ 's:sections',
    \ 'i:images'
  \ ],
  \ 'sro' : '|',
  \ 'kind2scope' : {
    \ 's' : 'section',
  \ },
  \ 'sort': 0,
\ }

" Colorscheme
colorscheme yuki-alt

