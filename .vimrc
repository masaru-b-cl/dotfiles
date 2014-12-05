" デフォルトエンコーディングをUTF-8にす
" Git 基礎最速マスター - ぐるぐる～
" http://bleis-tift.hatenablog.com/entry/20100307/1267941654
" --
" 香り屋版の vim には verifyenc.vim というプラグインが入っており、
" これが空のファイルの fenc を cp932 に置き換えてしまうので、無効化しておきましょう。
" --
let g:plugin_verifyenc_disable = 1
set fenc=utf-8
if has('gui_running')
  set encoding=utf-8
endif

" tesxtwidthの設定を有効にする
" Vimのtextwidth設定と.vimrc - 続・日々の雑感
" http://d.hatena.ne.jp/WK6/20120606/1338993826
"   
autocmd FileType text setlocal textwidth=0

" @@@ キーマップ
" ビジュアルで選択検索
" 職場で学んだ快適なVim操作のためのtips - TIM Labs
" http://labs.timedia.co.jp/2014/09/learn-about-vim-in-the-workplace.html
" --
" これにより、日時の文字列にカーソルを置いて
"   vi'*:%s//{変更後の日にち}/g<CR>
" といった操作が出来るようになります。
" --
vnoremap * "zy:let @/ = @z<CR>n

" 折り返し行でも上下に移動
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" ステータスラインにファイル名とエンコーディング名表示
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']'}%=\ (%v,%l)/%L%8P\

" @@@ 各種設定
set number
set nobackup
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set wrap
set list
set listchars=tab:»·,trail:·,eol:↲,extends:»,precedes:«,nbsp:%
set cursorline
set magic
" yankをクリップボードと共有
set clipboard=unnamed
set showtabline=2

"デフォルトの最小 window 高さを0に
set winminheight=0
" Ctrl-J/K で上下のWindowへ移動
:nmap <C-J> <C-W>j<C-W>_
:nmap <C-K> <C-W>k<C-W>_

""""""""""""""""""""""""""""""
"全角スペースを表示
""""""""""""""""""""""""""""""
"コメント以外で全角スペースを指定しているので scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"全角スペースが強調表示されない場合、ここでscriptencodingを指定すると良い。
"scriptencoding cp932

"デフォルトのZenkakuSpaceを定義
function! ZenkakuSpace()
  highlight ZenkakuSpace ctermbg=darkgrey gui=underline guibg=#333333
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

vnoremap <silent> <C-p> "0p

set nocompatible               " be iMproved
filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'
NeoBundle 'terryma/vim-multiple-cursors'

filetype plugin indent on     " required!
filetype indent on
syntax on
