colorscheme desert
syntax on

"hi CursorLine cterm=NONE ctermbg=003 ctermfg=000 guibg=024 guifg=white
"hi CursorColumn cterm=NONE ctermbg=022 ctermfg=000 guibg=024 guifg=white
hi CursorColumn cterm=NONE ctermbg=003 ctermfg=000 guibg=024 guifg=white
hi CursorLine cterm=underline ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

"" Colorize special keys
highlight SpecialKey term=underline ctermfg=024 guifg=darkgray

augroup CursorLine
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave,BufWinLeave * setlocal nocursorline
augroup END

augroup CursorColumn
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
  au WinLeave,BufWinLeave * setlocal nocursorcolumn
augroup END
