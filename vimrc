" set indentation
filetype indent on
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start

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
nnoremap <c-n> :call NumberToggle()<cr>

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

" make gitgutter update more frequently
set updatetime=100

" set custom mappings for fugitive
nnoremap <leader>gd :Gdiff<cr>
nnoremap gdk :diffget //2<cr>
nnoremap gdj :diffget //3<cr>
nnoremap gdh :diffget //2<cr>
nnoremap gdl :diffget //3<cr>

" use lightline
set laststatus=2
set cmdheight=1
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" split-pane navigation remaps
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
set splitbelow
set splitright

" ulti-snips configuration
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsSnippetDirectories=["~/.vim/UltiSnips"]
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsListSnippets="<leader>l"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<leader>j"
let g:UltiSnipsJumpBackwardTrigger="<leader>k"

" execute plugin manager
execute pathogen#infect()
