" Instantiate plugin manager
execute pathogen#infect()
syntax on
filetype plugin indent on
set nocompatible

" Tab settings
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Unix file format
set ffs=unix,dos,mac

" Toggle paste mode for insert
set pastetoggle=<F4>

" color scheme
colorscheme desert
set background=dark

" Performance improvement
" set lazydraw 

" Show matching [({})]
set showmatch

" Pop up menu
set wildmenu
set wildignore+=*.o,*.obj,*.pyc,*.DS_STORE,*.db,*.swc

set noerrorbells " No sound on errors
set novisualbell " No sound on errors

" Configure backspace
set backspace=indent,eol,start " Backspace into previous line
set whichwrap+=<,>,h,l

" Make \s turn on/off trailing whitespace
set listchars=tab:>-,trail:·,extends:>,precedes:<,nbsp:_,eol:$
nmap <silent> <leader>s :set nolist!<CR>

set title             " Update the terminal title
set scrolloff=3       " More context around scrolling
set sidescrolloff=5   " More context around scrolling horizontally
set ruler             " Show on-screen position
set showcmd           " Show (partial) command in status line

set ttyfast           " High bandwidth editing more for performance
set shell=bash        " Use the right shell

" Keyboard mapping
nore ; :

" Editing
set history=1000

" Buffers moving between buffers
map <C-j> :bprev<CR>
map <C-k> :bnext<CR>
map <Leader>a :A<CR>
map <Leader>l :b#<CR>
map <Leader>k :Bclose<CR>
map <Leader>K :Bclose!<CR>
set hidden " Allow moving between buffers with file changes

" highlight last inserted
noremap gV `[v`]

" Toggle search highlighting
noremap <F3> :set hlsearch!<CR>

" Minibuffer explorer
map <Leader>b :MBEToggle<CR>

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
" "set viminfo^=%

" Delete trailing white space on save, useful for Python, C, C++
func! DeleteTrailingWS()
  exe "normal mz"
    %s/\s\+$//ge
      exe "normal `z"
      endfunc
      autocmd BufWrite *.pyx :call DeleteTrailingWS()
      autocmd BufWrite *.py :call DeleteTrailingWS()
      autocmd BufWrite *.cpp :call DeleteTrailingWS()
      autocmd BufWrite *.hpp :call DeleteTrailingWS()
      autocmd BufWrite *.c :call DeleteTrailingWS()
      autocmd BufWrite *.h :call DeleteTrailingWS()

" Super undo
nnoremap <leader>u :GundoToggle<CR>

" Edit vimrc \ev
nnoremap <silent> <Leader>ev :e $MYVIMRC<CR>

" Directory browsing
nnoremap <silent> <Leader>d :NERDTreeToggle<CR>
nnoremap <silent> <Leader>r :NERDTreeFind<CR>

" CtrlP settings
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

