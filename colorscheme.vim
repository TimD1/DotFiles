hi clear

let g:colors_name = "custom"

" Normal should come first
hi Normal     guifg=Black  guibg=White
hi Cursor     guifg=bg     guibg=fg
hi lCursor    guifg=NONE   guibg=Cyan

" Note: we never set 'term' because the defaults for B&W terminals are OK
hi DiffAdd    ctermfg=10 ctermbg=LightBlue    guibg=LightBlue
hi DiffChange ctermbg=LightMagenta guibg=LightMagenta
hi DiffDelete ctermfg=Blue	   ctermbg=LightCyan gui=bold guifg=Blue guibg=LightCyan
hi DiffText   ctermbg=Red	   cterm=bold gui=bold guibg=Red
hi Directory  ctermfg=DarkBlue	   guifg=Blue
hi ErrorMsg   ctermfg=White	   ctermbg=DarkRed  guibg=Red	    guifg=White
hi FoldColumn ctermfg=DarkBlue	   ctermbg=Grey     guibg=Grey	    guifg=DarkBlue
hi Folded     ctermbg=Grey	   ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
hi IncSearch  cterm=reverse	   gui=reverse
hi ModeMsg    cterm=bold	   gui=bold
hi MoreMsg    ctermfg=DarkGreen    gui=bold guifg=SeaGreen
hi NonText    ctermfg=Blue	   gui=bold guifg=gray guibg=white
hi Pmenu      guibg=LightBlue
hi PmenuSel   ctermfg=White	   ctermbg=DarkBlue  guifg=White  guibg=DarkBlue
hi Question   ctermfg=DarkGreen    gui=bold guifg=SeaGreen
if &background == "light"
    hi Search     ctermfg=NONE	   ctermbg=Yellow guibg=Yellow guifg=NONE
else
    hi Search     ctermfg=Black	   ctermbg=Yellow guibg=Yellow guifg=Black
endif
hi SpecialKey ctermfg=DarkBlue	   guifg=Blue
hi StatusLine cterm=bold	   ctermbg=blue ctermfg=yellow guibg=gold guifg=blue
hi StatusLineNC	cterm=bold	   ctermbg=blue ctermfg=black  guibg=gold guifg=blue
hi Title      ctermfg=DarkMagenta  gui=bold guifg=Magenta
hi VertSplit  cterm=reverse	   gui=reverse
hi Visual     ctermbg=NONE	   cterm=reverse gui=reverse guifg=Grey guibg=fg
hi VisualNOS  cterm=underline,bold gui=underline,bold
hi WarningMsg ctermfg=DarkRed	   guifg=Red
hi WildMenu   ctermfg=Black	   ctermbg=Yellow    guibg=Yellow guifg=Black

"SYNTAX HIGHLIGHTING
"basic appearance
hi Comment    	cterm=italic	ctermfg=241  	guifg=gray
hi LineNr     	cterm=NONE 		ctermfg=58	   	guifg=brown
 
"c++ preprocessor
hi PreProc    	cterm=NONE 		ctermfg=161 	guifg=pink
hi Define		cterm=NONE		ctermfg=161		guifg=pink
hi Macro		cterm=NONE		ctermfg=161		guifg=pink

"code data types
hi Constant   	cterm=NONE 		ctermfg=145   	guifg=lightgray
hi String		cterm=NONE		ctermfg=128		guifg=purple
hi Character	cterm=NONE		ctermfg=126		guifg=lightpurple
hi Number		cterm=NONE		ctermfg=196		guifg=red
hi Boolean		cterm=NONE		ctermfg=76		guifg=green

"code control flow
hi Type	      	cterm=NONE 		ctermfg=63		guifg=blue
hi Statement  	cterm=NONE 		ctermfg=214		guifg=orange
hi Conditional 	cterm=NONE 		ctermfg=214		guifg=orange
hi Function		cterm=NONE		ctermfg=248 	guifg=lightgray

"LaTeX math environment
hi Delimiter	cterm=NONE		ctermfg=196		guifg=red
hi Operator		cterm=NONE		ctermfg=196		guifg=red
hi Special    	cterm=NONE 		ctermfg=196   	guifg=red

"other, unused
hi Directory	cterm=NONE		ctermfg=63		guifg=blue
hi Identifier 	cterm=NONE 		ctermfg=77   	guifg=green
