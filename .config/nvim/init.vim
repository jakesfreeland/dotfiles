" vim config for efficient text editing

" --- OPTIONS ---
set title                   " responsive terminal title
set number                  " line numbers
set showtabline=2           " persistent tabline
set clipboard+=unnamed      " share macOS clipboard
set clipboard+=unnamedplus  " share BSD/Linux clipboard
runtime ftplugin/man.vim    " :Man pages in vim

" language specific
filetype plugin on          " language autocommands
syntax enable               " syntax highlighting

" tab formatting
set tabstop=4               " tabs equal four spaces
set shiftwidth=4            " indents match tab width
set autoindent              " automatic indentation

" text formatting
set nowrap                  " no line wrapping
set linebreak               " no breaks mid-word

" cursor
let &t_SI.="\e[5 q"         " line cursor in insert mode
let &t_EI.="\e[2 q"         " block cursor in other modes
set cursorline              " enable cursor line
set ttimeoutlen=5           " reduced key delay

" status bar
set laststatus=1            " status bar on split
set ruler                   " enable ruler
set ruf=%4(%p%%%)           " custom ruler format

" better search
set ignorecase              " default case insensitivity
set smartcase               " case sensitive when query contains case
set nohlsearch              " no persistent search highlight

" cmd mode
set wildmenu                " file completion menu
set wildignorecase          " case-insensitive pathname completion

" tmp files
set swapfile                            " enable swap files
set dir=$HOME/.cache/vim/swap           " specify swap dir
set undofile                            " enable undo files
set undodir=$HOME/.cache/vim/undo       " specify undo dir

" completion
filetype plugin on                      " language support
set omnifunc=syntaxcomplete#Complete    " pattern based completion

" --- MAPPINGS ---
let mapleader=' '
map ! :!

" tabs
map <Leader>t :tabedit<Space>
map <Leader><Tab> :tabn<CR>
map <Leader><S-Tab> :tabp<CR>
map <Leader>T <C-w>T

" search and replace
map <Leader>s :s//g<left><left>
map <Leader>S :%s//g<left><left>

" save files that require root
cmap w!! w !doas tee % > /dev/null <CR>

" --- AUTO COMMANDS ---
" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" set cursor to block on VimEnter
autocmd VimEnter * silent normal! :startinsert :stopinsert

" --- COLORS ---
hi TabLine cterm=none ctermfg=182 ctermbg=104
hi TabLineSel cterm=bold ctermfg=225 ctermbg=104
hi TabLineFill cterm=none ctermfg=none ctermbg=60
hi StatusLine cterm=italic ctermfg=225 ctermbg=none
hi StatusLineNC cterm=italic ctermfg=182 ctermbg=none
hi VertSplit cterm=none ctermfg=60 ctermbg=none
hi ModeMsg cterm=bold ctermfg=146 ctermbg=none
hi LineNr cterm=none ctermfg=146 ctermbg=none
hi CursorLine cterm=none ctermfg=none ctermbg=none
hi CursorLineNr cterm=none ctermfg=225 ctermbg=none
hi Pmenu cterm=none ctermfg=182 ctermbg=60
hi PmenuSel cterm=bold ctermfg=225 ctermbg=104

