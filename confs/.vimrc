
" #####################################################################
" # Misc standard vim/nvim settings
" #####################################################################

let mapleader = "\<Space>"
let base16colorspace=256  " Access colors present in 256 colorspace

set nocompatible " be iMproved, required
set nomodeline
set modelines=0
set pastetoggle=<F2> " Toggle between auto indent mode and verbatim paste mode
set t_Co=16
set backspace=indent,eol,start

set clipboard=unnamedplus  " Yank to system clipboard

set number " line numbers
"set relativenumber " Start counting from the cursor line in both directions
"set cursorline " Highlight the line the cursor is on
set ruler " Probably not needed anymore

set laststatus=2 " Use lightline
set noshowmode " Do not display an extra mode line below lightline

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=0 " Disable automatic wrapping
set expandtab
"set autoindent

set wrap linebreak nolist " do not insert newlines on wrapping
set fileformat=unix
set colorcolumn=
set encoding=utf-8 " Use UTF-8 as default
set ttimeoutlen=10 " No pause when switching modes
set showmatch " Show matching brackets. To disable: set noshowmatch

set splitbelow " Use `:sp filename` (vertical) and `:vs filename` (horizontal)
set splitright " to open a file in a split vim screen.

set foldmethod=indent " Enable code folding
set foldlevel=99

set incsearch " Proper search
set ignorecase
set smartcase
set gdefault

set undodir=~/.vimdid
set undofile " Permanent undo

