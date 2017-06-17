source ~/.config/nvim/plugins.vim

" Section General {{{

set nocompatible 	    " Use vim settings, rather then vi settings
set autoread            " detect when a file is changed


" }}}

" Section Theme and colors {{{

" Themes and colors

syntax on
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" make comments and HTML attributes italic
highlight Comment cterm=italic
highlight htmlArg cterm=italic
highlight xmlAttrib cterm=italic
highlight Normal ctermbg=none

" Vim airline
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'
" Always show statusline
set laststatus=2

"}}}

" Section Editor UI {{{

" Braces
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
set wildmenu
set wildmode=list:longest,full

" Scroll
set scrolloff=5 " Always lead with n lines

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Whitespace
set list
set listchars=tab:▸\ ,eol:¬

" Wrap
set nowrap
set textwidth=79
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
