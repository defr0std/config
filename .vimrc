
colorscheme jellybeans

set number relativenumber
set completeopt-=preview
set smartcase
set ignorecase
set incsearch
set hlsearch
set encoding=utf-8
set guicursor+=a:blinkon0
set cursorline
set autoread
set autowriteall

:let mapleader = "\<Space>"
imap jk <Esc>
nnoremap ;; $a;<Esc>
nnoremap <Leader>o o<ESC>
nnoremap <Leader>O O<ESC>
nnoremap <Leader>yf :let @+=expand("%")<CR>

nnoremap <Leader><TAB> :History<CR>
nnoremap <Leader>p :Files<CR>
nnoremap <Leader>fe :FindRg<Space>
nnoremap <Leader>fb :BLines<CR>

nnoremap <Leader>vf :NERDTreeFind<CR>
nnoremap <Leader>vd :YcmDiags<CR>
nnoremap <Leader>vo :GoogleOutlineWindow<CR>
nnoremap <Leader>vh :YcmCompleter GetDoc<CR>

nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
nnoremap gt :YcmCompleter GoToType<CR>;

nnoremap <Leader>rf :YcmCompleter FixIt<CR>
nnoremap <Leader>ri :YcmCompleter OrganizeImports<CR>
nnoremap <Leader>rr :YcmCompleter RefactorRename
nnoremap <Leader>rp :FormatCode<CR>

let g:ycm_key_list_stop_completion = [ '<C-y>', '<Enter>' ]
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

if executable('rg')
  set grepprg=rg\ --color=never\ --vimgrep
  let $FZF_DEFAULT_COMMAND = 'rg
    \ '. projectdirs. '
    \ --files --hidden --follow --glob ""'

  command! -bang -nargs=*
    \ FindRg call fzf#vim#grep('
    \ rg --column --line-number --no-heading --hidden --follow --color "always"
    \ '.shellescape(<q-args>). '
    \ '. projectdirs. '
    \ ', 1, <bang>0)
endif

" Persistent undo
let undo_dir=$HOME.'/.vim/undo'
if !isdirectory(undo_dir)
  call mkdir(undo_dir, 'p')
endif
set undofile
let &undodir=undo_dir

" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
if &term == 'xterm-256color' || &term == 'screen-256color'
  let &t_SI = "\<Esc>[6 q"
  let &t_EI = "\<Esc>[2 q"
endi
