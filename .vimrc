let g:plugin_verifyenc_disable = 1

set fileencoding=utf-8 bomb
set fileencodings=ucs-bom,utf-8,cp932,utf-16,utf-16le,euc-jp,iso-2022-jp

" ファイル形式検出
filetype on

" シンタックスハイライト機能
syntax on

" ステータスラインにファイル名とエンコーディング名表示
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\

" 行番号：表示
set number

" バックアップ先を一つのフォルダーにまとめる
set backupdir=~/.vim/backup

" アンドゥファイルを一つのフォルダーにまとめる
set undodir=~/.vim/undo

" スワップファイルを一つのフォルダーにまとめる
set directory=~/.vim/swp

" タブ展開：あり
set expandtab

" タブ幅：2
set tabstop=2

" 自動インデント：あり
set autoindent

" 折り返し：あり
set wrap

" インデントされた行を折り返したとき、折り返し後行の開始位置をインデントに合わせる
set breakindent

" リストモード：オン
set list

" カーソル行：あり
set cursorline

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

" デフォルトの最小 window 高さを0に
set winminheight=0

" カレントディレクトリを自動で変更する
set autochdir

" ウィンドウ分割時、現在のウィンドウだけ半分に分割する
set noequalalways

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
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'glidenote/memolist.vim'

call neobundle#end()

" Required:
filetype plugin indent on
syntax enable

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

" memolist.vim
let g:memolist_path = "~/Documents/memo"
let g:memolist_memo_suffix = "markdown"
let g:memolist_memo_suffix = "md"
let g:memolist_unite = 1
let g:memolist_unite_option = "-start-insert"
