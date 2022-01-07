call plug#begin('~/.vim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree' | Plug 'scrooloose/nerdcommenter'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'

" Git Integration
Plug 'tpope/vim-fugitive'

" Web Dev stuff + Rails stuff
Plug 'mattn/emmet-vim' | Plug 'vim-ruby/vim-ruby' | Plug 'tpope/vim-vividchalk' | Plug 'tpope/vim-rails' | Plug 'tpope/vim-surround' | Plug 'tpope/vim-abolish'

" Auto completion
Plug 'valloric/youcompleteme' | Plug 'jiangmiao/auto-pairs'

"better status line
Plug 'vim-airline/vim-airline'

" BasedScript
Plug 'pangloss/vim-javascript'

" This is a simple plugin that helps to end certain structures automatically.
" In Ruby, this means adding end after if, do, def and several other keywords.
" theres support for other random languages as well
Plug 'tpope/vim-endwise'

call plug#end()

inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" open NERDTree automatically
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree

let g:NERDTreeGitStatusWithFlags = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",  
    "\ "Modified"  : "#d9bf91",  
    "\ "Renamed"   : "#51C9FC",  
    "\ "Untracked" : "#FCE77C",  
    "\ "Unmerged"  : "#FC51E6",  
    "\ "Dirty"     : "#FFBD61",  
    "\ "Clean"     : "#87939A",   
    "\ "Ignored"   : "#808080"   
    "\ }                         


let g:NERDTreeIgnore = ['^node_modules$']

" vim-prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
" run prettier on save
let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

set relativenumber

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab

colorscheme vividchalk 

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" If we want to conceal stuff we have this set to 1, otherwise we can set it
" to 0 note that we can add stuff on the fly below if we want to conceal more
" stuff
set conceallevel=1

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
"let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
"let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
"let g:javascript_conceal_arrow_function       = "⇒"
"let g:javascript_conceal_noarg_arrow_function = "🞅"
"let g:javascript_conceal_underscore_arrow_function = "🞅"

"vim-ruby options
let g:ruby_indent_hanging_elements = 1
let ruby_operators = 1
let ruby_pseudo_operators = 1

"Vim will load/eval code to provide completions. This may cause some code
"execution which may be a concern...
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1

"Vim can detect and load the Rails environment for files within a rails
"project.
let g:rubycomplete_rails = 1

"let vim parse our Gemfile.
let g:rubycomplete_load_gemfile = 1

"Vim surround

let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"

"Vim airline settings
let g:airline#extensions#tabline#enabled = 1
