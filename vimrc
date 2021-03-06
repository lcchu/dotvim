if $SHELL =~ 'bin/fish'
  set shell=/bin/zsh
endif
set nocompatible    " be iMproved(not vi mode)
filetype off    " required! for Vundle

" Setting up Vundle - the vim plugin bundler
"---Let Vundle manage vundle: Vundle is a fancy vim plugin manager
"  help you easily manage(install, update, and remove) your 
"  vim plugin(or so-called bundle)
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" The following line is required! for Vundle
Bundle 'gmarik/vundle'
filetype plugin indent on "required! for Vundle and completion function
" My Bundles here:
"
" original repos on github
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
"used for toggle compilation error window 
Bundle 'Valloric/ListToggle'
" vim-scripts repos
Bundle 'javacomplete'
"Bundle 'rubycomplete.vim'
Bundle 'ctags.vim'
Bundle 'vim-scripts/EasyGrep'
Bundle 'taglist.vim'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

" -----------------------------------------
" General Settings
" -----------------------------------------

" enable mouse on terminal
"set mouse=a

" set <leader> to ','
let mapleader=","
let g:mapleader=","

" Use the damn hjkl keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

" enable the cmd+v to do 'system-copy' in terminal-vim
vmap <C-c> y:call system(“pbcopy”, getreg(“\”“))<CR>

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost vimrc source ~/.vimrc

set nocompatible	" not compatible with the old-fashion vi mode
"set nu	                " show the line number; use [set nonu] to close;
" use [set rnu] to show relative line number
set bs=2		" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside
set linespace=2         " a taller line
set nowrap              " never auto change to next line
set paste               " can use <Cmd>+v to paste in vim
set number

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo

syntax on	        " use syntax

filetype on             " Enable filetype detection
filetype indent on      " Enable filetype-specific indenting
filetype plugin on      " Enable filetype-specific plugins

set t_Co=256            " 256 color mode
set background=dark    " another is 'light', change this will affect colorscheme
colorscheme railscasts  " colorschem setting: solarized_dark, railscasts, distinguished
highlight CursorLine guibg=#003853 ctermbg=24  gui=none cterm=none
set cursorline          " highlight current line
set invcursorline
" ---- Mainly for MacVim ----
if has("gui_running")	" GUI color and font settings
  colorscheme codeschool  " My colorschem setting
  set guifont=Monaco:h20
  set cursorline       " highlight current line
  " make transparent(for macvim)
  set transparency=15
  "set guioptions=aAce
  set guioptions=aAce
  " macvim window size
  set lines=32
  set columns=128
endif
" ---------------------------

set wildchar=<TAB>      " when type command, use <tab> to do completion
set wildmenu
set showmatch
set showmode 

" ignore these files while expanding wild chars
set wildignore=*.o,*.a,*.class,*.pyc

set autoindent		" auto indentation
set smartindent     " a improvement of autoindent
set copyindent		" copy the previous indentation on autoindenting
set incsearch		" incremental search
set nobackup		" no *~ backup files
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,
" case-sensitive otherwise

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" TAB setting{
set tabstop=2
set softtabstop=2	" the default tab space size=2
set shiftwidth=2	" the default autoindenting space size=2
set expandtab	    " replace <TAB> with spaces
set smarttab		" insert tabs on the start of a line according to context

au FileType Makefile set noexpandtab
"}

"--------------------------------------------------------------------------- 
" USEFUL SHORTCUTS
"--------------------------------------------------------------------------- 

