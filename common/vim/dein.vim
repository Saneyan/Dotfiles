if &compatible
  set nocompatible
endif

call AddRuntimePath('~/.vim/bundle/dein.vim')

call AddPlugins([
  \ 'Shougo/dein.vim',
  \ 'scrooloose/nerdtree',
  \ 'osyo-manga/vim-over',
  \ 'nathanaelkane/vim-indent-guides',
  \ 'elixir-lang/vim-elixir',
  \ 'leafgarland/typescript-vim',
  \ 'digitaltoad/vim-jade'
  \])

if has('nvim')
  call AddPlugins([
   \ 'Shougo/deoplete.nvim'
   \])
else
  call AddPlugins([
    \ 'Shougo/neocomplcache'
    \])
endif

if system('$HOME/bin/dmgr has "powerline" && echo -n "powerline"') == "powerline"
  call AddPlugins([
  \ 'alpaca-tc/alpaca_powertabline',
  \ ['Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}]
  \])
endif

"" Installation check
if dein#check_install()
  call dein#install()
endif
