" .vimrc file originally from http://www.vi-improved.org/vimrc.php

" Edited by Eric Wang

" pathogen.vim
execute pathogen#infect()
filetype plugin indent on

" Basics {

    set nocompatible        " turn off vi-compatible mode 
    set noexrc              " don't use local version of .(g)vimrc, .exrc
    "set background=dark     " blue shows much better
    syntax enable               " syntax highlighting on
    "set background=dark
    "let g:solarized_termcolors = 256  " New line!!
    "colorscheme solarized

    "let g:ctrlp_working_path_mode = 'ra'
    "let g:ctrlp_user_command = 'find %s -type f'  " use external tool to search
    let g:ctrlp_max_files=0  " no limit for files to scan
    let g:ctrlp_max_depth = 40 " set max depth
    let g:ctrlp_match_window = 'bottom,order:ttb'
    let g:ctrlp_switch_buffer = 0
    let g:ctrlp_working_path_mode = 0
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""' " if AG installed

    set nobackup
    set noswapfile
    
    set history=1000         " remember more commands and search history
    set undolevels=1000      " use many muchos levels of undo
    set wildignore=*.swp,*.bak,*.pyc,*.class
    "set title                " change the terminal's title
    "set visualbell           " don't beep
    "set noerrorbells         " don't beep

    set pastetoggle=<F2>     " paste toggle mode to avoid indentations

    " leader key
    let mapleader = ','

    set autoread
" }                                                                                       


" Vim UI {

"    set cursorcolumn        " highlight current column

    hi StatusLine ctermfg=green
    set cursorline
    set incsearch           " highlight as search phrase is typed
    set laststatus=2        " always show status line
    set linespace=0         " don't insert extra pixel lines between rows
    set listchars=tab:>-,trail:-    " show tabs and trailing
    set nostartofline       " leave cursor in current position
    "set number             " turn on line numbers
    set numberwidth=5       " 5 digits displayed for line numbers (0-99999)
    set report=0            " report anything changed with :...
    set ruler               " show current position along bottom
    set scrolloff=10        " keep 10 lines (top/bottom) in view for scope
    set showcmd             " show command being typed
    set showmatch           " show matching brackets
    set sidescrolloff=10    " keep 5 lines at size
    set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ %=[L%l,C%v]\ \ [%2p%%\ of\ %L]

    "              | | | | |           |              |    |   |   |       |          + total lines 
    "              | | | | |           |              |    |   |   |       + current % into file 
    "              | | | | |           |              |    |   |   + current column 
    "              | | | | |           |              |    |   + current line 
    "              | | | | |           |              |    + right align rest of status 
    "              | | | | |           |              +-- current filetype
    "              | | | | |           +-- current fileformat
    "              | | | | +-- preview flag in square brackets
    "              | | | +-- help flag in square brackets
    "              | | +-- readonly flag in square brackets
    "              | +-- modified flag in square brackets
    "              +-- full path to file in the buffer

" }


" Text Formatting/Layout {

    "set autoindent              " repeat current indent level in next line

    set cinoptions=l1           " indenting for switch cases
    filetype on
    set expandtab               " turn tabs into spaces...

    if has("autocmd")           " ... except in Makefiles
      au BufRead,BufNewFile Makefile* set noexpandtab
    endif

    "set smartindent             " guess indent level based on previous line
    "set formatoptions=rq        " insert comment leader on return, and

                                " let gq format comments
                                
    set ignorecase              " case insensitive
    set infercase               " cased inferred                                          
"    set nowrap                  " do not wrap line
    set smartcase               " if there are caps, go case-sensitive
    set shiftwidth=4            " auto-indent spacing with cindent, >>, <<, etc.
    "set softtabstop=4           " spaces a tab should be when hitting tab or backsp
    set tabstop=4               " real tabs are 4 spaces, shown with set list on
    nnoremap <F2> :set invpaste paste?<CR>
    set pastetoggle=<F2>
    set showmode

" }


" Folding {

    set foldenable              " turn on folding
    set foldmarker={,}          " fold C style code
    "set foldmethod=marker       " fold on marker
    set foldmethod=indent       " fold on indent
    set foldlevel=100           " don't autofold                                          
    set foldopen=block,hor,mark,percent,quickfix,tag    " these open folds

    

    function SimpleFoldTextPython() " {
            return getline(v:lnum)[0]==\"\\t\"
    endfunction " }

    function SimpleFoldText() " {
            return getline(v:foldstart).' '
    endfunction " }
    set foldtext=SimpleFoldTextPython()       " custom fold text function

"}


" GNU Screen {

    map ^[[1~ <Home>
    map ^[[4~ <End>
    imap ^[[1~ <Home>
    imap ^[[4~ <End>

"}


" Navigation {

    " Faster split traversal

    "map <C-J> <C-W>j<C-W>_
    "map <C-K> <C-W>k<C-W>_
    "map <C-H> <C-W>h<C-W>_
    "map <C-L> <C-W>l<C-W>_
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
    set splitbelow
    set splitright

    " Faster tab traversal

    map gj gt
    map gk gT


    " Error

"    cnoreabbrev W w
"    cnoreabbrev Q q
"    cnoreabbrev Wq wq
"    cnoreabbrev WQ wq

"}


" extra

if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
