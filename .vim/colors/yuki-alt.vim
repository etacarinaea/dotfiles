set background=dark

set t_Co=256
let g:colors_name = "yuki-alt"

hi CursorLine   cterm=NONE ctermbg=Black
hi CursorLineNr ctermfg=NONE ctermbg=Black

hi DiffAdd      ctermbg=LightBlue
hi DiffChange   ctermbg=LightMagenta
hi DiffDelete   ctermfg=Blue        ctermbg=LightCyan
hi DiffText     ctermbg=Red     cterm=bold
hi Directory    ctermfg=DarkBlue
hi ErrorMsg     ctermfg=White       ctermbg=DarkRed
hi FoldColumn   ctermfg=DarkBlue    ctermbg=Grey
hi Folded       ctermbg=Grey        ctermfg=DarkBlue
hi IncSearch    cterm=reverse
hi LineNr       ctermfg=NONE        ctermbg=NONE
hi ModeMsg      cterm=bold
hi MoreMsg      ctermfg=DarkGreen
hi NonText      ctermfg=Blue
hi PmenuSel     ctermfg=White       ctermbg=DarkBlue
hi Question     ctermfg=DarkGreen

hi Search       cterm=reverse
hi SpecialKey   ctermfg=DarkBlue
hi StatusLine   cterm=bold      ctermbg=233 ctermfg=yellow
hi StatusLineNC cterm=bold      ctermbg=233 ctermfg=black
hi Title        ctermfg=DarkMagenta
hi VertSplit    cterm=reverse
hi Visual       ctermbg=NONE        cterm=reverse
hi VisualNOS    cterm=underline,bold
hi WarningMsg   ctermfg=DarkRed
hi WildMenu     ctermfg=Black       ctermbg=Yellow

hi Comment      cterm=NONE ctermfg=238
hi Constant     cterm=NONE ctermfg=DarkRed
hi Identifier   cterm=NONE ctermfg=DarkCyan
hi PreProc      cterm=NONE ctermfg=DarkMagenta
hi Special      cterm=NONE ctermfg=LightRed
hi Statement    cterm=bold ctermfg=Yellow
hi Type         cterm=NONE ctermfg=DarkRed

hi SignColumn         ctermbg=Black
hi SyntasticErrorSign ctermbg=Black
hi SyntasticWarningSign ctermbg=Black
hi SyntasticStyleErrorSign ctermbg=Black
hi SyntasticStyleWarningSign ctermbg=Black
