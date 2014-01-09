"
" Functions
"

"" Add runtime path
function! s:addRuntimePath(path)
  if has('vim_starting')
    execute 'set runtimepath+=' .a:path
  endif
endfunction


"
" General settings
"

"" File encodings
set fileencodings=utf-8,iso-2022-jp,euc-jp,ascii

"" Indents
set shiftwidth=2
set tabstop=2
set expandtab
set nowrap
set autoindent
set smartindent
set smarttab

"" Show line numbers and set the width
set number
set numberwidth=5

"" Show vim title for a window
set title
"set titlestring=HELLOWORLD

"" Show command in status line
set showcmd

"" Do not create backup and swap files
set noswapfile
set nobackup

"" Enable incremental search
set incsearch

"" Set command line height
set cmdheight=1

"" Incompatible with Vi
set nocompatible


"
" General settings for GVim
"

"" Specify a font and set its size for GVim
set guifont=Monospace\ 8



"
" Color scheme
"
colorscheme desert
syntax on

"" Cursor
set cursorline
set cursorcolumn
hi CursorLine cterm=NONE ctermbg=004 ctermfg=255 guibg=024 guifg=white
hi CursorColumn cterm=NONE ctermbg=002 ctermfg=255 guibg=024 guifg=white


"
" NERDTree settings
"

"" Start NERDTree when entering vim automatically
au VimEnter * NERDTree

"" Let NERDTree show hidden files
let NERDTreeShowHidden=1


"
" NeoBundle settings
"
call s:addRuntimePath('~/.vim/bundle/neobundle.vim/')
call neobundle#rc(expand('~/.vim/bundle/'))

"" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

"" Installation
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'scrooloose/nerdtree'

"" Let vim identify depending on a file type
filetype plugin indent on

"" Installation check
NeoBundleCheck


"
" NeoComplcache settings
"

"" Use NeoComplcache at startup
let g:neocomplcache_enable_at_startup = 1

"" Use smart case
let g:neocomplcache_enable_smart_case = 1

"" Set minimum syntax keyword length
let g:neocomplcache_min_syntax_length = 5
