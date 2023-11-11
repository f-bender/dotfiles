" use relative line numbers
set number
set relativenumber
" always show at least 8 lines before and after the cursor (short: so)
set scrolloff=8
" indent using 4 spaces, no tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
" horizontal ruler after 120 characters
set colorcolumn=120

" make cursor look right in Windows Terminal in WSL, see https://github.com/microsoft/terminal/issues/4335#issuecomment-706499666
if &term =~ '^xterm'
  " enter vim
  autocmd VimEnter * silent !echo -ne "\e[1 q"
  " oherwise
  let &t_EI .= "\<Esc>[1 q"
  " insert modle
  let &t_SI .= "\<Esc>[5 q"
  " 1 or 0 -> blinking block
  " 2 -> solid block
  " 3 -> blinking underscore
  " 4 -> solid underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
  " leave vim
  autocmd VimLeave * silent !echo -ne "\e[5 q"
endif

" this is supposed to make e.g. LSP hints appear faster (not applicable for me right now)
" set updatetime=50

" doesn't seem to work in WSL ubuntu, but should incrementally highlight search result matches
set incsearch

" use the spacebar as the leader key
let mapleader = " "

" exit insert/visual mode by Ctrl+L which is more easily reachable than Ctrl+C
inoremap <C-l> <Esc>
vnoremap <C-l> <Esc>
cnoremap <C-l> <C-c>

" Center on cursor after jump
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzz
nnoremap N Nzz

" Courtesy of ThePrimeagen (https://youtu.be/w7i4amO_zaE?t=1537): move selected lines down/up with J/K (like Alt+Down/Up in VS Code)
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" keep location of cursor when merging lines
nnoremap J myJ`y

" nobody likes Q
nnoremap Q <nop>

" replace ALL instances of the current word
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Single leader: delete without overwriting register
nnoremap <leader>c "_c
nnoremap <leader>x "_x
nnoremap <leader>d "_d
vnoremap <leader>c "_c
vnoremap <leader>x "_x
vnoremap <leader>d "_d
vnoremap <leader>p "_dP
" Double leader: use system register
nnoremap <leader><leader>p "+p
vnoremap <leader><leader>p "+p
nnoremap <leader><leader>P "+P
vnoremap <leader><leader>P "+P
nnoremap <leader><leader>y "+y
vnoremap <leader><leader>y "+y

