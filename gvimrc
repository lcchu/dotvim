if has("gui_macvim")
   " disable the original Cmd-T (open new tab)
   "macmenu &File.New\ Tab key=<nop>
   " map Cmd-T to the CommandT plugin
   "map <D-t> :CommandT<CR>
endif

set transparency=0
set t_Co=256            " 256 color mode
set background=dark    " another is 'light', change this will affect colorscheme
colorscheme twilight

