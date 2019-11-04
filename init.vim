call plug#begin('~/.vim/plugged')

source ~/.vimrc_workspace

source .vimrc_general
source .vimrc_ui
source .vimrc_textedit
source .vimrc_searchreplace
source .vimrc_lsp
source .vimrc_lang

source .vimrc_google

call plug#end()

colorscheme gruvbox
