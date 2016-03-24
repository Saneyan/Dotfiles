function! TerminalMode()
  NERDTreeClose
  nnoremap <silent> <Leader>to :tabnew term://$SHELL <bar> startinsert<CR>
  terminal
endfunction