set wildmenu " Show file options above the command line
set wildignore+=*.iso " Do not offer to open certain files/dirs
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd,*.swp,*min.js,*.o
set wildignore+=node_modules/*,bower_components/*

set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set nolist  " enable with :set invlist
set signcolumn=yes " Always draw sign column. Prevent buffer moving when adding/deleting sign.

" Control behavior of buffers and tabs, see
" https://stackoverflow.com/a/3476411/5520354
set switchbuf=useopen,usetab,newtab


" #####################################################################
" # Plug plugin manager
" #####################################################################

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" - Make sure you use single quotes
" - To install `:PlugInstall`, `:PlugUpdate` (update plugins), `:PlugUpgrade` (update Vim Plug), `:PlugStatus` etc
" - See https://github.com/junegunn/vim-plug for README
"call plug#begin('~/.local/share/nvim/plugged')

" #####################################################################

" Display a blame for the active line in the status
" TODO: remember last line number and only run when line changed
"Plug 'zivyangll/git-blame.vim'
":autocmd CursorMoved * call gitblame#echo()

" #####################################################################

" Set project root dir even if a file was opened in a sub directory
"Plug 'airblade/vim-rooter'

" #####################################################################

"Plug 'junegunn/vim-easy-align'

" #####################################################################

"Plug 'scrooloose/nerdtree'

" #####################################################################

"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
"Plug 'junegunn/fzf.vim'
" Open FZF file search with <space><f>
"noremap <leader>f :FZF<cr>

" #####################################################################

" Highlight the selected area when yanking
"Plug 'machakann/vim-highlightedyank'

" #####################################################################

" Find matching brackets or block delimiters
"Plug 'andymass/vim-matchup'
"let g:matchup_enabled = 1
" To disable a particular part of the plugin
"let g:matchup_matchparen_enabled = 1
"let g:matchup_motion_enabled = 0 " default: 1
"let g:matchup_text_obj_enabled = 0 " default: 1
"let g:matchup_surround_enabled = 0
"let g:matchup_transmute_enabled = 0
"let g:matchup_delim_stopline = 1500
"let g:matchup_delim_noskips = 2 " don't recognize anything in comments. default: 0
" highlight surrounding delimiters always as the cursor moves
"let g:matchup_matchparen_deferred = 1
"let g:matchup_matchparen_hi_surround_always = 1

" #####################################################################

" Insert or delete brackets, parens, quotes in pair
" CAREFUL: This breaks often and prevents from writing closing parens.
"          It just jumps to the next closing paren instead of letting
"          the user write one.
"Plug 'jiangmiao/auto-pairs'
"let g:AutoPairsFlyMode = 1
"let g:AutoPairsShortcutBackInsert = '<M-b>'

" #####################################################################

" A simple colored info line at the buttom of the window
"Plug 'itchyny/lightline.vim'
"let g:lightline = {
"      \ 'active': {
"      \   'left': [
"      \     [ 'mode', 'paste' ],
"      \     [ 'gitbranch' ],
"      \     [ 'readonly', 'filepath', 'filename', 'modified' ]
"      \   ]
"      \ },
"      \ 'component_function': {
"      \   'filename': 'LightlineFilename',
"      \   'gitbranch': 'fugitive#head'
"      \ },
"      \ }

" Show only the filename
"function! LightlineFilename()
"  return expand('%:t') !=# '' ? expand('%:p') : expand('%:p:h') . ' [No file]'
"endfunction

" Show full path of filename
"function! FullPathFilenameForLightline()
"    return expand('%:p:h')  " %:p:h -> directory only; %:t -> filename only
"endfunction

" #####################################################################

" Git integration
"Plug 'tpope/vim-fugitive'

" #####################################################################

" Display linter messages for various languages
"Plug 'w0rp/ale'
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_insert_leave = 1
"let g:ale_lint_on_save = 0
"let g:ale_lint_on_enter = 0
"let g:ale_virtualtext_cursor = 1
"let g:ale_rust_rls_config = { 'rust': { 'all_targets': 1, 'build_on_save': 1, 'clippy_preference': 'on' } }
"let g:ale_rust_rls_toolchain = ''
"let g:ale_linters = {'rust': ['rls']}
"highlight link ALEWarningSign Todo
"highlight link ALEErrorSign WarningMsg
"highlight link ALEVirtualTextWarning Todo
"highlight link ALEVirtualTextInfo Todo
"highlight link ALEVirtualTextError WarningMsg
"highlight ALEError guibg=None
"highlight ALEWarning guibg=None
"let g:ale_sign_error = "✖"
"let g:ale_sign_warning = "⚠"
"let g:ale_sign_info = "i"
"let g:ale_sign_hint = "➤"
"nnoremap <silent> K :ALEHover<CR>
"nnoremap <silent> gd :ALEGoToDefinition<CR>

" #####################################################################

" Autocomplete when used with Language servers like RLS (requires ncm2, yarp)
"Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"autocmd BufEnter * call ncm2#enable_for_buffer() " enable ncm2 for all buffers
"set completeopt=noinsert,menuone,noselect " IMPORTANT: :help Ncm2PopupOpen for more information
" tab to select, don't hijack the enter key
"inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
"inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")
"Plug 'ncm2/ncm2-bufword' " NOTE: you need to install completion sources to get completions. Check
"Plug 'ncm2/ncm2-path'    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
"set shortmess+=c
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
"inoremap <c-c> <ESC>
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" Use <TAB> to select the popup menu:
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
"au User Ncm2Plugin call ncm2#register_source({
"        \ 'name' : 'css',
"        \ 'priority': 9,
"        \ 'subscope_enable': 1,
"        \ 'scope': ['css','scss'],
"        \ 'mark': 'css',
"        \ 'word_pattern': '[\w\-]+',
"        \ 'complete_pattern': ':\s*',
"        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
"        \ })
"set hidden " Required for operations modifying multiple buffers like rename.
"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"    \ 'python': ['/usr/local/bin/pyls'],
"    \ }
"    "\ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"    "\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" #####################################################################

" Jedi Vim Python language support
"Plug 'davidhalter/jedi-vim'

" Syntactic language support
"Plug 'cespare/vim-toml'
"Plug 'rust-lang/rust.vim'
"" racer + rust: https://github.com/rust-lang/rust.vim/issues/192
"let g:rustfmt_command = "rustfmt +nightly"
"let g:rustfmt_autosave = 1
"let g:rustfmt_emit_files = 1
"let g:rustfmt_fail_silently = 0
"let g:rust_clip_command = 'xclip -selection clipboard'
""let g:racer_cmd = "/usr/bin/racer"
""let g:racer_experimental_completer = 1
"let $RUST_SRC_PATH = systemlist("rustc --print sysroot")[0] . "/lib/rustlib/src/rust/src"
"Plug 'plasticboy/vim-markdown'
"let g:vim_markdown_new_list_item_indent = 0
"let g:vim_markdown_auto_insert_bullets = 0
"let g:vim_markdown_frontmatter = 1

" #####################################################################

"call plug#end()

" #####################################################################
" # More misc settings
" #####################################################################


" --- Highlight trailing whitespace

highlight BadWhitespace ctermbg=red guibg=red
match BadWhitespace /\s\+$|\t\+/
set hlsearch

" --- Color theme

set background=dark
"colorscheme base16-harmonic-dark
"--colorscheme base16-atelier-dune
"Plug 'chriskempson/base16-vim'

hi Normal ctermbg=NONE
syntax on


" #####################################################################
" # Autocommands
" #####################################################################

autocmd BufRead *.orig set readonly  " Prevent accidental writes to buffers that shouldn't be edited
autocmd InsertLeave * set nopaste    " Leave paste mode when leaving insert mode
autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces() " Remove trailing whitespace on save and preserve cursor position

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" #####################################################################
" # File type specific overrides
" #####################################################################

" --- Python

au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
"au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix
au BufRead,BufNewFile *.py let b:comment_leader = '#'
"au BufNewFile,BufRead *.py set colorcolumn=80
"au BufNewFile,BufRead *.py highlight ColorColumn ctermbg=cyan
"au BufNewFile,BufRead *.py highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"au BufNewFile,BufRead *.py match OverLength /\%81v.\+/

" --- Web: JS/HTML/CSS

au BufNewFile,BufRead *.js set tabstop=2
au BufNewFile,BufRead *.js set softtabstop=2
au BufNewFile,BufRead *.js set expandtab
au BufNewFile,BufRead *.js set shiftwidth=2
au BufRead,BufNewFile *.js let b:comment_leader = '//'

au BufNewFile,BufRead *.html set tabstop=2
au BufNewFile,BufRead *.html set softtabstop=2
au BufNewFile,BufRead *.html set expandtab
au BufNewFile,BufRead *.html set shiftwidth=2
au BufRead,BufNewFile *.html let b:comment_leader = '//'

au BufNewFile,BufRead *.css set tabstop=2
au BufNewFile,BufRead *.css set softtabstop=2
au BufNewFile,BufRead *.css set expandtab
au BufNewFile,BufRead *.css set shiftwidth=2
au BufRead,BufNewFile *.css let b:comment_leader = '//'

" #####################################################################
" # Language specific overrides / settings
" #####################################################################

" --- Python

let python_highlight_all = 1 " enable all Python syntax highlighting features

" --- Rust

let g:rustfmt_autosave = 1


" #####################################################################

" - cterm vals: none underline bold
" - ctermbg and ctermfg: color names, green blue etc.
hi MatchParen cterm=underline ctermbg=none ctermfg=white

" #####################################################################
" # Key mappings
" #####################################################################

"map <C-p> :Files<CR> " Open hotkeys
"nmap <leader>; :Buffers<CR>
"nmap <leader>w :w<CR> " Quick-save

" Jump to append to end of line (usually to get out of parens and append a
" semicolon.)
imap <C-l> <Esc>$a

" Simplify navigation between split screens
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Scrolling in Visual Model with fixed cursor
nnoremap <PAGEUP>   <C-u>
nnoremap <PAGEDOWN> <C-d>
nnoremap <C-UP>     <C-y>
nnoremap <C-DOWN>   <C-e>
nnoremap <C-HOME>   <S-h>
nnoremap <C-END>    <S-l>

" --- <leader> key combination

" Code folding
nnoremap <space>. za
" Copy entire buffer into clipboard
noremap <leader>c :w !xclip -in -selection clipboard<cr>
" Paste clipboard into buffer
noremap <leader>p :read !xclip -out -selection clipboard<cr>
" Show/hide hidden characters
nnoremap <leader>, :set invlist<cr>
" Replace up to next _ or up to next -
noremap <leader>m ct_
noremap <leader>n ct-


" --- Fix for vim in tmux shells
"     https://superuser.com/questions/401926/#402084
"
"     Vim will usually automatically set up its handling of these
"     keys when TERM is xterm-something, but it skips this since
"     TERM is 'screen' in tmux. You can manually configure these
"     keys in your ~/.vimrc like this:

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif


" #####################################################################
" # Load all plugins now.
" #####################################################################

" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

