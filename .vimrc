"
" .vimrc - Vim configuration file
"
" @rev    G-0.5.2
" @update 2014-1-17
" @author Saneyuki Tadokoro <saneyan@mail.gfunction.com>
"
" Key bindings (Leader key is commma):
" [Normal mode]
"   Leader » t » n Switch next tab
"   Leader » t » p Switch previous tab
"   Leader » t » e Open a new tab
"   Leader » w » v Split window vertically
"   Leader » w » h Split window horizontally
"   Leader » w » q Quit current window
"   Leader » c      Toggle cursor highlighting
"   Leader » d      Toggle NERDTRee
"   Leader » n      Lanch NERDTree
"   Leader » m      Lanch OverCommandLine
"
" [Insert mode]
"


"""""""""""""""""""""""""""""""""""
" Local functions
"

"" Add runtime path
function! s:addRuntimePath(path)
  if has('vim_starting')
    execute 'set runtimepath+=' .a:path
  endif
endfunction

"" Load and fetch plugins for NeoBundle
function! s:initPlugins(conf)
  let l:fetch = get(a:conf, 'fetch', [])
  let l:load = get(a:conf, 'load', [])

  "" Fetch plugins
  for l:val in l:fetch
    execute 'NeoBundleFetch "' .l:val .'"'
  endfor

  "" Load plugins
  for l:val in l:load
    execute 'NeoBundle "' .l:val .'"'
  endfor
endfunction


"""""""""""""""""""""""""""""""""""
" General settings
"

"" Tab stops
let s:tabstops = 2

"" Change leader key
let mapleader = ","

"" File encodings
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,ascii
set fileformats=unix,mac,dos

"" Indent and tab
execute 'set shiftwidth=' .s:tabstops
execute 'set tabstop=' .s:tabstops
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

"" Enable cursor highlighting
set cursorline
set cursorcolumn


"""""""""""""""""""""""""""""""""""
" General settings for GVim
"

"" Specify a font and set its size for GVim
set guifont=Monospace\ 8


"""""""""""""""""""""""""""""""""""
" Color scheme
"
colorscheme desert
syntax on


"""""""""""""""""""""""""""""""""""
" Tab settings
"
nnoremap <silent> <Leader>tn :tabnext<CR>
nnoremap <silent> <Leader>tp :tabprevious<CR>
nnoremap <silent> <Leader>to :tabnew<CR>


"""""""""""""""""""""""""""""""""""
" Window and buffer settings
"
nnoremap <silent> <Leader>wv :vsp<CR>
nnoremap <silent> <Leader>wh :sp<CR>
nnoremap <silent> <Leader>wq :q<CR>

" Set list characters
set list
set listchars=tab:┊\ ,trail:-,extends:<,precedes:<,eol:¬,nbsp:%

"Colorize special keys
highlight SpecialKey term=underline ctermfg=024 guifg=darkgray

"" convert spaces to tabs when reading file
execute 'autocmd bufreadpost * set noexpandtab | retab! ' .s:tabstops

"" convert tabs to spaces before writing file
execute 'autocmd bufwritepre * set expandtab | retab! ' .s:tabstops

"" convert spaces to tabs after writing file (to show guides again)
execute 'autocmd bufwritepost * set noexpandtab | retab! ' .s:tabstops


"""""""""""""""""""""""""""""""""""
" Cursor settings
"
hi CursorLine cterm=NONE ctermbg=002 ctermfg=255 guibg=024 guifg=white
hi CursorColumn cterm=NONE ctermbg=024 ctermfg=255 guibg=024 guifg=white

augroup CursorLine
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave,BufWinLeave * setlocal nocursorline
augroup END

augroup CursorColumn
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
  au WinLeave,BufWinLeave * setlocal nocursorcolumn
augroup END

"" Toggle cursor highlighting by using "\c"
nnoremap <silent> <Leader>c :setlocal cursorline! cursorcolumn!<CR>


"""""""""""""""""""""""""""""""""""
" NERDTree settings
"

"" Start NERDTree when entering vim automatically
au VimEnter * NERDTree

"" Let NERDTree show hidden files
let NERDTreeShowHidden=0

"" Toggle NERDTree
nnoremap <silent> <Leader>d :NERDTreeToggle<CR>

"" Lanch NERDTree
nnoremap <silent> <Leader>n :NERDTree<CR>


"""""""""""""""""""""""""""""""""""
" Vim-over settings
"
nnoremap <silent> <Leader>m :OverCommandLine<CR>


"""""""""""""""""""""""""""""""""""
" Vim indent guides setting
"

"" For odd number of tabs
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#262626 ctermbg=255

"" For even number of tabs
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=255

"" Start vim-indent-guides automatically at startup
let g:indent_guides_enable_on_vim_startup=0


"""""""""""""""""""""""""""""""""""
" NeoBundle settings
"
call s:addRuntimePath('~/.vim/bundle/neobundle.vim/')
call neobundle#rc(expand('~/.vim/bundle/'))

call s:initPlugins({
  \ 'fetch': [
  \   'Shougo/neobundle.vim'
  \ ],
  \ 'load': [
  \   'Shougo/neocomplcache',
  \   'scrooloose/nerdtree',
  \   'osyo-manga/vim-over',
  \   'nathanaelkane/vim-indent-guides'
  \ ]
  \})

"" Let vim identify depending on a file type
filetype plugin indent on

"" Installation check
NeoBundleCheck


"""""""""""""""""""""""""""""""""""
" NeoComplcache settings
"

"" Use NeoComplcache at startup
let g:neocomplcache_enable_at_startup = 1

"" Use smart case
let g:neocomplcache_enable_smart_case = 1

"" Set minimum syntax keyword length
let g:neocomplcache_min_syntax_length = 5
