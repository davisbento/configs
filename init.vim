syntax on
filetype off

call plug#begin('~/.vim/plugged')
"Imported ones
Plug 'bronson/vim-trailing-whitespace'
Plug 'erickzanardo/vim-xclip'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-unimpaired'
Plug 'isRuslan/vim-es6'
Plug 'bling/vim-airline'
Plug 'github/copilot.vim'

"" Status and tab bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'alvan/vim-closetag'

"Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'othree/es.next.syntax.vim', {'for': 'javascript'}
Plug 'pearofducks/ansible-vim'
"Plug 'HerringtonDarkholme/yats.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

"Syntax format for jsx
Plug 'maxmellon/vim-jsx-pretty'

"" Auto close/match brackets
Plug 'Raimondi/delimitMate'

"Syntax support for graphql
Plug 'jparise/vim-graphql'

"Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/rpc' }

" Beautiful Dark theme
Plug 'folke/tokyonight.nvim'

Plug 'ryanoasis/vim-devicons'


"" Git integration
" Leader-g = Open Line on Git (browser)
" Leader-gf = List GitFiles
" Leader-gt  = Show GitStatus
" Leader-gm  = Show Git Commit Message for Line
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
Plug 'stsewd/fzf-checkout.vim' " The  Primeagen told me to install it.
" C-n (new-branch), C-d (del), C-e (Merge),
" C-r (rebase)

Plug 'sheerun/vim-polyglot'

call plug#end()


" Status bar plugin (vim-airline)
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" vim javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

filetype plugin indent on    " required

" coc.vim config
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
autocmd CursorHold * silent call CocActionAsync('highlight')
" end coc.vim config

" Few configurations:
set hlsearch " Highlight search results
set encoding=UTF-8
set ffs=unix,dos,mac
set modeline
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set backspace=indent,eol,start
set laststatus=2
set cpoptions+=n
set number
set vb
set smartindent
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=235 gui=NONE guifg=NONE guibg=NONE
set clipboard=unnamed,unnamedplus

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" Short cuts:
let mapleader=","

let g:mkdp_auto_start = 0       " Don't open md preview automatically
let g:mkdp_auto_close = 0       " Don't close md preview automatically

let g:session_directory = "~/.config/nvim/session" " Session saving
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

let g:indentLine_enabled = 1    " Enables indentline plugin
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_faster = 1


" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx,*.jsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'

let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,jsx,tsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" FZF and Rg settings for search
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
if executable('rg')
  let g:rg_derive_root='true'
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

"" Uncomment below to show :Rg in a popup
" let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

map <C-B> :NERDTreeToggle<CR>
map <C-F> :NERDTreeFind<CR>         " Open NERDTree and focus on current file
map <F5> :e!<CR>                    " force reload current file
map <leader>W :weslint.executeAutofix<CR>
map <leader>w :w<CR>               " save current buffer
map <leader>s :wincmd j<CR>        " go window down
map <leader>a :wincmd h<CR>        " go window left
map <leader>d :wincmd l<CR>        " go window right
map <leader>v :vertical :new<CR>   " open new vertical window
map <leader>h :new<CR>             " open a new horizontal window
map <leader>q :q<CR>               " it quit current vim buffer
map <leader>Q :q!<CR>              " it force quit current vim buffer
map <leader>n :tabnew<CR>          " create a new tab
map <leader>z :tabprevious<CR>     " move to previous tab
map <leader>x :tabnext<CR>         " move to next tab
map <leader>y :call system('xclip -selection clipboard', @0)<CR>  " move last yank selection to xclip
"nmap <ESC> :call coc#util#float_hide() <CR>
nmap <silent>e :call CocAction('doHover')<CR>
nmap <leader>do <Plug>(coc-codeaction)
"autocmd CursorHold * silent call CocActionAsync('doHover')
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent>rr <Plug>(coc-rename)

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Git Stuff
nnoremap <leader>gb :GBranches<CR>
nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>

" Get Help for Word
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>

" Preview Refactor on Word
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Preview Search
nnoremap <Leader>r :Rg<CR>

:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" Preview Search Word
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>

" Git Files
nnoremap <Leader>gf :GFiles<CR>

" Git Status
nnoremap <Leader>gt :GFiles?<CR>

" Local Directory Files
nnoremap <Leader>f :Files<CR>

" File History
nnoremap <Leader>hf :History<CR>

" Search History
nnoremap <Leader>hse :History/<CR>

"Commands History
nnoremap <leader>hc :History:<CR>

" Search the current file with preview
nnoremap <leader>s :BLines<CR>
nnoremap <leader>l :Lines<CR>

autocmd BufNewFile,BufRead *.yaml.hbs   set syntax=ansible
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

set t_Co=256


if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark                        " Set global background to dark
colorscheme tokyonight-night               " Default colorscheme

let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline_skip_empty_sections = 1

""""
"" Helpers
""""

" Generate UUID
nnoremap <leader>id :read !uuidgen<esc>k :join<esc>
