let g:plugin_verifyenc_disable = 1

set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp
if has('gui_running')
  set encoding=utf-8
endif


" tesxtwidthの設定を有効にする
" Vimのtextwidth設定と.vimrc - 続・日々の雑感
" http://d.hatena.ne.jp/WK6/20120606/1338993826
autocmd FileType text setlocal textwidth=0

" ファイル形式検出
filetype on

" シンタックスハイライト機能
syntax on

" 折り返し行でも上下に移動
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" カーソルの箇所から行末までをヤンク
nnoremap Y y$

" インクリメント/デクリメント
nnoremap + <C-a>
nnoremap - <C-x>

" ビジュアルで選択検索
"   職場で学んだ快適なVim操作のためのtips - TIM Labs
"   http://labs.timedia.co.jp/2014/09/learn-about-vim-in-the-workplace.html
vnoremap * "zy:let @/ = @z<CR>n

" ステータスラインにファイル名とエンコーディング名表示
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']'}%=\ (%v,%l)/%L%8P\

" 行番号：表示
set number

" バックアップ：なし
set nobackup

" タブ展開：あり
set expandtab

" タブ幅：2
set tabstop=2
set shiftwidth=2

" 自動インデント：あり
set autoindent

" 折り返し：あり
set wrap

" リストモード：オン
set list
set listchars=tab:»·,trail:·,eol:↲,extends:»,precedes:«,nbsp:%

" カーソル行：あり
set cursorline

" 正規表現でvery magicを使う
set magic
nnoremap / /\v

" ヤンクした内容をクリップボードに保管する
set clipboard=unnamed

" タブを常に表示
set showtabline=2

" インクリメント時の数値を10進数として扱う
set nrformats=""

" 最終行を表示出来るだけ表示する
set display=lastline

" 対応する括弧を1秒間強調表示する
set showmatch
set matchtime=1

" アンドゥファイルを一つのフォルダーにまとめる
set undodir=~/.vim/undo

"デフォルトの最小 window 高さを0に
set winminheight=0

" Ctrl-J/K で上下のWindowへ移動
nmap <C-J> <C-W>j<C-W>_
nmap <C-K> <C-W>k<C-W>_

" <C-p>でヤンクした文字を変えずに連続貼付けする
"   http://qiita.com/fukajun/items/bd97a9b963dae40b63f5
vnoremap <silent> <C-p> "0p

" ### NeoBundle ###
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
 set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" ### neocomplete ###
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" ### neosnippet ###
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
