set nocompatible

" Opinionated setups
set noignorecase
set expandtab
set shiftwidth=2
set splitright
set tabstop=2
set tw=80

" Enable undo history
try
	set undodir=~/.config/nvim/.undo/
	set undofile
catch
endtry

" Install plugins
call plug#begin()
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'sheerun/vim-polyglot'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'kaicataldo/material.vim', { 'branch': 'main' }
  Plug 'ryanoasis/vim-devicons'
call plug#end()

" Set colour scheme to Material
set termguicolors
let g:material_theme_style='ocean'
try
  colorscheme material
  catch
endtry

" Add Coc extensions – listed in alphabetical order
let g:coc_global_extensions = [
			\ 'coc-angular',
			\ 'coc-css',
      \ 'coc-diagnostic',
			\ 'coc-eslint',
			\ 'coc-git',
			\ 'coc-html',
			\ 'coc-json',
			\ 'coc-pairs',
			\ 'coc-phpls',
			\ 'coc-pyright',
      \ 'coc-react-refactor',
			\ 'coc-stylelintplus',
			\ 'coc-tabnine',
			\ 'coc-tsserver',
			\ 'coc-yank',
\]

" NERDTree configurations
let g:NERDTreeWinSize = 35
let g:NERDTreeWinPos = 'right'
au VimEnter * NERDTree
au VimEnter * wincmd p
au TabEnter * NERDTree
au TabEnter * wincmd p
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Set indentation type to tab for PHP files to match WordPress style
augroup FileTypeSpecificAutocommands
	au FileType php setlocal noexpandtab tabstop=2 softtabstop=0 shiftwidth=2
augroup END

" Yank list
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <F6> :NERDTreeToggle<CR>
nmap <F7> :vertical wincmd f<CR>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" React refactor
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
