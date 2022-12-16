" n/vim configuration for efficient text editing

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
set tabstop=8               " tabs equal eight spaces
set shiftwidth=8            " indents match tab stop
set autoindent              " automatic indentation

" text formatting
set nowrap                  " no line wrapping
set linebreak               " no breaks mid-word

" multiplexing
set splitright              " vertical splits open on right
set splitbelow              " horizontal splits open on bottom

" cursor
let &t_SI.="\e[5 q"         " line cursor in insert mode
let &t_EI.="\e[2 q"         " block cursor in other modes
set cursorline              " enable cursor line
set ttimeoutlen=5           " reduced key delay

" status bar
set laststatus=1            " status bar on split
set ruler                   " enable ruler
set ruf=%=C%c\ %p%%         " custom ruler format
set shortmess-=S            " search position

" better search
set ignorecase              " default case insensitivity
set smartcase               " case sensitive when query contains case
set nohlsearch              " no persistent search highlight

" cmd mode
set wildmenu                " file completion menu
set wildignorecase          " case-insensitive pathname completion

" completion
filetype plugin on                      " language support
set omnifunc=syntaxcomplete#Complete    " pattern based completion

" tmp files
set swapfile
set dir=$XDG_STATE_HOME/vim/swap
set undofile
set undodir=$XDG_CACHE_HOME/vim/undo
set spellfile=$XDG_DATA_HOME/vim/spell/en.utf-8.add

" --- MAPPINGS ---
let mapleader=' '
map ! :!

" multiplexing
map <Leader><Return> :tabnew +term<CR>
tmap <Leader><Esc> <C-\><C-n>

" tabs
map <Leader>t :tabedit<Space>
map <Leader>T <C-w>T
map <Leader><Tab> :tabn<CR>
map <Leader><S-Tab> :tabp<CR>

" search and replace
map <Leader>s :s//g<Left><Left>
map <Leader>S :%s//g<Left><Left>

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

" --- LUA ---
if has("nvim")
lua require("lsp")
endif
