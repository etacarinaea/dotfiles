syntax on
colorscheme untitled_cs-24bit

let mapleader = (" ")

" swap files
set directory=~/.vim/swapfiles//
" Persistent undo
set undofile
set undodir=~/.vim/undo/

" Cycle through buffers
nnoremap <Tab> :bnext<CR>
noremap <S-Tab> :bprevious<CR>

filetype plugin on
filetype indent on
set autoindent

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set encoding=UTF-8
set hidden " Don't force to write buffer when switching
set autochdir " Automatically change directory to that of current file
set mouse=a " Enable mouse
set clipboard=unnamedplus " Use "+ register by default

set spelllang=en_gb
map <F4> :setlocal spell!<CR>
set number
set relativenumber
nnoremap <leader>r :set relativenumber!<CR>
set list
set listchars=tab:>-,nbsp:⋄,trail:×,conceal:·,precedes:‹,extends:›
set hls " Highlight search
map <F5> :noh<CR>
set cursorline
set scrolloff=4
set colorcolumn=81
set nowrap
set lbr " Wrap on breakat characters, not used when wrap is off
set completeopt="menuone, preview"
set signcolumn=yes

" Jump to last position on reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Folds
set foldmethod=syntax
set foldlevelstart=20
nnoremap <leader>f za
vnoremap <leader>f za

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

" Open InstantRst in chromium's app mode
function InsRstNew()
  InstantRst!
  call system("chromium --app=http://localhost:5676")
endfunction
command -nargs=0 InsRst call InsRstNew()

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


" Plugins
" -------

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable', 'on': 'YcmGenerateConfig' }
Plug 'SirVer/ultisnips'
" Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'Raimondi/delimitMate'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'tikhomirov/vim-glsl', { 'for': 'glsl' }
Plug 'gu-fan/InstantRst', { 'for': 'rst' }
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'plaintex' }
Plug 'lervag/vimtex', { 'for': 'plaintex' }
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-easy-align'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
call plug#end()

" -------

" tagbar
map <F1> :TagbarToggle<CR>
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

" NERDTree
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeMouseMode = 3
let g:NERDTreeShowHidden = 1
let g:NERDTreeSortHiddenFirst = 0
let g:NERDTreeIgnore = ["\.git$[[dir]]"]
" Make dir icon same color as dir text
highlight! link NERDTreeFlags NERDTreeDir

" NERD Commenter
let g:NERDSpaceDelims = 1

" YouCompleteMe
let g:ycm_server_python_interpreter = "/bin/python"
let g:ycm_extra_conf_globlist = ["~/workspace/*"]
let g:ycm_error_symbol = ""
let g:ycm_warning_symbol = ""

" UltiSnips
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snips"]
let g:UltiSnipsExpandTrigger = "<C-l>"
let g:UltiSnipsJumpForwardTrigger = "<C-l>"
let g:UltiSnipsJumpBackwardTrigger = "<C-h>"

" indentLine
" let g:indentLine_char = "┆"
" let g:indentLine_showFirstIndentLevel = 0
" let g:indentLine_setConceal = 0

" Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
set laststatus=2
let g:airline_theme = "untitled_cs24bit"
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_detect_spell=0
let g:airline_symbols.linenr = '並'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_section_c=airline#section#create(['file'])
" let g:airline_skip_empty_sections = 1
" let g:airline_section_z=airline#section#create(['%3p%% ', 'linenr', ':%3v'])
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffers_label = 'bufs'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_min_count = 2

" InstantRst
" Set the browser to true so InstantRst won't open it in an existing browser
" session (for InsRst)
let g:instant_rst_browser = 'true'

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_latexmk = {
  \ 'build_dir' : '/home/emily/.vim/latex-build/'
\ }

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Hexokinase
let g:Hexokinase_optInPatterns = [
  \ "full_hex",
  \ "triple_hex",
  \ "rgb",
  \ "rgba",
  \ "hsl",
  \ "hsla"
\]
