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

vnoremap <silent> <C-p> "0p

set nocompatible               " be iMproved
filetype off

" neobundle関連
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'w0ng/vim-hybrid'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
