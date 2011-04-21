call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set laststatus=2
set statusline=%m\ %{fugitive#statusline()}%=%c:%l/%L

set statusline=
set statusline+=%f\ %2*%m\ %1*%h
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%*
set statusline+=%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}]\ %12.(%c:%l/%L%)

" No menu or toolbar
set guioptions=egr

set tabstop=2
set autoindent
set hlsearch
set shiftwidth=2
set number
set guifont=Menlo\ Regular:h14
set noexpandtab
set list
set spell
set linespace=1

colorscheme vividchalk

filetype plugin on

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

set listchars=tab:▸\ ,eol:¬,trail:☠

" Fast saving
nmap <leader>w :w!<cr>

" New Tab
nmap <leader>n :tabnew<cr>

" Remove mixed line endings
nmap <leader>= :%s/\s*$//ge<cr>:nohl<cr>

" Git shortcuts
nmap <leader>l :Glog<cr>
nmap <leader>b :Gblame<cr>
nmap <leader>a :Gwrite<cr>
nmap <leader>c :Gcommit<cr>
nmap <leader>d :Gdiff<cr>
nmap <leader>s :Gstatus<cr>

nmap <leader>o :tabnew<cr>:NERDTree<cr>

" Fast editing of the .vimrc
map <leader>e :tabnew<cr>:e! ~/.vim/vimrc<cr>

" Run current buffer through node
autocmd FileType javascript nmap <leader>m :!node --debug %<cr>

" Update appcelerator head name spcae to the short form
autocmd FileType javascript nmap <leader>r :%s/Titanium/Ti/ge<CR>

autocmd FileType php nmap <leader>m :!php %<cr>
autocmd FileType php nmap <leader>l :!php -l %<cr>

map <leader>] :tabnext<cr>
map <leader>[ :tabprevious<cr>

" Stop arrow keys
" nmap <up> ]
" nmap <right> ]
" nmap <left> ]
" nmap <down> ]

" Moving lines up and down
"
" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Highlight tailing whitespace
highlight ExtraWhitespace guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" When vimrc is edited, reload it
autocmd! BufWritePost vimrc source ~/.vim/vimrc
