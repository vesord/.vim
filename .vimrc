"
"	Vundle
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()
filetype plugin indent on

"
"	YCM
"
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"


"
"	SETTINGS
"
syntax on
set number
set smartindent
set tabstop=4
set shiftwidth=4

set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey

"
"	MATRUS HEADER
"
au BufWritePre,FileWritePre *.c ks|exe "%s+Updated: .* by+Updated: " .
\ strftime("%d/%m/%Y %H:%M:%S") . " by+g"|'s
map ,a :call WriteAuthorHeader()<CR>
fun WriteAuthorHeader()
	let l = line(".") - 1
	let cmnd = "r ~/.vim/templates/head_template"
	exec join([l, cmnd])
	let t = strftime("%d/%m/%Y %H:%M:%S")
	let n = "matrus"
	let f = expand("%:t")
	let sp = repeat(' ', len(f)+3)
	exe l+3 . "s/" . sp . "/  " f
	exe l . "," l+11 . "s/By:       /By: " . n
	exe l . "," l+11 . "s+Updated:                    +Updated: " . t
	exe l . "," l+11 . "s+Created:                    +Created: " . t
	exe l . "," l+11 . "s/by       /by " . n
	call cursor(l+13, 1)
endfun
