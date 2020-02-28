" ===== VUNDLE: A VIM PLUGIN MANAGER =====
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin() "'$HOME/.vim/bundle/'
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-surround'
call vundle#end()

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" :PluginUpdate     - updates all plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ========= Airline Plugin Commands =========
" ONLY WORKS IF YOU HAVE THE AIRLINE PLUGIN
" statusline appear at all times
"let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1


" ========= DEFAULTS =========
set clipboard=unnamed
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar
set scrolloff=1
set ignorecase
set smartcase
set incsearch
let mapleader = " "
set ttimeout
set timeoutlen=3000  " Time to wait for a command (after leader for example).
set ttimeoutlen=100 " Time to wait for a key sequence.
set nocompatible "no compatible with Vi enables other options
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab "expands tab to tabstop spaces
set linebreak "wrap whole words instead of splitting them in the middle
set guifont=Consolas:h11
syntax on
set encoding=utf-8
set autochdir "when changing files also change current directory
set pythonthreedll=python37.dll "use this python version
set splitright
set splitbelow
"don't loose selection when shifting
xnoremap <  <gv
xnoremap >  >gv
"disable bells
set noerrorbells
set novisualbell

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" ========= spellcheck =========
" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>oe :setlocal spell! spelllang=en_us<CR>
map <leader>od :setlocal spell! spelllang=de<CR>
" z= to show suggestions; zg to mark word good; zw to mark word wrong
" [s back to previous spelling mistake; ]s next spelling mistake
"seplling on by default set spell spelllang=en_us



" ========= navigation =========
"Differs from 'j' when lines wrap, and when used with an operator, because it's not linewise.
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
map <leader>wh <C-w>h
map <leader>wj <C-w>j
map <leader>wk <C-w>k
map <leader>wl <C-w>l
map <leader>ws :vsplit<CR>
map <leader>wt <C-w>T

nnoremap ]q :cnext<cr>
nnoremap [q :cprev<cr>

" jump to char
map <leader>j <Plug>(easymotion-s)

"file new
map <leader>fn :vert new<CR>
"vim new
map <leader>vn :!start gvim<CR>

"source vimrc
map <leader>svrc :source ~/.vimrc<CR>


" ========= COLORS AND FONTS FOR VIM THEME =========
set background=dark
set termguicolors
colorscheme gruvbox


" ========= starting window size =========
set lines=40 columns=130
:winpos 735 400


" ========= goyo =========
map <leader>gy :Goyo<CR>

" ========= nerdtree =========
set guioptions-=L "no vertical scrollbar when window split
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (expand("%:t") != '')
      exe ":NERDTreeFind"
    else
      exe ":NERDTreeToggle"
    endif
  endif
endfunction
nnoremap <leader>nt :call NERDTreeToggleInCurDir()<CR>


" ========= FZF and search =========
"project file
map <leader>pf :Files<CR>
map <leader>pb :Buffers<CR>
map <leader>ph :History<CR>
map <leader>/ :Ag<SPACE>

"vimrc
map <leader>vrc :e $MYVIMRC<CR>
"bashrc
map <leader>brc :e ~/.bashrc<CR>
"riderrc
map <leader>rrc :e ~/.ideavimrc<CR>


" ========= formatting =========
function! FormatPurchaseLogs()
    exe ":%v/\"Log\",.*purchase/d"
    exe ":%s/,/\r/g"
    exe ":%s/\"//g"
    exe ":%s/Log/\rNEXT_STAT/g"
    exe ":g/Payload/d"
endfunction
"purchase logs
map <leader>purl :call FormatPurchaseLogs()<CR>

"format json
map <leader>fj :Autoformat json<CR>
"format white space
map <leader>fws :%s/\s\+$/<CR>
"format empty lines
map <leader>fel :g/^\s*$/d<CR>

"datetime
map <leader>dt :put=strftime('%Y/%m/%d %a %H:%M')<CR>

" ========= instant markdown =========
"if things don't work, use :InstantMarkdownStop and try again
map <leader>md :InstantMarkdownPreview<CR>
map <leader>ms :InstantMarkdownStop<CR>
let g:instant_markdown_autostart = 0

" ========= vimwiki =========
"pot -> potentials
map <leader>poti :e ~/vimwiki/potential_index.md<CR>
map <leader>potf :cd ~/vimwiki/potentials/<CR>:Ag<SPACE>
map <leader>bu :e ~/vimwiki/bachir_update.md<CR>

nmap <leader>vwh <Plug>Vimwiki2HTML
nmap <leader>vws <Plug>VimwikiUISelect
nmap <leader>wti <Plug>VimwikiTabIndex
nmap <leader>wn <Plug>VimwikiNextLink

let g:vimwiki_list = [{
            \'path': '~/vimwiki/',
            \'path_html': '~/vimwiki/html/',
            \'syntax': 'markdown',
            \'ext': '.md',
            \'root_path': '~/vimwiki/',
            \'template_path': '~/vimwiki/templates/',
            \'template_default': 'templates/def_template',
            \'template_ext': '.html',
            \'custom_wiki2html': 'vimwiki_markdown.py'}]

hi VimwikiHeaderChar guifg=#fe8019
hi VimwikiHeader1 guifg=#fabd2d 
hi VimwikiHeader2 guifg=#8ab461
hi VimwikiHeader3 guifg=#52b3d3
hi VimwikiHeader4 guifg=#dab1ff
hi VimwikiLink guifg=#52b3d3
hi VimwikiList guifg=#d8b0fd 
hi VimwikiCode guifg=#8ab461

let g:vimwiki_global_ext=0
let g:vimwiki_folding='custom'

" ========= folding =========
"Zorro zc - close; zo - open; zM - mask; zR - reveal
function! WikiFolds()
    let thisline = getline(v:lnum)
    if thisline =~ '^####\s\S'
        return ">4"
    elseif thisline =~ '^###\s\S'
        return ">3"
    elseif thisline =~ '^##\s\S'
        return ">2"
    elseif thisline =~ '^#\s\S'
        return ">1"
    else
        return "="
    endif
endfunction

set foldenable
set foldlevelstart=1
set foldexpr=WikiFolds()
set foldmethod=expr

function! MarkdownFoldText()
  let foldsize = (v:foldend-v:foldstart)
  return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction
set foldtext=MarkdownFoldText()
