""
" Add runtime path
" @param string path
"
function! AddRuntimePath(path)
  if has('vim_starting')
    execute 'set runtimepath+=' .a:path
  endif
endfunction

""
" Load dein plugins
" @param array conf
"
function! AddPlugins(conf)
  call dein#begin(expand('~/.cache/dein'))
  for l:val in a:conf
    if type(l:val) == type([])
      call dein#add(l:val[0], l:val[1])
    else
      call dein#add(l:val)
    endif
  endfor
  call dein#end()
endfunction

""
" Load and fetch plugins for NeoBundle
" @param array conf
"
function! InitPlugins(conf)
  let l:fetch = get(a:conf, 'fetch', [])
  let l:load = get(a:conf, 'load', [])

  call neobundle#begin(expand('~/.vim/bundle/'))
  "" Fetch plugins
  if l:fetch != []
    for l:val in l:fetch
      execute 'NeoBundleFetch "' .l:val .'"'
    endfor
  endif

  "" Load plugins
  for l:val in l:load
    if type(l:val) == type([])
      execute 'NeoBundle "' .l:val[0] .'", ' string(l:val[1])
    else
      execute 'NeoBundle "' .l:val .'"'
    endif
    unlet l:val
  endfor
  call neobundle#end()
endfunction
