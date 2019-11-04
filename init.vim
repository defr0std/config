  let root = expand('%:p:h')
  echo root
  echo $MYVIMRC
call plug#begin('~/.vim/plugged')

source ~/.vimrc_workspace

function! SourceLocal(relativePath)
  let root = expand('%:p:h')
  let fullPath = root . '/'. a:relativePath
  "exec 'source ' . fullPath
  "echo fullPath
endfunction

call SourceLocal('.vimrc_general')
call SourceLocal('.vimrc_ui')
call SourceLocal('.vimrc_textedit')
call SourceLocal('.vimrc_searchreplace')
call SourceLocal('.vimrc_lsp')
call SourceLocal('.vimrc_lang')

call plug#end()

colorscheme gruvbox
