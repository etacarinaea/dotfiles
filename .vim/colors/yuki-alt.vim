set background=dark

let g:colors_name = "yuki-alt"

hi CursorLine   cterm=NONE          ctermbg=Black
hi ColorColumn  ctermbg=Black
hi CursorLineNr ctermfg=NONE        ctermbg=Black

hi DiffAdd      ctermbg=LightBlue
hi DiffChange   ctermbg=LightMagenta
hi DiffDelete   ctermfg=Blue        ctermbg=LightCyan
hi DiffText     cterm=bold          ctermbg=Red
hi Directory    ctermfg=DarkBlue
hi Error        cterm=reverse       ctermbg=Black ctermfg=DarkRed
hi ErrorMsg     cterm=reverse       ctermbg=Black ctermfg=DarkRed
hi FoldColumn   ctermfg=240         ctermbg=Black
hi Folded       ctermfg=240         ctermbg=Black
hi IncSearch    cterm=reverse
hi LineNr       cterm=NONE          ctermfg=245         ctermbg=NONE
hi ModeMsg      cterm=bold
hi MoreMsg      ctermfg=DarkGreen
hi NonText      ctermfg=Blue
hi Question     ctermfg=DarkGreen

hi Pmenu        cterm=NONE          ctermfg=NONE        ctermbg=Black
hi PmenuSel     cterm=NONE          ctermfg=Red         ctermbg=Black

hi Search       cterm=reverse
hi SpecialKey   ctermfg=238
hi StatusLine   cterm=bold          ctermfg=Yellow      ctermbg=233
hi StatusLineNC cterm=bold          ctermfg=Black       ctermbg=233
hi Title        ctermfg=DarkMagenta
hi VertSplit    cterm=reverse       ctermfg=Black ctermbg=NONE
hi Visual       cterm=reverse       ctermbg=NONE
hi VisualNOS    cterm=underline,bold
hi WarningMsg   ctermfg=DarkRed     ctermbg=NONE
hi WildMenu     ctermfg=Black       ctermbg=Yellow

hi Comment      cterm=italic        ctermfg=245
hi Constant     cterm=NONE          ctermfg=Yellow
hi Identifier   cterm=NONE          ctermfg=DarkMagenta
hi PreProc      cterm=NONE          ctermfg=DarkMagenta
hi Special      cterm=NONE          ctermfg=LightRed
hi Statement    cterm=NONE          ctermfg=DarkMagenta
hi Type         cterm=NONE          ctermfg=DarkRed

hi SignColumn                       ctermbg=Black
hi SyntasticErrorSign               ctermbg=Black
hi SyntasticWarningSign             ctermbg=Black
hi SyntasticStyleErrorSign          ctermbg=Black
hi SyntasticStyleWarningSign        ctermbg=Black

hi SpellBad     cterm=underline ctermbg=NONE ctermfg=DarkRed
hi SpellCap     cterm=underline ctermbg=NONE ctermfg=DarkRed
hi SpellLocal   cterm=underline ctermbg=NONE ctermfg=DarkRed
hi SpellRare    cterm=underline ctermbg=NONE ctermfg=DarkRed


" Match all operators in character class, and "/" except in comments ("//",
" "/*", "*/"). A negative lookahead in vim's regex is "\@!", a negative
" lookbehind is "\@<!".
" See :h perl-patterns
autocmd Syntax * syn match OperatorChars "[=+\-!<>|&?^~%:]\|\(\/\|*\)\@<!\/\(\/\|*\)\@!"
" Matches all numeric literals, including prefixes and suffixes
" Up to 3 suffix characters because of c++11 unsigned long long ("ull", "LLu",
" etc.).
autocmd Syntax * syn match NumericLiteral "\(0[xXbB]\)\=[0-9]\+\.\=[fFlLuU]\{,3}"

hi OperatorChars    cterm=NONE      ctermfg=LightCyan
hi NumericLiteral   cterm=NONE      ctermfg=Yellow
