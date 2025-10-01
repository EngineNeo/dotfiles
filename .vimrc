if exists('$TMUX')
  augroup TmuxRename
    autocmd!
    autocmd BufEnter,FocusGained * call system("tmux rename-window " . fnamemodify(expand('%:p:h'), ':t'))
  augroup END
endif

