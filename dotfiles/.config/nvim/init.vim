" -------------------------------------------------------------------------------------------------
" plugins
" -------------------------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim' "file fuzzy search
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'NLKNguyen/papercolor-theme'
Plug 'majutsushi/tagbar'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'itchyny/lightline.vim'
" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'


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

" -------------------------------------------------------------------------------------------------
" colors
" -------------------------------------------------------------------------------------------------
set t_Co=256 "required for urxvt
set background=dark "dark or light
colorscheme PaperColor

hi Normal guibg=NONE ctermbg=NONE
highlight clear LineNr

" -------------------------------------------------------------------------------------------------
" settings
" -------------------------------------------------------------------------------------------------
filetype on "detect files based on type
filetype plugin on "when a file is edited its plugin file is loaded (if there is one for the 
                  ""detected filetype) 
filetype indent on "maintain indentation

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
" nerd tree
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>
"! ensures first result is not auto opened
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>t :Tagbar<cr>
" toggle show invisibles
nnoremap <leader>l :set list!<CR>
"ctl+space for assist
inoremap <C-@> <c-x><c-o>
nnoremap <Leader>m :set spell!<cr>

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
" use gopls over gocode although typically done
" via language server any way (see mapping below)
let g:go_info_mode = 'gopls'

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

" highlight line currently being edited
autocmd InsertEnter,InsertLeave * set cul!

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
     "\ pumvisible() ? "\<C-n>" :
     "\ <SID>check_back_space() ? "\<TAB>" :
     "\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
 "let col = col('.') - 1
 "return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

function! s:show_documentation()
 "if (index(['vim','help'], &filetype) >= 0)
   "execute 'h '.expand('<cword>')
 "else
   "call CocAction('doHover')
 "endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
 "autocmd!
 "" Setup formatexpr specified filetype(s).
 "autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
 "" Update signature help on jump placeholder
 "autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


nnoremap <silent> <C-K>  :<C-u>GoDocBrowser<cr>
