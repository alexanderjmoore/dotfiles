" =========================
" Sensible server .vimrc
" No plugins, low fragility
" Catppuccin-Mocha-inspired
" =========================

set nocompatible

" --- General ---
syntax on
filetype plugin indent on
set encoding=utf-8
set hidden
set nowrap
set number
set relativenumber
set ruler
set showcmd
set showmode
set laststatus=2
set signcolumn=yes
set cursorline
set scrolloff=4
set sidescrolloff=8
set splitbelow
set splitright
set updatetime=300
set mouse=a

" --- Tabs / indentation ---
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" --- Search ---
set ignorecase
set smartcase
set incsearch
set hlsearch

" Clear search highlight with Enter
nnoremap <CR> :nohlsearch<CR><CR>

" --- Better backspace / command completion ---
set backspace=indent,eol,start
set wildmenu
set wildmode=longest:full,full

" --- Whitespace / file behavior ---
set list
set listchars=tab:»\ ,trail:·,nbsp:␣
set noerrorbells
set visualbell
set t_vb=

" --- Persistent undo if supported ---
if has('persistent_undo')
  let s:undodir = expand('~/.vim/undo')
  if !isdirectory(s:undodir)
    call mkdir(s:undodir, 'p', 0700)
  endif
  let &undodir = s:undodir
  set undofile
endif

" --- Sensible movement on wrapped lines ---
nnoremap j gj
nnoremap k gk

" --- Easier window navigation ---
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" --- Leader ---
let mapleader = " "

" =========================
" Catppuccin-Mocha-inspired colors
" =========================

if has('termguicolors')
  set termguicolors
endif

set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "server_mocha"

" Palette reference:
" Base      #1e1e2e
" Mantle    #181825
" Crust     #11111b
" Surface0  #313244
" Surface1  #45475a
" Surface2  #585b70
" Text      #cdd6f4
" Subtext1  #bac2de
" Overlay0  #6c7086
" Blue      #89b4fa
" Lavender  #b4befe
" Sapphire  #74c7ec
" Green     #a6e3a1
" Yellow    #f9e2af
" Peach     #fab387
" Maroon    #eba0ac
" Red       #f38ba8
" Mauve     #cba6f7
" Flamingo  #f2cdcd
" Teal      #94e2d5

hi Normal       guifg=#cdd6f4 guibg=#1e1e2e ctermfg=252 ctermbg=235
hi NormalFloat  guifg=#cdd6f4 guibg=#181825 ctermfg=252 ctermbg=234
hi CursorLine   guibg=#313244 ctermbg=236
hi CursorLineNr guifg=#f9e2af guibg=#313244 gui=bold ctermfg=223 ctermbg=236 cterm=bold
hi LineNr       guifg=#6c7086 guibg=#1e1e2e ctermfg=242 ctermbg=235
hi SignColumn   guifg=#89b4fa guibg=#1e1e2e ctermfg=111 ctermbg=235
hi VertSplit    guifg=#45475a guibg=#1e1e2e ctermfg=240 ctermbg=235
hi StatusLine   guifg=#cdd6f4 guibg=#313244 gui=bold ctermfg=252 ctermbg=236 cterm=bold
hi StatusLineNC guifg=#6c7086 guibg=#181825 ctermfg=242 ctermbg=234
hi Pmenu        guifg=#cdd6f4 guibg=#313244 ctermfg=252 ctermbg=236
hi PmenuSel     guifg=#1e1e2e guibg=#89b4fa gui=bold ctermfg=235 ctermbg=111 cterm=bold
hi Visual       guifg=NONE guibg=#45475a ctermbg=240
hi Search       guifg=#1e1e2e guibg=#f9e2af gui=bold ctermfg=235 ctermbg=223 cterm=bold
hi IncSearch    guifg=#1e1e2e guibg=#fab387 gui=bold ctermfg=235 ctermbg=216 cterm=bold
hi MatchParen   guifg=#f5c2e7 guibg=#45475a gui=bold ctermfg=225 ctermbg=240 cterm=bold
hi ColorColumn  guibg=#181825 ctermbg=234
hi Folded       guifg=#89b4fa guibg=#181825 ctermfg=111 ctermbg=234
hi NonText      guifg=#585b70 guibg=#1e1e2e ctermfg=241 ctermbg=235
hi SpecialKey   guifg=#585b70 guibg=#1e1e2e ctermfg=241 ctermbg=235

" Syntax groups
hi Comment      guifg=#6c7086 gui=italic ctermfg=242
hi Constant     guifg=#fab387 ctermfg=216
hi String       guifg=#a6e3a1 ctermfg=151
hi Character    guifg=#a6e3a1 ctermfg=151
hi Number       guifg=#fab387 ctermfg=216
hi Boolean      guifg=#fab387 ctermfg=216
hi Float        guifg=#fab387 ctermfg=216

hi Identifier   guifg=#cdd6f4 ctermfg=252
hi Function     guifg=#89b4fa ctermfg=111

hi Statement    guifg=#cba6f7 ctermfg=183
hi Conditional  guifg=#cba6f7 ctermfg=183
hi Repeat       guifg=#cba6f7 ctermfg=183
hi Label        guifg=#cba6f7 ctermfg=183
hi Operator     guifg=#89dceb ctermfg=117
hi Keyword      guifg=#f38ba8 ctermfg=210
hi Exception    guifg=#f38ba8 ctermfg=210

hi PreProc      guifg=#f5c2e7 ctermfg=225
hi Include      guifg=#89b4fa ctermfg=111
hi Define       guifg=#f5c2e7 ctermfg=225
hi Macro        guifg=#f5c2e7 ctermfg=225
hi PreCondit    guifg=#f9e2af ctermfg=223

hi Type         guifg=#f9e2af ctermfg=223
hi StorageClass guifg=#f9e2af ctermfg=223
hi Structure    guifg=#f9e2af ctermfg=223
hi Typedef      guifg=#f9e2af ctermfg=223

hi Special      guifg=#94e2d5 ctermfg=116
hi SpecialChar  guifg=#94e2d5 ctermfg=116
hi Tag          guifg=#89b4fa ctermfg=111
hi Delimiter    guifg=#bac2de ctermfg=250
hi SpecialComment guifg=#6c7086 ctermfg=242
hi Debug        guifg=#f38ba8 ctermfg=210

hi Underlined   guifg=#89b4fa gui=underline ctermfg=111 cterm=underline
hi Todo         guifg=#11111b guibg=#f9e2af gui=bold ctermfg=233 ctermbg=223 cterm=bold
hi Error        guifg=#f38ba8 guibg=#1e1e2e gui=bold ctermfg=210 ctermbg=235 cterm=bold
hi WarningMsg   guifg=#fab387 guibg=#1e1e2e ctermfg=216 ctermbg=235

let mapleader = " "
let maplocalleader = " "

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader><space> :nohlsearch<CR>

nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
vnoremap <C-s> <Esc>:w<CR>gv
