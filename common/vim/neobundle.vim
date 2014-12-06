call AddRuntimePath('~/.vim/bundle/neobundle.vim/')
call InitPlugins({
  \ 'fetch': [
  \   'Shougo/neobundle.vim'
  \ ],
  \ 'load': [
  \   'Shougo/neocomplcache',
  \   'scrooloose/nerdtree',
  \   'osyo-manga/vim-over',
  \   'nathanaelkane/vim-indent-guides',
  \ ]
  \})

if !has('neovim') && system('dmgr has powerline-vim && echo -n "powerline"') == "powerline"
  || has('neovim') && system('dmgr has powerline-neovim && echo -n "powerline"') == "powerline"
  call InitPlugins({
  \ 'load': [
  \   'alpaca-tc/alpaca_powertabline',
  \   ['Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}]
  \ ]
  \})
endif
