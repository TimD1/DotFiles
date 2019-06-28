hi clear

let g:colors_name = "custom"

hi Normal     						ctermfg=255  		ctermbg=232
hi Cursor     						ctermfg=bg     		ctermbg=fg
hi lCursor    						ctermfg=NONE   		ctermbg=Cyan

hi DiffAdd    						ctermfg=83			ctermbg=NONE
hi DiffChange 						ctermfg=190			ctermbg=NONE
hi DiffDelete 						ctermfg=160			ctermbg=NONE
hi DiffText   	cterm=bold			ctermfg=190			ctermbg=NONE

hi Directory  						ctermfg=DarkBlue	   
hi ErrorMsg   						ctermfg=White	   	ctermbg=DarkRed  
hi FoldColumn 						ctermfg=DarkBlue	ctermbg=Grey     
hi Folded     						ctermfg=DarkBlue 	ctermbg=DarkBlue 
hi IncSearch  	cterm=reverse	   
hi ModeMsg    	cterm=bold	   
hi MoreMsg    						ctermfg=DarkGreen    
hi NonText    						ctermfg=Blue	   
hi PmenuSel   						ctermfg=White	   	ctermbg=DarkBlue  
hi Question   						ctermfg=DarkGreen    
if &background == "light"
    hi Search     					ctermfg=NONE		ctermbg=Yellow 
else
    hi Search     					ctermfg=Black		ctermbg=Yellow 
endif
hi SpecialKey 						ctermfg=DarkBlue	   
hi StatusLine 	cterm=bold	   		ctermfg=yellow 		ctermbg=blue 
hi StatusLineNC	cterm=bold	   		ctermfg=black 		ctermbg=blue  
hi Title      						ctermfg=DarkMagenta  
hi VertSplit  	cterm=reverse	   
hi Visual     	cterm=reverse							ctermbg=NONE
hi VisualNOS  	cterm=underline,bold 
hi WarningMsg 						ctermfg=DarkRed	   
hi WildMenu   						ctermfg=Black	  	ctermbg=Yellow    

"SYNTAX HIGHLIGHTING
"basic appearance
hi Comment    	cterm=italic		ctermfg=241
hi LineNr     	cterm=NONE 			ctermfg=58
 
"c++ preprocessor
hi PreProc    	cterm=NONE 			ctermfg=160
hi Define		cterm=NONE			ctermfg=161
hi Macro		cterm=NONE			ctermfg=163

"code data types
hi Constant   	cterm=NONE 			ctermfg=145
hi String		cterm=NONE			ctermfg=129
hi Character	cterm=NONE			ctermfg=125
hi Number		cterm=NONE			ctermfg=147
hi Boolean		cterm=NONE			ctermfg=76	

"code control flow
hi Type	      	cterm=NONE 			ctermfg=63
hi Statement  	cterm=NONE 			ctermfg=214
hi Conditional 	cterm=NONE 			ctermfg=214
hi Function		cterm=NONE			ctermfg=248

"LaTeX math environment
hi Delimiter	cterm=NONE			ctermfg=196
hi Operator		cterm=NONE			ctermfg=198
hi Special    	cterm=NONE 			ctermfg=201

"other, unused
hi Directory	cterm=NONE			ctermfg=63
hi Identifier 	cterm=NONE 			ctermfg=77
