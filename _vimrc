execute pathogen#infect()

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set langmenu=en_NZ.UTF-8
let $LANG = 'en_NZ'
" don't switch to Japanese keyboard on insert
set iminsert=0
set imsearch=-1
" change keyboard: ctrl + ^

filetype on
syntax on
set guifont=Fixedsys\ Regular:h18
set termguicolors     " enable true colors support
let ayucolor="mirage"  " light mirage dark
colorscheme ayu "two-firewatch
set background=light "light or dark
set guifont=Fixedsys:h10
set lines=35 columns=130
set lines=35 columns=150
set colorcolumn=90
set number
set hidden
set history=100
filetype indent on
set nowrap
set cursorline
set tabstop=4
set softtabstop=4
set shiftwidth=2
set expandtab " tabs are spaces
set smartindent
set autoindent
set incsearch
set hlsearch
set showmatch " show matching parenthesis
set wildmenu " visual autocomplete for command menu

let mapleader=" "
map <leader>s :source ~/Vim/.vimrc<CR>
nmap <leader>hlp :e ~/.vimrc<CR> "open help file

autocmd BufWritePre * :%s/\s\+$//e

nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" reopen previously opened file
nnoremap <Leader><Leader> :e#<CR>

autocmd vimenter * NERDTree "open NERDTree automatically

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

