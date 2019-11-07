call plug#begin('~/.vim/plugged')

runtime .vimrc_workspace

runtime .vimrc_general
runtime .vimrc_ui
runtime .vimrc_texteditm
runtime .vimrc_searchreplace
runtime .vimrc_lsp
runtime .vimrc_lang

runtime .vimrc_local

call plug#end()

colorscheme gruvbox
