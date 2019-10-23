
colorscheme tender

set autoread
set autowriteall
set background=dark
set completeopt-=preview
set cursorline
set encoding=utf-8
set guicursor+=a:blinkon0
set hlsearch
set ignorecase
set incsearch
set mouse=a
set number relativenumber
set ruler
set smartcase
set splitright
set splitbelow

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

:let mapleader = "\<Space>"
imap jk <Esc>

noremap <Leader>j ^
noremap <Leader>k $

" Seamlessly treat visual lines as actual lines when moving around.
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>
nnoremap <Tab> <C-w>w

nnoremap ;; $a;<Esc>
nnoremap <Leader>o o<ESC>
nnoremap <Leader>O O<ESC>
nnoremap <Leader>yf :let @+=expand("%")<CR>

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

nnoremap * *``
nnoremap <silent><expr> <Leader>* (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

nnoremap <Leader><TAB> :History<CR>
nnoremap <Leader>` :History:<CR>
nnoremap <Leader>p :Files<CR>
nnoremap <Leader>fe :FindRg<Space>
nnoremap <Leader>fb :BLines<CR>

nnoremap <Leader>vf :NERDTreeFind<CR>
nnoremap <Leader>vd :YcmDiags<CR>
nnoremap <Leader>vo :GoogleOutlineWindow<CR>
nnoremap <Leader>vh :YcmCompleter GetDoc<CR>
nnoremap <silent> <Leader>vc :call QuickFix_toggle()<CR>

nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
nnoremap gt :YcmCompleter GoToType<CR>

nnoremap <Leader>rf :YcmCompleter FixIt<CR>
nnoremap <Leader>ri :YcmCompleter OrganizeImports<CR>
nnoremap <Leader>rr :YcmCompleter RefactorRename<Space>
nnoremap <Leader>rp :FormatCode<CR>

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>s :%s///g<Left><Left>
" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>s :s///g<Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:strip_whitespace_confirm=0
let g:strip_whitespace_on_save=1
let g:ycm_key_list_stop_completion = [ '<C-y>', '<Enter>' ]
let g:ycm_max_num_candidates=10
let g:ycm_filetype_blacklist = {
      \ 'tagbar': 1,
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'netrw': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'gitcommit': 1,
      \ 'hgcommit': 1,
      \ 'mail': 1
      \}
let g:airline#extensions#tabline#enabled = 1

if executable('rg')
  set grepprg=rg\ --color=never\ --vimgrep
  let $FZF_DEFAULT_COMMAND = 'rg
    \ '. projectdirs. '
    \ --files --hidden --follow --glob ""'

  command! -bang -nargs=*
    \ FindRg call fzf#vim#grep('
    \ rg --column --line-number --no-heading --hidden --follow --color "always"
    \ --smart-case
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

" Toggle quickfix window.
function! QuickFix_toggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    copen
endfunction
