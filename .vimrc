execute pathogen#infect()

"Some basic setup.
set nocompatible
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set number
set paste
"set relativenumber
set ignorecase
set smartcase

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set omnifunc=syntaxcomplete#Complete

"Remapping pane switches for added smoothness
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Remap Ctrl+P to previous command-line command
:noremap <C-P> @:<CR>

" Forked tpozzi/Sidonia:
" github.com/jonathanprouse/Sidonia
colorscheme ron

" github.com/Townk/vim-autoclose
helptags ~/.vim/bundle/vim-autoclose/doc

" NERDtree
" github.com/scrooloose/nerdtree
helptags ~/.vim/bundle/nerdtree/doc
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" YouCompleteMe
" github.com/Valloric/YouCompleteMe
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:loaded_youcompleteme = 1 " Disabled for now

" VimWiki
" github.com/vimwiki/vimwiki
" Set vfile to open link with vim
function! VimwikiLinkHandler(link)
  " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
  "   1) [[vfile:~/Code/PythonProject/abc123.py]]
  "   2) [[vfile:./|Wiki Home]]
  let link = a:link
  if link =~# '^vfile:'
    let link = link[1:]
  else
    return 0
  endif
  let link_infos = vimwiki#base#resolve_link(link)
  if link_infos.filename == ''
    echomsg 'Vimwiki Error: Unable to resolve link!'
    return 0
  else
    exe 'tabnew ' . fnameescape(link_infos.filename)
    return 1
  endif
endfunction

" Setting syntax highlighting
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'erlang': 'erlang'}
let g:vimwiki_list = [wiki]

