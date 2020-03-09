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
Plugin 'kien/ctrlp.vim'
Plugin 'liuchengxu/vim-which-key'
call vundle#end()

" ========= defaults =========
set clipboard=unnamed
let g:mapleader = "\<Space>"
set ttimeout
set timeoutlen=500  " Time to wait for a command (after leader for example).
set ttimeoutlen=100 " Time to wait for a key sequence.
set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap <silent> <ESC> :nohlsearch<Bar>:echo<CR>
set tabstop=4
set shiftwidth=4
set expandtab "expands tab to tabstop spaces
set linebreak "wrap whole words instead of splitting them in the middle
set nocompatible "no compatible with Vi enables other options
filetype plugin indent on
syntax on
set encoding=utf-8
set pythonthreedll=python37.dll "use this python version
"don't loose selection when shifting
xnoremap <  <gv
xnoremap >  >gv
"disable bells
set noerrorbells
set novisualbell
" Disables automatic commenting on newline:
augroup format_options
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" ========= which-key =========
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
let g:which_key_map = {}

let g:which_key_map.b = {
    \ 'name' : '+buffer',
    \ 'l' : ['<C-^>', 'last buffer'],
    \ }

let g:which_key_map.f = {
    \ 'name' : '+format',
    \ 'e' : [':g/^$/d', 'empty lines'],
    \ 'p' : [':call FormatPurchaseLogs()', 'purchase logs'],
    \ 'j' : [':Autoformat json', 'json'],
    \ 'w' : [':%s/\s\+$/', 'whitespace'],
    \ }

let g:which_key_map.i = {
    \ 'name' : '+insert',
    \ 'd' : [":call GetDateTime()", 'datetime'],
    \ }

let g:which_key_map.o = {
    \ 'name' : '+open',
    \ 'b' : [':e ~/.bashrc', 'bashrc'],
    \ 'd' : [':setlocal spell! spelllang=de', 'deutsch spellcheck'],
    \ 'e' : [':setlocal spell! spelllang=en_us', 'english spellcheck'],
    \ 'f' : [':vert new', 'file'],
    \ 'g' : [':Goyo', 'goyo'],
    \ 'n' : [':call NERDTreeToggleInCurDir()', 'nerdtree'],
    \ 'p' : [':e ~/vimwiki/potential_index.md', 'potentials'],
    \ 'r' : [':e ~/.ideavimrc', 'rider'],
    \ 'u' : [':e ~/vimwiki/bachir_update.md', 'bachir'],
    \ 'v' : [':e $MYVIMRC', 'vimrc'],
    \ 'w' : [':!start gvim', 'window'],
    \ }

let g:which_key_map.p = {
    \ 'name' : '+project',
    \ 'f' : [':CtrlP', 'files'],
    \ 'w' : [':CtrlP ~/vimwiki/', 'vimwiki'],
    \ 'b' : [':CtrlPBuffer', 'buffers'],
    \ }

let g:which_key_map.s = {
    \ 'name' : '+search',
    \ 'r' : [':CtrlPMRU', 'recent'],
    \ 's' : [':CtrlPLine', 'swoop'],
    \ 'v' : [':source $MYVIMRC', 'source vimrc'],
    \ }

let g:which_key_map.t = {
    \ 'name' : '+toggle',
    \ 'w' : [':set wrap!', 'wrap'],
    \ }

let g:which_key_map.w = {
    \ 'name' : '+window',
    \ 'h' : ['<C-w>h', 'left'],
    \ 'j' : ['<C-w>j', 'down'],
    \ 'k' : ['<C-w>k', 'up'],
    \ 'l' : ['<C-w>l', 'right'],
    \ 's' : ['vsplit', 'vsplit'],
    \ 't' : ['<C-w>T', 'tabo'],
    \ }

nnoremap <leader>j <Plug>(easymotion-s)
nnoremap <leader>/ :Ag<SPACE>

let g:which_key_map.v = { 'name' : '+vimwiki' }
nmap <leader>vh <Plug>Vimwiki2HTML
nmap <leader>vn <Plug>VimwikiNextLink
nmap <leader>vp <Plug>VimwikiPrevLink
nmap <leader>vs <Plug>VimwikiUISelect
nmap <leader>vt <Plug>VimwikiTabIndex


call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

" ========= navigation =========
"Differs from 'j' when lines wrap, and when used with an operator, because it's not linewise.
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

nnoremap ]q :cnext<cr>
nnoremap [q :cprev<cr>

set autochdir "when changing files also change current directory
set splitright
set splitbelow

" ========= colors and fonts =========
set guifont=Consolas:h11
set background=dark
set termguicolors
colorscheme gruvbox


" ========= window customization =========
set lines=58 columns=118
:winpos 1520 180

set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar
set scrolloff=1


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

" ========= formatting =========
function! FormatPurchaseLogs()
    exe ":%v/\"Log\",.*purchase/d"
    exe ":%s/,/\r/g"
    exe ":%s/\"//g"
    exe ":%s/Log/\rNEXT_STAT/g"
    exe ":g/Payload/d"
endfunction

" ========= instant markdown =========
let g:instant_markdown_autostart = 0
noremap <leader>md :InstantMarkdownPreview<CR>
noremap <leader>ms :InstantMarkdownStop<CR>


" ========= vimwiki =========
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
noremap <Tab> za

"========= abbreviations =========
iabbrev simg ![skype_image](file:additionalInfo/)

" ========= Airline Plugin Commands =========
let g:airline#extensions#tabline#enabled = 1

" ========= datetime =========
function! GetDateTime()
  exe ":put=strftime('%Y/%m/%d %a %H:%M')"
endfunction

