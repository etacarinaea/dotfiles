" vim:foldmethod=marker:foldlevel=0:foldcolumn=3:
set background=dark
" Has to be set before vim-airline loads otherwise the separators will have
" the wrong colours, so make sure the colourscheme is loaded first in .vimrc
set termguicolors

let g:untitled_cs#colors_name = "untitled_cs-24bit"

function! s:hi(...)
  let groups = a:000[:-2]
  let args = a:000[-1]
  for group in groups
    execute "hi" group
      \ "guifg=" . (has_key(args, "fg") ? args["fg"] : "NONE")
      \ "guibg=" . (has_key(args, "bg") ? args["bg"] : "NONE")
      \ "cterm=" . (has_key(args, "tr") ? args["tr"] : "NONE")
  endfor
endfunction

source ~/.vim/colors/untitled_cs-colour-definitions.vim

" General {{{
call s:hi("CursorLine", {
  \ "bg": g:untitled_cs#bg_light
\})
call s:hi("ColorColumn", {
  \ "bg": g:untitled_cs#bg_light
\})
call s:hi("VertSplit", {
  \ "fg": g:untitled_cs#bg,
  \ "bg": g:untitled_cs#bg_light
\})
call s:hi("EndOfBuffer", {
  \ "fg": g:untitled_cs#bg_lighter
\})
" }}}
" Status line {{{
call s:hi(
  \ "SatusLine",
  \ "SatusLineNC",
  \{
    \ "fg": g:untitled_cs#bg_lighter,
    \ "bg": g:untitled_cs#bg
\})
" }}}
" Command line {{{
call s:hi(
  \ "ModeMsg",
  \ "MoreMsg",
  \ {
    \ "fg": g:untitled_cs#bg_lighter
\})
call s:hi(
  \ "ErrorMsg",
  \ "WarningMsg",
  \ {
    \ "fg": g:untitled_cs#red,
    \ "tr": "reverse"
\})

call s:hi("Question", {
  \ "fg": g:untitled_cs#magenta
\})
" }}}
" Side {{{
call s:hi("CursorLineNr", {
  \ "fg": g:untitled_cs#bg_lightest
\})
call s:hi("LineNr", {
  \ "fg": g:untitled_cs#bg_lighter
\})
call s:hi("SignColumn", {
  \ "fg": g:untitled_cs#bg_lighter
\})
call s:hi("FoldColumn", {
  \ "fg": g:untitled_cs#bg_lighter
\})
" }}}
" Sign {{{
call s:hi("YcmErrorSign", {
  \ "fg": g:untitled_cs#red
\})
" hi YcmWarningSign                   guifg=bg_lighter    guibg=NONE
" }}}
" Folds {{{
call s:hi("Folded", {
  \ "fg": g:untitled_cs#bg_lighter,
  \ "bg": g:untitled_cs#bg_light
\})
" }}}
" Pmenu {{{
call s:hi("Pmenu", {
  \ "bg": g:untitled_cs#bg_light
\})
call s:hi("PmenuSel", {
  \ "fg": g:untitled_cs#magenta,
  \ "bg": g:untitled_cs#bg_lighter
\})
call s:hi("PmenuSbar", {
  \ "fg": g:untitled_cs#magenta
\})
call s:hi("PmenuThumb", {
  \ "tr": "reverse"
\})
" }}}

" Highlights {{{
call s:hi(
  \ "Search",
  \ "IncSearch",
  \ "Visual",
  \ {
    \ "bg": g:untitled_cs#bg,
    \ "tr": "reverse"
\})
call s:hi("VisualNOS", {
  \ "bg": g:untitled_cs#white,
  \ "tr": "reverse"
\})
" }}}
" Syntax {{{
" See :h group-name
call s:hi("Comment", {
  \ "fg": g:untitled_cs#bg_lighter,
  \ "tr": "italic"
\})
" Constants {{{
call s:hi("Constant", {
  \ "fg": g:untitled_cs#yellow
\})
call s:hi("String", {
  \ "fg": g:untitled_cs#green_bold
\})
" Character
" Number
" Boolean
" Float
" }}}
" Identifiers {{{
call s:hi("Identifier", {
  \ "fg": g:untitled_cs#magenta
\})
call s:hi("Function", {
  \ "fg": g:untitled_cs#blue
\})
" }}}
" Satements {{{
call s:hi("Statement", {
  \ "fg": g:untitled_cs#magenta
\})
" Conditional
" Repeat
" Label
" Operator
" Keyword
" Exception
" }}}
" Preprocessor directives {{{
call s:hi("PreProc", {
  \ "fg": g:untitled_cs#magenta
\})
" Include
" Define
" Macro
" PreCondit
" }}}
" Types {{{
call s:hi("Type", {
  \ "fg": g:untitled_cs#magenta
\})
" StorageClass
" Structure
" Typedef
" }}}
" Special {{{
call s:hi("Special", {
  \ "fg": g:untitled_cs#red
\})
" SpecialChar
" Tag
" Delimiter
" SpecialComment
" Debug
" }}}
call s:hi("Error", {
  \ "bg": g:untitled_cs#red
\})
call s:hi("Todo", {
  \ "fg": g:untitled_cs#bg,
  \ "bg": g:untitled_cs#magenta
\})
" }}}
" Diff {{{
call s:hi("DiffAdd", {
  \ "fg": g:untitled_cs#green_bold,
\})
call s:hi("DiffChange", {
  \ "fg": g:untitled_cs#blue,
\})
call s:hi("DiffDelete", {
  \ "fg": g:untitled_cs#red_bold,
\})
call s:hi("DiffText", {
  \ "fg": g:untitled_cs#blue,
\})
" }}}
" Spell {{{
call s:hi(
  \ "SpellBad",
  \ "SpellCap",
  \ "SpellLocal",
  \ "SpellRare",
  \ {
    \ "bg": g:untitled_cs#red,
    \ "tr": "reverse,underline"
\})
" }}}
" Other groups {{{
call s:hi("Conceal", {
  \ "fg": g:untitled_cs#bg_light
\})
call s:hi("SpecialKey", {
  \ "fg": g:untitled_cs#bg_light
\})
call s:hi("NonText", {
  \ "fg": g:untitled_cs#bg_lighter
\})
call s:hi("Directory", {
  \ "fg": g:untitled_cs#yellow
\})
" }}}

" Custom groups {{{
" Match all operators in character class, and "/" except in comments ("//",
" "/*", "*/"). A negative lookahead in vim's regex is "\@!", a negative
" lookbehind is "\@<!".
" See :h perl-patterns
autocmd Syntax * syn match OperatorChars "[=+\-!<>|&?^~%:]\|\(\/\|*\)\@<!\/\(\/\|*\)\@!"
call s:hi("OperatorChars", {
  \ "fg": g:untitled_cs#magenta
\})
" Matches all numeric literals, including prefixes and suffixes
" Up to 3 suffix characters because of c++11 unsigned long long ("ull", "LLu",
" etc.).
autocmd Syntax * syn match NumericLiteral "\(0[xXbB]\)\=[0-9]\+\.\=[fFlLuU]\{,3}"
call s:hi("NumericLiteral", {
  \ "fg": g:untitled_cs#yellow
\})
" }}}
