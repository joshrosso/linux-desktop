" joshrosso's vim config
" https://octetz.com

" -------------------------------------------------------------------------------------------------
" plugins
" -------------------------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'roxma/nvim-yarp'
" comment/uncomment code
Plug 'scrooloose/nerdcommenter'
" git integration
Plug 'tpope/vim-fugitive'
" builds on fugitive to work with github
Plug 'tpope/vim-rhubarb'
" file browser
Plug 'scrooloose/nerdtree'
" vim color theme
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
" tag browser
Plug 'majutsushi/tagbar' 
" status bar at the bottom of vim
Plug 'itchyny/lightline.vim'
" fuzzy search with several integrations
Plug 'junegunn/fzf.vim'

Plug 'neovim/nvim-lspconfig'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" remove delay from vim escape
" https://www.reddit.com/r/vim/comments/2391u5/delay_while_using_esc_to_exit_insert_mode
" delay also must be removed from tmux (if using).
" https://www.johnhawthorn.com/2012/09/vi-escape-delays
augroup FastEscape
   "autocmd!
   "au InsertEnter * set timeoutlen=0
   "au InsertLeave * set timeoutlen=1000
augroup END

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" -------------------------------------------------------------------------------------------------
" colors
" -------------------------------------------------------------------------------------------------
set t_Co=256 "required for urxvt
"set background=dark "dark or light
colorscheme embark

hi Normal ctermbg=none
highlight LineNr guifg=#050505
set cursorline

source /usr/share/vim/vimfiles/plugin/fzf.vim

" -------------------------------------------------------------------------------------------------
" settings
" -------------------------------------------------------------------------------------------------
filetype on "detect files based on type
filetype plugin on "when a file is edited its plugin file is loaded (if there is one for the 
                   "detected filetype) 
filetype indent on "maintain indentation
syntax on

set incsearch "persist search highlight
set hlsearch "highlight as search matches
set mouse=a "use the mouse; you're a terrible person
set noswapfile "the world is a better place without swap
set nobackup "backups never helped anyone
set nu "enable line numbers
set splitbelow "default open splits below (e.g. :GoDoc)
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:< "sets chars representing "invisibles when
                                                       ""`set list!` is called
set expandtab "insert space when tab key is pressed
set tabstop=2 "number of spaces inserted when tab is pressed
set softtabstop=2 
set shiftwidth=2 "number of spaces to use for each auto indent
set cc=100 "draw bar down column 100

let g:ackprg = 'ag --vimgrep' "use ag instead of ack

" -------------------------------------------------------------------------------------------------
" mapping
" -------------------------------------------------------------------------------------------------
let mapleader = "," "leader key is ','

noremap <Leader>o :cnext<cr>
noremap <Leader>p :cprevious<cr>

" fzf
noremap <Leader>f :Rg!<cr>
" nerd tree
noremap <Leader>n :NERDTreeToggle<cr>
"! ensures first result is not auto opened
nnoremap <Leader>t :Tagbar<cr>
" toggle show invisibles
nnoremap <leader>l :set list!<CR>
"ctl+space for assist
inoremap <C-@> <c-x><c-o>
nnoremap <Leader>m :set spell!<cr>

" for markdown files:
" auto wrap at 80 characters
" enable spell check
au BufRead,BufNewFile *.md setlocal spell textwidth=80

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_qflist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'gopls', 'rust_analyzer', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF
