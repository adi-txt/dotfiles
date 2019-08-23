set tabstop=2 "tab length
set softtabstop=2 "tab length
" set shiftwidth=2 "shift length
set showtabline=2 "show tab dif
set expandtab "spaces are tabs
set number "line numbers
set cursorline "highlight current line
set nowrap "remove auto wrap
set hlsearch "highlight search
set incsearch "highlight search
set noswapfile "avoid swap files
set nobackup "avoid swap files

" Set column to light grey at 80 characters
 if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight CursorColumn ctermbg=248 guibg=Grey
 endif

augroup indentation_sr
  autocmd!
  autocmd Filetype * setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=8
  autocmd Filetype python setlocal shiftwidth=4 softtabstop=4 tabstop=8
  autocmd Filetype yaml setlocal indentkeys-=<:>
augroup END

" Plugins:
call plug#begin('~/.local/share/nvim/plugged')

Plug 'bronson/vim-trailing-whitespace' " Trailing whitespace
Plug 'itchyny/lightline.vim' " Status line / tab line plugin for Vim
Plug 'mhinz/vim-startify' " Fancy start screen
Plug 'wincent/terminus' " Enhanced terminal integration
Plug 'henrik/vim-indexed-search' " Indexed search
Plug 'hdima/python-syntax' " Python syntax
Plug 'PyCQA/pyflakes' " Python testing
Plug 'vim-syntastic/syntastic' " Syntax checker
Plug 'Townk/vim-autoclose' " Autoclose brackets, etc.
Plug 'pangloss/vim-javascript' " Vim JS
Plug 'godlygeek/tabular' " Markdown plugin
Plug 'plasticboy/vim-markdown' " Markdown plugin
Plug 'junegunn/limelight.vim' " highlight text
Plug 'junegunn/goyo.vim' " Distraction-free writing
Plug 'junegunn/seoul256.vim' " Seoul color scheme
Plug 'hynek/vim-python-pep8-indent' "python indentation
Plug 'Yggdroot/indentLine' "indentation
Plug 'lervag/vimtex' " LaTeX support
Plug 'junegunn/rainbow_parentheses.vim' " lol
Plug 'scrooloose/nerdtree' " file system explorer
Plug 'machakann/vim-highlightedyank' " make yanked region apparent
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown', 'on': 'MarkdownPreview' }
Plug 'w0rp/ale' " Asynchronous linter
Plug 'evanleck/vim-svelte' " svelte highlights

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

call plug#end()

"enable deoplete
let g:deoplete#enable_at_startup = 1

" nerdtree auto-open when no file is specified with vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Goyo Limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Search result highlighting courtesy of @pappasam
set incsearch
augroup sroeca_incsearch_highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" Rainbow Parentheses:
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]
augroup rainbow_settings
  " Section to turn on rainbow parentheses
  autocmd!
  autocmd BufEnter,BufRead * :RainbowParentheses
  autocmd BufEnter,BufRead *.html,*.css,*.jsx,*.js :RainbowParentheses!
augroup END

" Python:

" highlighting
let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1

" Highlight self and cls keyword in class definitions
augroup python_syntax
  autocmd!
  autocmd FileType python syn keyword pythonBuiltinObj self
  autocmd FileType python syn keyword pythonBuiltinObj cls
augroup end

" JavaScript: plugin edits
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" Key Mappings:

" Set up Alt+Left and Alt+Right to move between tabs
nnoremap <A-Left> :tabprevious<CR>
nnoremap <A-Right> :tabnext<CR>

" Set up TAB to move between tabs
noremap <TAB> <C-W>w

" Set up control+right to unfold all folds
noremap <C-z> zO

" Easy copy paste between tmux panes with vim for Mac
noremap ç "+y
noremap √ "+p

" Trying copy paste for Linux
map <A-c> "+y<CR>
map <A-v> "+p<CR>

" open NERDTree with Ctrl+t
map <C-t> :NERDTreeToggle<CR>

" open Goyo mode
map <C-g> :Goyo <CR>

" Autocompletion popup navigation
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr> <C-r> pumvisible() ? "\<C-p>" : "\<C-r>"

" Seoul256 Settings:
try
  set t_Co=256 " says terminal has 256 colors
  " Unified color scheme (default: dark)
  let g:seoul256_background = 233
  colo seoul256
  " Switch
  set background=dark

catch
endtry

" Lightline Settings:
" Color theme to match vim theme
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