" select ALL
map <leader>a ggVG
" for copy from another source, like `pbcopy`
"" when paste from other source, do not auto comment or {} 
nmap <leader>p <Esc>:set paste<CR>
nmap <leader>np <Esc>:set nopaste<CR>
" open the error console
nmap <leader>cc :botright cope<CR> 
" move to next error
nmap <leader>] :cn<CR>
" move to the prev error
nmap <leader>[ :cp<CR>
" show the current line by underlined cursor
nmap <leader>i <Esc>:set invcursorline<CR>

" Bash like keys for the command line
cmap <C-A> <Home>
cmap <C-E> <End>
cmap <C-K> <C-C>:

" buffer switching key binding
nmap gb :bn<CR>
nmap gB :bp<CR>

" split window key binding
nmap gw :wincmd w<CR>
nmap gW :wincmd W<CR>
"
" Tab pages key binding
" new tab
map gn :tabnew<CR>
" close tab
map gc :tabclose<CR> 
" go to next tab (default gt)
"map gt :tabn<CR>
" go to previous tab (default gT)
"map gT :tabp<CR>
map g1 :tabn 1<CR>
map g2 :tabn 2<CR>
map g3 :tabn 3<CR>
map g4 :tabn 4<CR>
map g5 :tabn 5<CR>
map g6 :tabn 6<CR>
map g7 :tabn 7<CR>
map g8 :tabn 8<CR>
map g9 :tabn 9<CR>
map g0 :tabn 10<CR>

"--------------------------------------------------------------------------- 
" PROGRAMMING SHORTCUTS
"--------------------------------------------------------------------------- 

" { } completement
autocmd FileType java,c,cpp,ruby,javascript imap {<CR> {<CR><END><CR>}<UP><END>

" Enable omni completion. (default: <C-X><C-O>; my:<C-X><C-X>)
inoremap <C-X><C-X> <C-X><C-O><C-P>
if has("autocmd")
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType html,javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  "autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  "autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  "autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  "autocmd FileType c setlocal omnifunc=ccomplete#Complete
  "autocmd Filetype java setlocal omnifunc=javacomplete#Complete
  "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
endif
let b:classpath="./*"
" ### the following is deprecated because YCM(YouCompleteMe) plugin already ###
" ### implement the function ###
" in MacVim, when type '.' show the omni complete list
"autocmd Filetype java,javascript,jsp inoremap <buffer>  .  .<C-X><C-O><C-P><down>

"----------------------------------------------------------------------- 
" ENCODING SETTINGS
"----------------------------------------------------------------------- 
set encoding=utf-8                                  
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun! ViewUTF8()
  set encoding=utf-8                                  
  set termencoding=big5
endfun

fun! UTF8()
  set encoding=utf-8                                  
  set termencoding=big5
  set fileencoding=utf-8
  set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
  set encoding=big5
  set fileencoding=big5
endfun

"----------------------------------------------------------------------- 
" PLUGINS
"-----------------------------------------------------------------------

" --- YCM(YouCompleteMe) & eclim---
" *** usage: use C-X C-X or C-<space> to trigger the completion ***
" the flowing line enable YCM to do powful C++ completion funtionality
" by loading cpp completion model
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
" If you prefer the completion tip window to close when a selection is
" made, these followint lines close it on movement in insert mode or
" when leaving insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:ycm_semantic_triggers =  {
      \   'c' : ['->', '.'],
      \   'objc' : ['->', '.'],
      \   'ocaml' : ['.', '#'],
      \   'cpp,objcpp' : ['->', '.', '::'],
      \   'perl' : ['->'],
      \   'php' : ['->', '::'],
      \   'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
      \   'ruby' : ['.', '::'],
      \   'lua' : ['.', ':'],
      \   'erlang' : [':'],
      \   'html' : ['.'],
      \ }
" The following is for eclim, This will make YCM and Eclim play nice; YCM will
" use Eclim's omnifuncs as the data source for semantic completions and
" provide the auto-triggering and subsequence-based matching (and other YCM
" features) on top of it.
let g:EclimCompletionMethod = 'omnifunc'
" -------------------------

" --- ListToggle ----------
let g:lt_location_list_toggle_map = '<leader>w'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10
" -------------------------

" --- NERDTree & NERDTreeTabs----
" don't open nerdtree_tabs when gvim/macvim open; otherwise, 0
let g:nerdtree_tabs_open_on_gui_startup = 0
" NERDTreeTabsToggle bind to <F2>
map <F2> <Esc>:NERDTreeTabsToggle<CR>
" NERDTreeToggle bind to <F2>
"map <F2> :NERDTreeToggle<CR>
"map <leader>n :NERDTreeTabsToggle<CR>
" -------------------------

" --- ctrlp ---------------
"set runtimepath^=~/.vim/bundle/ctrlp.vim
map <leader>e <Esc>:CtrlP<CR>
" -------------------------

" --- ctags ---------------
" !!!Make sure use <F5> before change to source root dir!!!-----
" use <F5>(means:new tags) to generate a file 'tags', which originally 
" should be generate by command `ctags -R` at (src/project) root dir
map <F5> :call Do_NewTags()<CR>
set tags=~/.vim/bundle/ctags/tags;
" use a new tab to trace tag
" nmap <C-]> viwy:tab tag <C-R>"<CR>

function! Do_NewTags()
  " delete the current tags in the dir 
  if filereadable("~/.vim/bundle/ctags/tags")
    let tagsdeleted=delete("~/.vim/bundle/ctags/"."tags")
    if(tagsdeleted!=0)
      echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
      return
    endif
  endif

  " generate a new tag files to ~/.vim/ctags/tags
  if(executable('ctags'))
    "silent! execute '!ctags -R --c-types=+p --fields=+S *'
    exec "!ctags -R --c++-kinds=+lpx --java-kinds=+l --fields=+iaS --extra=+q -f $HOME/.vim/bundle/ctags/tags `pwd`"
  endif
endfunction
" -------------------------

" --- taglist -------------
let Tlist_Use_Horiz_Window=0
let Tlist_Use_Right_Window=1    " window is show at right-side
let Tlist_Show_One_File=1       " only show current file's tags
let Tlist_File_Fold_Auto_Close=1 "files' tags are folded except current one
let Tlist_Sort_Type="name"      " tags will be sorted by name; default is by occurence
let Tlist_Exit_OnlyWindow=1     " exit vim when taglist is the last window
nmap <F3> : call Do_Tlist_Toggle()<CR>
function! Do_Tlist_Toggle() 
  TlistToggle
  TlistUpdate
endfunction
" -------------------------

" --- EasyGrep ------------
" <leader>vv - Grep for the word under the cursor
" <leader>va - Like vv, but add to existing list
" <leader>vo - Select the files to search in and set grep options
" <Leader>vr - Perform a global search search on the word under the cursor
"              and prompt for a pattern with which to replace it.
map <leader>vf <esc>:Grep 
let g:EasyGrepRecursive = 1
let g:EasyGrepCommand = 1
let g:EasyGrepIgnoreCase = 1


"------------------------
" Self-Defined Function--
" -----------------------
" auto add python header when edit a new blank .py files
function! PyHeader()
  if getfsize(@%) <= 0
    execute "norm i#!/usr/bin/env python\n# -*- coding: utf-8 -*-\n"
  endif
endfunction
au BufRead,BufNewFile *.py call PyHeader()


"-------------------------------
" Execute file based on filetype
"-------------------------------
function! ExecuteFile()
  let filetype_to_command = {
  \   'cpp': '!make',
  \   'python': '!python',
  \ }
  let cmd = get(filetype_to_command, &filetype, &filetype)
  if &filetype == "cpp"
    execute cmd
  elseif &filetype == "python"
    execute cmd shellescape(@%, 1)
  endif
endfunction
nnoremap <buffer> <F9> :call ExecuteFile()<cr>

