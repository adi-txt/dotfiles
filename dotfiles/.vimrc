
syntax on
set tabstop=2 " tab length
set softtabstop=2 " tab length
set shiftwidth=2 " shift length
set showtabline=2 " show tab dif
set expandtab " spaces are tabs
set number " line numbers
set cursorline " highlight current line
set nowrap " remove auto wrap
set hlsearch " highlight search
set incsearch " search as characters are entered
set noswapfile " avoid swap files
set nobackup " avoid swap files
set showmatch " highlight matching

" Set column to light grey at 80 characters
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight CursorColumn ctermbg=248 guibg=Grey
endif

" Indentation settings
augroup indentation
  autocmd!
  autocmd Filetype * setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=8
  autocmd Filetype python setlocal shiftwidth=4 softtabstop=4 tabstop=8
  autocmd Filetype yaml setlocal indentkeys-=<:>
augroup END

" Search result highlighting
set incsearch
augroup incsearch_highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins:
call plug#begin('~/.local/share/nvim/plugged')

" Formatting
Plug 'bronson/vim-trailing-whitespace' " Trailing whitespace highlighted
Plug 'itchyny/lightline.vim' " Status line / tab line plugin for Vim
Plug 'Townk/vim-autoclose' " Autoclose brackets, etc.
Plug 'hynek/vim-python-pep8-indent' "python indentation
Plug 'Yggdroot/indentLine' "indentation
Plug 'w0rp/ale' " Asynchronous linter
Plug 'pappasam/vim-filetype-formatter' " text formatter
Plug 'machakann/vim-highlightedyank' " make yanked region apparent

" Other
Plug 'mhinz/vim-startify' " Fancy start screen
Plug 'wincent/terminus' " Enhanced terminal integration
Plug 'henrik/vim-indexed-search' " Indexed search
Plug 'PyCQA/pyflakes' " Python testing
Plug 'scrooloose/nerdtree' " file system explorer
Plug 'ryanoasis/vim-devicons' " dev icons
Plug 'psliwka/vim-smoothie' " smooth scrollin'

" Markdown plugins
Plug 'godlygeek/tabular' " Markdown plugin
Plug 'plasticboy/vim-markdown' " Markdown plugin
Plug 'dkarter/bullets.vim' " Bullets in markdown
Plug 'iamcco/markdown-preview.nvim', {
      \ 'do': ':call mkdp#util#install()',
      \ 'for': 'markdown',
      \ 'on': 'MarkdownPreview'
      \ }

" Jenkinsfile syntax
Plug 'vim-scripts/groovyindent-unix'
Plug 'martinda/Jenkinsfile-vim-syntax'

" Shoutout @junegunn
Plug 'junegunn/limelight.vim' " highlight text (for Goyo)
Plug 'junegunn/goyo.vim' " Distraction-free writing
Plug 'junegunn/seoul256.vim' " Seoul color scheme
Plug 'junegunn/rainbow_parentheses.vim' " lol
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy finder
Plug 'junegunn/fzf.vim' " Vim-specific stuff for fzf

" Plant UML
Plug 'weirongxu/plantuml-previewer.vim' " Preview Plant UML diagrams
Plug 'tyru/open-browser.vim' " Direct dependency of plantuml-previewer.vim

" Syntax highlighting
Plug 'vim-syntastic/syntastic' " Syntax checker
Plug 'pangloss/vim-javascript' " JS syntax highlighting
Plug 'lervag/vimtex' " LaTeX syntax highlighting
Plug 'hdima/python-syntax' " Python syntax highlighting
Plug 'evanleck/vim-svelte' " Svelte syntax highlighting
Plug 'rust-lang/rust.vim' " Rust syntax highlighting
Plug 'aklt/plantuml-syntax' " Plant UML syntax highlighting
Plug 'leafgarland/typescript-vim' " Typescript syntax highlighting
Plug 'peitalin/vim-jsx-typescript' " Jsx in Typescript syntax highlighting
Plug 'MaxMEllon/vim-jsx-pretty' " Jsx styling

" Autocompletion
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

let g:deoplete#enable_at_startup = 1

Plug 'git@github.com:pappasam/typescript-vim.git', {
    \ 'branch': 'INDENT_CORRECTLY_MULTILINE_GENERICS',
    \ }

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TypeScript settings
augroup typescript_syntax
  autocmd!
  autocmd ColorScheme * highlight link typescriptExceptions Conditional
augroup end

" Make sure JS files are actually JS. The new plugin recognizes all files as JS
autocmd BufNewFile,BufRead,BufEnter *.jsx,*.js set filetype=javascript

" Fix 'comments' for typescript. Fixes the >>>>> bug for generics.
autocmd FileType typescript.tsx,typescript
      \ setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://

