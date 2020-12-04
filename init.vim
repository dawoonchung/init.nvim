" Opinionated setups
set noignorecase
set shiftwidth=2
set splitright
set tabstop=2
set tw=80

try
	set undodir=~/.config/nvim/.undo/
	set undofile
catch
endtry

" Install plugins
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
call plug#end()

" Set colour scheme to gruvbox
try
	colorscheme gruvbox
catch
endtry

" Add Coc extensions – listed in alphabetical order
let g:coc_global_extensions = [
			\ 'coc-angular',
			\ 'coc-css',
			\ 'coc-eslint',
			\ 'coc-git',
			\ 'coc-html',
			\ 'coc-json',
			\ 'coc-phpls',
			\ 'coc-pyright',
			\ 'coc-stylelint',
			\ 'coc-svg',
			\ 'coc-tabnine',
			\ 'coc-tsserver',
			\ 'coc-xml',
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
