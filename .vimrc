""""""""""""""""""""""""""""""""""""""""""
"                                        "
"   Michael Oselskyi's Personal .vimrc   "
"      Last Updated: 10.07.2017          "
"               v.1.0                    "
"                                        "
""""""""""""""""Header""""""""""""""""""""
set nocompatible 
source $VIMRUNTIME/vimrc_example.vim
source ~/.vimrc-sources/.abbreviations.vim
source ~/.vimrc-sources/.mappings.vim
set mouse=""
set expandtab
set hidden
execute pathogen#infect()
""""""""""""""""""""""""""""""""""""""""""
"                                        "
"              Color Stuff               "
"                                        "
"                                        "
""""""""""""""""""""""""""""""""""""""""""
" Set colorscheme

let &t_Co=256
syntax enable
set background=dark
"colo lettuce
 colo monokai
"colo lucius "choices include: LuciusDark,
"LuciusDarkHighContrast,
"LuciusDarkLowContrast,LuciusBlack,
"LuciusBlackHighContrast, 
"LuciusBlackLowContrast,
"LuciusDarkLowContrast
""""""""""""""""""""""""""""""""""""""""""
"                                        "
"      Feel, Look, and Visual Stuff      "
"                                        "
"                                        "
""""""""""""""""""""""""""""""""""""""""""
" Prettier line wrap
set textwidth=80 " Set colorcolumn
"au BufWinEnter * let w:m2=matchadd('ErrorMsg','\%>80v.\+',-1)
set showbreak=⇇

" set number width for line numbers
set numberwidth=1
set cpoptions+=n
set nu
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
"autocmd filetype html,xml set listchars-=tab:>. " prevents the above code being
"    " shown in html and xml
set pastetoggle=<F2> " 'Paste mode' when pasting from outside sources.

""""""""""""""""""""""""""""""""""""""""""
"                                        "
"             VIM Behaviour              "
"                                        "
"                                        "
""""""""""""""""""""""""""""""""""""""""""
" set :Q to :qall
"command Q qall
" Search
set autoindent "Auto-indent on"
set ignorecase 
set hlsearch " Highlight search terms.
set incsearch " Show search terms as you type.
set title

" Clears the highlighting after word.
nmap <silent> <leader>/ :nohlsearch<CR>

" Default shell and shell syntax
set shell=bash
let g:is_bash=1
"Autoreload vimrc
if has ('autocmd') " Remain compatibble with earlier versions
  augroup vimrc " Source vim config upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

" Auto setfiletype for .less, .block, etc.
autocmd BufNewFile, BufReadPost *.less set filetype=css
autocmd BufNewFile, BufReadPost *.region, *.block, *.list, *.item set filetype=html
autocmd BufNewFile, BufReadPost *.conf set filetype=conf

" relative toggle
function! NumberToggle()
  if(&relativenumber==1)
    set nornu
  else
    set relativenumber
  endif
endfunc

noremap <C-n> :call NumberToggle()<cr>
au FocusLost * :set nornu
au FocusGained * :set rnu
autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu

" Spell checker
" set spell

""""""""""""""""""""""""""""""""""""""""""
"                                        "
"                Plugins                 "
"                                        "
"                                        "
""""""""""""""""""""""""""""""""""""""""""
" NERDTree stuff
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p



"" Stuff for latex-suite
"REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" " can be called correctly.
set shellslash
"
" " IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" " OPTIONAL: This enables automatic indentation as you type.
filetype indent on
"
" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


" this is mostly a matter of taste. But LaTeX looks good with just a bit
" " of indentation.
set sw=2
" " TIP: if you write your \label's as \label{fig:something}, then if you
" " type in \ref{fig: and press <C-n> you will automatically cycle through
" " all the figure labels. Very useful!
set iskeyword+=:

if has('autocmd')
  autocmd filetype python set expandtab
endif
