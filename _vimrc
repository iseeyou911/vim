autocmd!

let VIM_TMP_FOLDER = glob("~/.vimtmp")

if !isdirectory(VIM_TMP_FOLDER)
    call mkdir(VIM_TMP_FOLDER, "p", 0700)
endif

set udf
let &udir=VIM_TMP_FOLDER
let &dir=VIM_TMP_FOLDER
set guifont=Consolas:h12
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
syntax enable
set encoding=utf-8
set backupcopy=yes
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set ff=unix
filetype plugin indent on
set noerrorbells visualbell t_vb=

call plug#begin(glob($HOME . '/vimfiles/plugged'))
Plug 'git://github.com/jiangmiao/auto-pairs.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'moll/vim-node'
Plug 'https://github.com/prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json'] }
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/HerringtonDarkholme/yats.vim.git'
Plug 'https://github.com/Valloric/YouCompleteMe.git'
Plug 'https://github.com/ap/vim-css-color.git'
Plug 'https://github.com/w0rp/ale.git'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-repeat.git'
Plug 'https://github.com/tmhedberg/matchit.git'
Plug 'SirVer/ultisnips'
call plug#end()

set background=dark
colorscheme solarized

let g:project_use_nerdtree = 1
let g:typescript_indent_disable = 1

let g:prettier#config#single_quote = 'true'
let g:prettier#config#tab_width = 4

let g:airline#extensions#ale#enabled = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
let g:ale_completion_enabled = 0
let g:ale_sign_column_always = 1
let g:ale_set_balloons = 0
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'typecheck'],
\}
let g:UltiSnipsSnippetDirectories = [glob('~/UltiSnips'), 'UltiSnips']
let g:UltiSnipsExpandTrigger="<c-tab>"

set completeopt-=preview
set wildignore+=*/node_modules/*,*.so,*.swp,*.zip 
set backspace=indent,eol,start
let NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode = 2

if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
let g:ycm_show_diagnostics_ui = 0

nmap <leader><leader>nt :NERDTreeFocus<CR>
nmap <c-j> <c-w>j
nmap <c-h> <c-w>h
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <leader>b :CtrlPBuffer<CR>

autocmd BufLeave,VimLeave *.js,*.jsx,*.ts,*.tsx,*.json :update
autocmd BufEnter *.tsx set filetype=typescript
autocmd BufEnter *.scss set tabstop=2 shiftwidth=2
autocmd VimEnter * :NERDTree

if !exists(":Explr")
    command Explr :silent ! start explorer "%:p:h"
endif