" If you want to keep vim-jsx-pretty, but use vim-jsx-typescript for
" typescript.tsx:
let g:vim_jsx_pretty_disable_tsx = v:true


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim filetype formatter settings
let g:vim_filetype_formatter_commands = {
      \ 'javascript.jsx': g:filetype_formatter#ft#formatters['javascript']['prettier'],
      \ 'typescript': g:filetype_formatter#ft#formatters['javascript']['prettier'],
      \ 'typescript.tsx': g:filetype_formatter#ft#formatters['javascript']['prettier'],
      \ }

" Required for operations modifying multiple buffers like rename
set hidden


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language client settings
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ 'typescript': ['npx', 'typescript-language-server', '--stdio'],
    \ 'typescript.tsx': ['npx', 'typescript-language-server', '--stdio'],
    \ 'svelte': ['svelteserver'],
    \ }
let g:LanguageClient_autoStart = 1
let g:LanguageClient_hoverPreview = 'Auto'
let g:LanguageClient_diagnosticsEnable = 0

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree settings
" nerdtree auto-open when no file is specified with vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo.vim settings
" Goyo Limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bullets.vim settings
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other group settings
augroup Markdown
  autocmd!
  autocmd Filetype markdown set wrap linebreak nolist
augroup END

augroup tsx_recognition
  autocmd!
  autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python: settings
" highlighting
let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1

" Highlight self and cls keyword in class definitions
augroup python_syntax
  autocmd!
  autocmd FileType python syn keyword pythonBuiltinObj self
  autocmd FileType python syn keyword pythonBuiltinObj cls
augroup end


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JavaScript: plugin edits
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Preview wrapper function for Plant UML and Markdown:
function! _Preview()
  if &filetype ==? 'plantuml'
    exec 'PlantumlOpen'
  elseif &filetype ==? 'markdown'
    exec 'MarkdownPreview'
  else
    exec 'Preview'
  endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands:
command! W :w " make it easier to save
command! Wq :wq " make it easier to save and quit
command! Q :q " make it easier to quit
command! Preview call _Preview() " make it easier to preview files


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" FiletypeFormat: remap leader f to do filetype formatting
nnoremap <leader>f :FiletypeFormat<cr>
vnoremap <leader>f :FiletypeFormat<cr>

" Trying copy paste for Linux
map <A-c> "+y<CR>
map <A-v> "+p<CR>

" open NERDTree with Ctrl+t
map <C-t> :NERDTreeToggle<CR>

" open Goyo mode
map <C-g> :Goyo <CR>

" open FZF
map <C-s> :FZF <CR>

" ALE toggle
map <C-a> :ALEToggle <CR>

" Autocompletion popup navigation
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr> <C-r> pumvisible() ? "\<C-p>" : "\<C-r>"

" Set up preview command
nmap <silent><leader>p :PreviewCmd<CR>

" Move up and down visually -- useful for Markdown, eliminates need for hard
" line wrapping with text width
nnoremap <expr> <Up>
        \ v:count == 0 ? 'g<Up>' : '<Up>'
vnoremap <expr> <Up>
      \ v:count == 0 ? 'g<Up>' : '<Up>'
nnoremap <expr> <Down>
      \ v:count == 0 ? 'g<Down>' : '<Down>'
vnoremap <expr> <Down>
      \ v:count == 0 ? 'g<Down>' : '<Down>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline Settings:
" Color theme to match vim theme
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Markdown Settings:
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf settings:
let $FZF_DEFAULT_OPTS = '-m '
      \ . '--preview "'
      \ . '[[ $(file --mime {}) =~ binary ]] &&'
      \ . 'echo {} is a binary file ||'
      \ . '(bat --style=numbers --color=always {} || cat {})'
      \ . '2> /dev/null | head -500"'

let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = { 'down': '~50%' }

function! s:fzf_edit_file(items)
  let items = a:items
  let i = 1
  let ln = len(items)
  while i < ln
    let item = items[i]
    let parts = split(item, ' ')
    let file_path = get(parts, 1, '')
    let items[i] = file_path
    let i += 1
  endwhile
  call s:Sink(items)
endfunction

function! FzfWithDevIcons(command, preview)
  let l:fzf_files_options = ' -m --bind ctrl-n:preview-page-down,ctrl-p:preview-page-up --preview "'.a:preview.'"'
  let opts = fzf#wrap({})
  let opts.source = a:command.'| devicon-lookup'
  let s:Sink = opts['sink*']
  let opts['sink*'] = function('s:fzf_edit_file')
  let opts.options .= l:fzf_files_options
  call fzf#run(opts)
endfunction

function! FzfFiles()
  let l:fzf_preview = $FZF_DEFAULT_OPTS
  let l:fzf_command = $FZF_DEFAULT_COMMAND
  call FzfWithDevIcons(l:fzf_command, l:fzf_preview)
endfunction

nnoremap <C-p> :call FzfFiles()<CR>

