filetype plugin indent on
syntax on
colo peachpuff
" set pythondll="C:\Program Files\Python39\libs\python39.lib"
" let &pythonthreedll='C:\Program Files\Python39\libs\python37.lib'
" let &pythonthreehome='C:\Program Files\Python39'

if has('win32')
    set shell=powershell
    set shellcmdflag=-command
else
    set shell=zsh
endif
    
set undofile
set dir=~/.vimtmp/
set backupdir=~/.vimtmp/
set undodir=~/.vimtmp/

" set shellcmdflag=-command
"set laststatus=2
set nocompatible
set backspace=2
set autoread        " 修改后自动载入
set autowrite        " Automatically save before commands like :next and :make
set encoding=utf-8
set modelines=0
set backup
set hidden        " Hide buffers when they are abandoned
set history=1000
"indent
set autoindent
set smartindent
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
"---navigation"
set showcmd        " Show (partial) command in status line.
set showmode
set scrolloff=10               "10 lines when navigating
set showmatch        " Show matching brackets.
set splitright
"--search--"
set incsearch        " Incremental search
set ignorecase        " Do case insensitive matching
set smartcase        " Do smart case matching
set nohlsearch



set listchars=tab:›\ ,trail:•,extends:#,nbsp:.


"open on last time
au bufreadpost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au FocusLost * silent! wa

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"--------start----mapping------------------

"-----HARD--Mode!----"
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>


let mapleader = ","
inoremap <leader>h <LEFT>
inoremap <leader>l <RIGHT>
nnoremap <leader>w <C-w>v<C-w>l

nnoremap <leader>q :vert copen30<CR>
execute "set <A-a>=\<esc>a"
nnoremap <A-a> :AsyncRun grep -RiIn 

"F6 line number
nnoremap <F6> :set nonumber!<CR>

" execute "set <A-CR>=\<esc>\<cr>"

" cabbrev h vert help


nnoremap ; :

"--------start---vim-plug------------------
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
if !empty($TMUX)
    Plug 'christoomey/vim-tmux-navigator'
endif
" Plug 'Yggdroot/LeaderF'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'skywind3000/asyncrun.vim'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp'  }
" Plug 'PProvost/vim-ps1', {'for': 'ps1'}
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'universal-ctags/ctags'
" Plug 'dense-analysis/ale'
" Plug 'ycm-core/YouCompleteMe'
" Plug 'neoclide/coc.nvim'

call plug#end()
"--------end-----vim-plug------------------
"let g:airline_statusline_ontop=1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'

"-------vim-cpp-enhanced-highlight--------
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1


let g:Lf_ShortcutF = '<C-P>'
let g:Lf_WindowHeight = 0.20
let g:Lf_ReverseOrder = 1

"----------gutentags-------------
" let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
" let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

let g:airline#extensions#ale#enabled = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1
let g:ale_list_vertical = 1

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" " if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
let g:ale_completion_enabled = 1


" -----------filetype--mapping------------------
au bufread,bufnewfile *.tex call LaTeX()
au bufread,bufnewfile *.tpp set filetype=cpp
au BufRead,BufNewFile *.note call Note()
au BufRead,BufNewFile *.cpp call Cpp()

func! Test()
    echo "yes"
endfu


func! Cpp()
     " vert copen30
    " let g:asyncrun_open=30
    " cabbrev copen vert copen
    nnoremap <A-CR> :AsyncRun -save=2 make<CR>
endfu

func! LaTeX()
    "inoremap <buffer> <C-h> <LEFT>
    "inoremap <buffer> <C-l> <RIGHT>

    inoremap .sec \section{}<CR>
    inoremap .enu \begin{enumerate}[(a)]<CR>\item<TAB><C-o>o\end{enumerate}<UP><C-o>A
    inoremap .itm \begin{itemize}<CR>\item<TAB><C-o>o\end{itemize}<UP><C-o>A
    inoremap 44 $$<LEFT>
    vnoremap 44 c$$<C-c><LEFT>p
    inoremap _ _{}<LEFT>
    inoremap ^ ^{}<LEFT>
    inoremap .fr \frac{}{}<LEFT><LEFT><LEFT>
    inoremap .Ri \Rightarrow
    inoremap .ri \rightarrow
    inoremap .LR \Leftrightarrow
    call Math()
    nnoremap <A-CR> :AsyncRun -save=2 pdflatex -halt-on-error -file-line-error %<CR>
endfu

func! Math()
    inoremap .ali \begin{equation*}\begin{aligned}<CR>t<BS><C-o>o\end{aligned}\end{equation*}<UP><C-o>A
    inoremap .mtr <C-o>I\begin{equation*}<CR>t<BS><C-o>0\begin{bmatrix}<CR>t<BS><CR>\end{bmatrix}<CR>\end{equation*}<UP><UP><C-o>A
    inoremap .bg{ \left\{<CR>\begin{array}{ll}<CR>t<BS><c-o>o\end{array}<CR>\right.<UP><C-O>A
    inoremap .pfr \frac{\partial }{\partial }<C-c>11hi
    inoremap .dfr \frac{\diff }{\diff }<C-c>8hi
    inoremap .big \big<c-o>%\big
    inoremap .bb \mathbb{}<LEFT>
    inoremap .rm \mathrm{}<LEFT>
    inoremap .lms \limits_{}<LEFT>
    inoremap .lim \lim\limits_{}<LEFT>
    "inoremap .int \int\limits_{}<LEFT>
    inoremap .bcap \bigcap\limits_{}^{}<LEFT><LEFT><LEFT><LEFT>
    inoremap .bcup \bigcup\limits_{}^{}<LEFT><LEFT><LEFT><LEFT>
    inoremap .sum \sum\limits_{}^{}<LEFT><LEFT><LEFT><LEFT>
    inoremap {{ \{\}<LEFT><LEFT>
    inoremap ..a \alpha
    inoremap ..b \beta
    inoremap ..d \delta
    inoremap ..e \epsilon
    inoremap ..l \lambda
    inoremap ..m \mu
    inoremap ..o \omega
    inoremap ..8 \infty
    "inoremap <expr> <SPACE> SPACE_BeforeCurlybrace() ? '<RIGHT>' : '<SPACE>'
    func! SPACE_BeforeCurlybrace()
        let l:line = getline(".")
        let l:next_char = l:line[col(".")-1]
        if l:next_char == '}' || l:next_char == ')'|| l:next_char == ']'
            return 1
        else
            return 0
        endif
    endfu
endfu

func! Note()
    "movement changes
    map <buffer>j gj
    map <buffer>k gk
    "formatting text
    setlocal formatoptions=1
    setlocal formatprg=par
    setlocal wrap
    setlocal linebreak
    "spelling and thesaurus
    setlocal spell spelllang=en_us,cjk
    "complete+=s makes autocompletion search the thesaurus
    setlocal complete+=s
endfu

