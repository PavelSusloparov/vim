set t_Co=256

filetype off

call pathogen#incubate()
call pathogen#helptags()

filetype plugin indent on

"autocmd VimEnter * vsplit file
"autocmd VimEnter * split file

autocmd VimEnter * NERDTree

let NERDTreeShowHidden=1

set nocompatible

set ruler

set showcmd
set nu
set foldmethod=indent

set scrolljump=7
set scrolloff=7

set novisualbell
set t_vb=

set mouse=a
set mousemodel=popup

set hidden

set ch=1
set mousehide

set autoindent

set backspace=indent,eol,start whichwrap+=<,>,[,]
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P
set laststatus=2

hi User1 guifg=Orange
hi User2 guifg=Red

set tabstop=4
set shiftwidth=4
set smarttab
set smartindent
set et

set wrap

set ai
set cin

set showmatch
set hlsearch
set incsearch
set ignorecase
set nohlsearch

set lz

set listchars=tab:··
set list

set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

set guioptions-=T
set guioptions-=m 

if has('gui')
colorscheme darkblue
if has('win32')
set guifont=Lucida_Console:h12:cRUSSIAN::
else
set guifont=Terminus\ 14
endif
endif

if has('gui')
if has('win32')
au GUIEnter * call libcallnr('maximize', 'Maximize', 1)
elseif has('gui_gtk2')
au GUIEnter * :set lines=99999 columns=99999
endif
endif

if has('win32')
set makeprg=nmake
compiler msvc
else
set makeprg=make
compiler gcc
endif

let g:pydiction_location = '/home/acekool/.vim/bundle/pydiction/complete-dict'
let g:pymode_options = 0
let g:pymode_lint_write = 0
let g:pymode_folding = 0
let g:pymode_rope_vim_completion = 0

noremap <C-N>t :TagbarToggle<CR>

let g:tagbar_usearrows = 1
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_foldlevel = 0

"command t plugin
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

noremap <leader>d <Esc>:bn<CR>
noremap <leader>a <Esc>:bp<CR>
noremap <leader>s <Esc>:ls<CR>
noremap <leader>q <Esc>:bd<CR>

"<Leader> definition
"'let mapleader = ","

let g:SuperTabDefaultCompletionType = "context"

"Solaries colorscheme
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

fun! DetectTemplate()
    let n = 1
    while n < line("$")
        if getline(n) =~ '{%' || getline(n) =~ '{{'
            set ft=htmldjango
            return
        endif
        let n = n + 1
    endwhile
    set ft=html "default html
endfun'}}}'

autocmd BufNewFile,BufRead *.html call DetectTemplate()

nmap <C-N>v :NERDTree<cr>
vmap <C-N>v <esc>:NERDTree<cr>i
imap <C-N>v <esc>:NERDTree<cr>i

nmap <C-N>x :NERDTreeClose<cr>
vmap <C-N>x <esc>:NERDTreeClose<cr>i
imap <C-N>x <esc>:NERDTreeClose<cr>i

set encoding=utf8

if has("autocmd")
    autocmd BufRead *.sql set filetype=mysql      
endif

" Пробел в нормальном режиме перелистывает страницы
nmap <Space> <PageDown>

" CTRL-F для omni completion
imap <C-F> <C-X><C-O>

" C-c and C-v - Copy/Paste в "глобальный клипборд"
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi

" Заставляем shift-insert работать как в Xterm
map <S-Insert> <MiddleMouse>

" C-y - удаление текущей строки
nmap <C-y> dd
imap <C-y> <esc>ddi

" C-d - дублирование текущей строки
imap <C-d> <esc>yypi

" Поиск и замена слова под курсором
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

" F2 - быстрое сохранение
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

" F3 - просмотр ошибок
nmap <F3> :copen<cr>
vmap <F3> <esc>:copen<cr>
imap <F3> <esc>:copen<cr>

" F5 - просмотр списка буферов
nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc><esc>:BufExplorer<cr>

" F6 - предыдущий буфер
map <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>i
imap <F6> <esc>:bp<cr>i

" F7 - следующий буфер
map <F7> :bn<cr>
vmap <F7> <esc>:bn<cr>i
imap <F7> <esc>:bn<cr>i

" F8 - список закладок
map <F8> :MarksBrowser<cr>
vmap <F8> <esc>:MarksBrowser<cr>
imap <F8> <esc>:MarksBrowser<cr>

" F9 - "make" команда
map <F9> :make<cr>
vmap <F9> <esc>:make<cr>i
imap <F9> <esc>:make<cr>i

" F10 - удалить буфер
map <F10> :bd<cr>
vmap <F10> <esc>:bd<cr>
imap <F10> <esc>:bd<cr>

" F11 - показать окно Taglist
map <F11> :TlistToggle<cr>
vmap <F11> <esc>:TlistToggle<cr>
imap <F11> <esc>:TlistToggle<cr>

" F12 - обозреватель файлов
map <F12> :Ex<cr>
vmap <F12> <esc>:Ex<cr>i
imap <F12> <esc>:Ex<cr>i

" < & > - делаем отступы для блоков
vmap < <gv
vmap > >gv

" Выключаем ненавистный режим замены
imap >Ins> <Esc>i

" Меню выбора кодировки текста (koi8-r, cp1251, cp866, utf8)
set wildmenu
set wcm=<Tab> 
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>)

" С-q - выход из Vim 
map <C-q> <Esc>:qa<cr>

" Настройки для SessionMgr
let g:SessionMgr_AutoManage = 0
let g:SessionMgr_DefaultName = "mysession"

" Настройки для Tlist (показвать только текущий файл в окне навигации по коду)
let g:Tlist_Show_One_File = 1

set completeopt-=preview
set completeopt+=longest
set mps-=[:]
