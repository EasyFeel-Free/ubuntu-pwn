

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plug {{{
call plug#begin('~/.config/nvim/plugged')

"Python
Plug 'scrooloose/nerdTree' "Documents tree
Plug 'davidhalter/jedi-vim' "python autocompletion SYNTAX: Shift+K(open pydoc) 
Plug 'tpope/vim-fugitive' "git integration SYNTAX (:G git status) (:Gwrite git add file) (:Gcommit -m 'hello') (:Gpush) (:Gpull)
Plug 'airblade/vim-gitgutter'	"Git appear in file change
Plug 'scrooloose/syntastic' "code syntaxis (syntax check error warning show message)
Plug 'Raimondi/delimitMate' "automatic closing of quotes, parenthesis...
Plug 'yggdroot/indentline' "Show indent lines (useful for loops)
Plug 'tmhedberg/SimpylFold' "Python folding
Plug 'vim-airline/vim-airline' "Colorful tabline
Plug 'vim-airline/vim-airline-themes'
Plug 'ervandew/supertab' "<Tab> for code completion
"Search in current folder
"Switch between file
"Press: Ctrl+p
Plug 'ctrlpvim/ctrlp.vim'    "Finder for vim


Plug 'mhinz/vim-startify' "Beautiful vim start screen
"Auto Complete "", {} , ''
"Plug 'jiangmiao/auto-pairs'	
"Comment easy
"Example comment 2 line in insertmode only:
"press: 2\cc
Plug 'scrooloose/nerdcommenter'

"Motion go to the character
"Pree : \s
"Input character u want to go to
"Input which line
Plug 'easymotion/vim-easymotion'
call plug#end()
" }}}
"
"For Plug vim-gitgutter
set updatetime=100

"For easymotion
map <Leader> <Plug>(easymotion-prefix)

"For NErdTree
"Press ctrl+e to open
map <C-e> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree  "Auto init nerdtree
"autocmd StdinReadPre * let s:std_in=1 "Auto init in vim only not vim file.txt
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif "like above
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif "Executing vim ~/some-directory will open NERDTree and a new edit window
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "close vim if the only window left open nerd tree

"For syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_aggregate_errors = 1  "enabled multiple checkers for the current filetype. How can I display all errors from all checkers together?
"let g:syntastic_quiet_messages = { "type": "style" } "disable all style messaage

"For SimpyFold
let g:SimpylFold_docstring_preview = 1
"Enable folding with the spacebar
nnoremap <space> za 

"For vim-airlinethemes
let g:airline_theme='base16_snazzy'

"For ctrp 
"Search buffer  with ctrl +b
"map <c-b> :CtrlPBuffer 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme desert
catch
endtry

set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

"Tab key mapping
map <Tab> gt
map <S-Tab> gT

" Linebreak on 500 characters
"set lbr
"set tw=500<Paste>


set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"Folding
"Fold open 1
nmap fo zO
"Fold close 1
nmap fc zC
"Fold open all
nmap f zR
"Fold close all
nmap ff zM
""""""""""""""""""""'
"SYNTAX
"""""""""""""""
"git
":G
":Gwrite
":Gcommit -m "message"
":Gpush
":Gpull

"Folding
"space

"Tree exploer
"Ctrl + e

"Completion
"Tab

"Find file
"Ctrl + p

"Comment
"\number + cc
"example 2 comment : \2cc

"Goto
"\s + character
"and choose character location
"example \sT - and a
