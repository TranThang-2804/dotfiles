nnoremap <CR> O<Esc>j
nmap j jzz
nmap k kzz
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-y> <C-y>zz
nnoremap <C-e> <C-e>zz
nnoremap <BS> kdd
nnoremap J gT
nnoremap K gt

nmap g* g*zz
nmap g# g#zz
nmap gD gDzz
nmap gd gdZZ

vmap <Tab> >gv
vmap <S-Tab> <gv

call plug#begin()
Plug 'tpope/vim-surround'
call plug#end()
