source ~/.config/nvim/plugins.vim

" Section General {{{

set nocompatible   " Use vim settings, rather then vi settings
set autoread       " detect when a file is changed

filetype indent plugin on
syntax on

set clipboard:unnamed

" }}}

" Section Theme and colors {{{

" Themes and colors

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" make comments and HTML attributes italic
highlight Comment cterm=italic
highlight htmlArg cterm=italic
highlight xmlAttrib cterm=italic

highlight Search ctermfg=black
" Fix until https://github.com/chriskempson/base16-vim/issues/125
highlight Error ctermfg=white

" Tabs and other special chars
highlight SpecialKey ctermbg=none ctermfg=241
highlight NonText ctermbg=none ctermfg=241

set highlight+=N:DiffText             " make current line number stand out a little
"set highlight+=c:LineNr               " blend vertical separators with line numbers

" Vim airline
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'
" Always show statusline
set laststatus=2

"}}}

" Editor behaviour {{{

" Aux files
if exists('$SUDO_USER')
  set nobackup                                  " don't create root-owned files
  set nowritebackup                             " don't create root-owned files
else
  set backupdir+=~/.config/nvim/tmp/backup      " keep backup files out of the way
endif

if exists('$SUDO_USER')
  set noswapfile                                " don't create root-owned files
else
  set directory+=~/.config/nvim/tmp/swap//      " keep swap files out of the way
endif

if has('persistent_undo')
  if exists('$SUDO_USER')
    set noundofile                              " don't create root-owned files
  else
    set undodir+=~/.config/nvim/tmp/undo        " keep undo files out of the way
    set undofile                                " actually use undo files
  endif
endif

set updatecount=80                    " update swapfiles every 80 typed chars
set updatetime=2000                   " same as YCM

" Buffers
set hidden   " allows you to hide buffers with unsaved changes

" }}}

" Section Editor UI {{{

" Brackets
set showmatch
set mat=2

" Cursor
set cursorline

" Editing
set backspace=indent,eol,start

" Error Bells
set visualbell

" Folds
set foldmethod=syntax       " fold based on indent
set foldnestmax=10          " deepest fold is 10 levels
set nofoldenable            " don't fold by default
set foldlevel=1

" Indent
set autoindent
set smartindent

" Line Numbers
set relativenumber      " Show relative number
set number
set numberwidth=4

if has('mouse')
	set mouse=a
	" set ttymouse=xterm2
endif

" Menu
set noshowmode
set wildmenu
set wildmode=list:longest,full

" Meta
set shortmess+=I                      " no splash screen

" Scroll
set scrolloff=5 " Always lead with n lines

" Splits
if has('windows')
  set splitbelow                      " open horizontal splits below current window
endif

if has('vertsplit')
  set splitright                      " open vertical splits to the right of the current window
endif

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Whitespace
set list
set listchars=tab:▸\ ,eol:¬,trail:·

" Wrap
set nowrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=85
execute "set colorcolumn=" . join(range(100,335), ',')

" }}}

" Section Mappings {{{

" change the mapleader from \ to ,
let mapleader=","

" Map ; to :
nnoremap ; :

" Reload vim config
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>

" Better split
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Folds
noremap <space> za

" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Fuck myself hard
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" }}}

" Section Plugins {{{

" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

" Load vimtree on empty Vim
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if only has nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let loaded_netrwPlugin=1           
let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'
let NERDTreeRespectWildIgnore=1

let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" FZF
nmap <silent> <leader>f :FZF<cr>

let g:fzf_nvim_statusline = 0
let g:fzf_layout = { 'down': '~25%' }

" }}}

" vim:foldmethod=marker:foldlevel=0
" vim:syntax=vim
