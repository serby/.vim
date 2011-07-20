call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set laststatus=2

set statusline=
set statusline+=%n\ %f\ %2*%m\ %1*%h
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}]\ %12.(%c:%l/%L%)

" No menu or toolbar
set guioptions=egr

set tabstop=2
set autoindent
set shiftwidth=2
set ruler
set number
set guifont=Menlo\ Regular:h14
set noexpandtab
set list
set spell
set linespace=1
set visualbell
set nobackup
set mouse=a
" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Colors
syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif
set background=dark
colorscheme solarized

filetype plugin on

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

set listchars=tab:▸\ ,trail:☠

" Fast saving
nmap <leader>w :w!<cr>

" Taglist toggle
nmap <leader>n :TlistToggle<cr>

" Remove mixed line endings
nmap <leader>= :%s/\s*$//e<cr>:nohl<cr>


" Git shortcuts
"nmap <leader>l :Glog<cr>
"nmap <leader>b :Gblame<cr>
"nmap <leader>a :Gwrite<cr>
"nmap <leader>c :Gcommit<cr>
"nmap <leader>d :Gdiff<cr>
"nmap <leader>s :Gstatus<cr>
"nmap <leader>f :!open .<cr><cr>

nmap <leader>o :edit <c-r>=expand("%:p:h")<cr><cr>

"set undofile
"set undodir=~/.vim.undo
"set undolevels=1000
"set undoreload=10000


" Fast editing for config files
map <leader>e :tabedit! ~/.vim/vimrc<cr>
map <leader>z :tabedit! ~/.zshrc<cr>

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" Update appcelerator head name space to the short form
autocmd FileType javascript nmap <leader>r :%s/Titanium/Ti/ge<CR>

autocmd! FileType javascript nmap <leader>m :!node --debug %<cr>
autocmd! FileType vim nmap <c-m>:source %<cr>
autocmd! FileType php nmap <leader>m :!php %<cr>
autocmd! FileType php nmap <leader>l :!php -l %<cr>
autocmd! BufWrite *.php,*.js,*.jade,*.coffee :%s/\s\+$//e

map <leader>mes :!phpmd % text codesize,unusedcode,naming,design<cr>
"map <c-m> :make %<cr>:Errors<cr>

"set hidden

" Buffer navigation
map <leader>l :ls<cr>:b<space>
map <leader>q :bd!<cr>
map <leader>] :bn<cr>
map <leader>[ :bp<cr>

" Stop arrow keys
nmap <up> ]
nmap <right> ]
nmap <left> ]
nmap <down> ]

autocmd! FileType php map <c-p> :!open http://uk3.php.net/<cword><cr>

" Moving lines up and down
"
" Bubble single lines
nmap <c-k> ddkP
nmap <c-j> ddp
" Bubble multiple lines
vmap <c-j> xkP`[V`]
vmap <c-k> xp`[V`]

" Highlight tailing whitespace
highlight ExtraWhitespace guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Switch off folding
set nofoldenable

" Enable syntax highlighting
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" CTags
autocmd! FileType php map <leader>rt :!ctags -R -h ".php" --exclude="\.js" --exclude="\.svn" --fields=+afkst --PHP-kinds=+cf *<CR><CR>

autocmd! FileType javascript map <leader>rt :!ctags -R -h ".js" .<cr><cr>

map <C-\> :tnext<CR>

" Command-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

" Command-][ to increase/decrease indentation
map! <D-]> >gv
map! <D-[> <gv

" When vimrc is edited, reload it
autocmd! BufWritePost vimrc source ~/.vim/vimrc
