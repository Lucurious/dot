runtime! debian.vim

set encoding=utf-8
filetype off
call plug#begin()

Plug 'edkolev/tmuxline.vim'

Plug 'vim-airline/vim-airline'

Plug 'christoomey/vim-tmux-navigator'

Plug 'tmhedberg/SimpylFold'

Plug 'neomake/neomake'

Plug 'nvie/vim-flake8'

Plug 'mattn/emmet-vim'

Plug 'tpope/vim-fugitive'

Plug 'lervag/vimtex'

Plug 'ntpeters/vim-better-whitespace'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'honza/vim-snippets'

Plug 'crusoexia/vim-monokai'

Plug 'sheerun/vim-polyglot'

call plug#end()
filetype plugin indent on

:set ignorecase smartcase
:set tabstop=4 shiftwidth=4 expandtab

syntax on
colorscheme monokai

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set showcmd		" Show (partial) command in status line.
set showmatch
set matchtime=2 " Show matching brackets.
set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

nnoremap <F5> :NERDTreeToggle<CR>
set number

set foldmethod=indent
set foldlevel=99
nnoremap <space> za

set autoindent

"py3 << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
"    #only for python2: execfile(activate_this, dict(__file__=activate_this))
"EOF

let g:user_emmet_leader_key=','

autocmd BufReadPost *.tex command Pdf write %:t | silent execute '!pdflatex %:t' | redraw!

source ~/.config/nvim/coc.vim
""Coc configuration
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"set updatetime=300
"set shortmess+=c
"set signcolumn=yes
"
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"      let col = col('.') - 1
"        return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"inoremap <silent><expr> <c-space> coc#refresh()
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)
"
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"    if (index(['vim','help'], &filetype) >= 0)
"        execute 'h '.expand('<cword>')
"    else
"        call CocAction('doHover')
"    endif
"endfunction
"
"autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)

"NEOMAKE
call neomake#configure#automake('rw', 1000)


nnoremap <CR> :noh<CR><CR>
set splitbelow
set splitright

tnoremap <Esc> <C-\><C-n>
