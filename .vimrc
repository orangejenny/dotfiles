execute pathogen#infect()

set number
set hidden

set hlsearch
set ic
set smartcase
set incsearch

syntax on

au BufNewFile,BufRead *.less set filetype=less

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=grey guibg=grey
match ExtraWhitespace /\s\+$/

" highlight 115+ character lines
let &colorcolumn=join(range(115,999),",")
highlight ColorColumn ctermbg=green guibg=grey

"tabs = 4 spaces and auto indent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set ruler
set tw=115

" better navigation when wrapping
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"persistent undo and auto backup
set backup
set backupdir=~/.vim/backups

"after 80 characters new line
"set textwidth=80

if has("autocmd")
  autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType tsv setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType scss,html,css,ruby,eruby setlocal ts=2 sts=2 sw=2 expandtab
endif

" make fugitive's web browser work
let g:netrw_browsex_viewer = "open"
