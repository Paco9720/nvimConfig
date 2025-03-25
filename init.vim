colorscheme black
set number
set clipboard+=unnamedplus

nmap <c-w> :w<cr>
nmap <c-q> :q<cr>
nmap <c-e> <cmd>Telescope find_files<cr>


call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'github/copilot.vim'
call plug#end()

