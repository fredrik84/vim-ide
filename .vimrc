if v:progname =~? "evim"
  finish
endif

set mouse-=a
set nocompatible
set backspace=indent,eol,start
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching


map Q gq

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("autocmd")
  "  filetype plugin indent on
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  augroup END
endif " has("autocmd")
execute pathogen#infect()
map <F3> :Tabular block<CR>

set pastetoggle=<F2>
map <F4> :NR<CR>
map <F5> :ALEToggle<CR>
filetype plugin on

so ~/.vim/delimitMate/test/_setup.vim
let delimitMate_expand_cr = 1
filetype indent plugin on

let g:lightline = {
      \   'colorscheme': 'jellybeans',
      \   'active': {
      \     'left': [ ['mode', 'filename', 'paste'], ['modified'] ],
      \     'right': [ ['lineinfo', 'percent', 'fileformat', 'fileencoding'], ['filetype'], [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ], ['gitbranch']]
      \   },
      \   'component_function': {
      \     'gitbranch': 'gitbranch#name'
      \   },
      \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"
set laststatus=2
set noshowmode
highlight ALEWarning ctermbg=DarkMagenta
highlight ALEError ctermbg=DarkRed
highlight ALEErrorSign ctermbg=DarkRed
highlight ALEWarningSign ctermbg=DarkMagenta
highlight BuftabLineFill ctermbg=DarkGray
highlight BuftabLineCurrent ctermfg=White ctermbg=DarkMagenta
highlight BuftabLineHidden ctermfg=LightGrey ctermbg=DarkCyan
let g:ale_set_highlights = 0
"let g:ale_linters = ['flake8']

set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
let g:ale_python_flake8_args="--ignore=E111,E302,E305,E501"
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */ansible/*.yaml set filetype=yaml.ansible
xnoremap <F6> :NR<CR>
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv
