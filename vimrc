" set indentation
filetype indent on
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4

" set default line numbering
set relativenumber
set number

" press CTL+N to remove numbering (easy copy-paste)
function! NumberToggle()
	if (&relativenumber == 1 && &number == 1)
		set norelativenumber
		set nonumber
	else
		set relativenumber
		set number
	endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" set my colorscheme, adjust to filetype
set t_Co=256
syntax on
set background=dark
colorscheme custom
autocmd BufNewFile,BufRead *.cuh set syntax=cuda
autocmd BufNewFile,BufRead *.cu set syntax=cuda

" set comment string based on file type
autocmd FileType python set commentstring=#\ %s
autocmd FileType matlab set commentstring=#\ %s
autocmd FileType sh set commentstring=#\ %s
autocmd FileType tex set commentstring=%\ %s
autocmd FileType bib set commentstring=%\ %s
autocmd FileType html set commentstring=<!--\ %s\ -->
autocmd FileType php set commentstring=<!--\ %s\ -->

" set color of 80th column as reminder for line break
set colorcolumn=81
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

" set gitgutter preferences
set updatetime=100
"let g:gitgutter_override_sign_column_highlight = 0


" execute plugin manager
execute pathogen#infect()
