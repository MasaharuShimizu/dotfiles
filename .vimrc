" カラースキーム
colorscheme Lucius

set background=dark

" Vi互換モードをオフ(Vimの拡張機能を有効)
set nocompatible

" ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
filetype indent plugin on

" ### Indent ### {{{

" オートインデント
set autoindent

" 高度なインデント
set smartindent

" タブ文字の代わりにスペース2個を使う場合の設定。
" この場合、'tabstop'はデフォルトの8から変えない。
set shiftwidth=2
set softtabstop=2
set expandtab

" 空白文字をいい感じで挿入
set smarttab

" }}}

" ### Folding ### {{{
" 折りたたみを示す列を表示
set foldcolumn=1

" 最初に折りたたみをなるべく開く
set foldlevel=99

" デフォルトの折りたたみ方法
set foldmethod=marker

" 折りたたまれたテキストの表示方法
set foldtext=MyFoldText()
" }}}

" ### Search ### {{{
" ハイライトで検索
set hlsearch
nohlsearch

" 大文字小文字を無視
set ignorecase

" インクリメンタル検索
set incsearch

" 大文字が入力されたら大文字小文字を区別する
set smartcase
" }}}

" ### Buffer ### {{{

" 外部でファイルが変更されたら自動で読みなおす
set autoread

" 隠れ状態にしない
set nohidden

" swapファイルは不要
set noswapfile

" on だと guard が複数回実行されてしまう問題がある
set nowritebackup

" 既存のファイルを開くときはとりあえず utf-8
set fileencodings=utf-8,default,ucs-bom,latin1

" Vim を終了しても undo の記録を残す
set undofile undodir=~/.vimundo

" }}}

" ### View ### {{{
" 色づけをオン
syntax on

" コマンドラインの行数
set cmdheight=2

" 現在行の色を変える
set cursorline
let g:cursorline_flg = 1 " cursorline はウィンドウローカルなのでグローバルなフラグを用意しておく
let g:cursorcolumn_flg = 0

" ステータス行を常に表示
set laststatus=2

" 自動改行しない
set textwidth=0

" 行番号を表示
set number

" 不可侵文字を可視化
set list
set listchars=tab:>\ "

" 最低でも上下に表示する行数
set scrolloff=5

" 入力したコマンドを画面下に表示
set showcmd

" 行番号の色
highlight LineNr ctermfg=white

" タブページのラベルを常に表示
" set showtabline=2

" 長い行を @ にさせない
set display=lastline

" vim の継続行(\)のインデント量を 0 にする
let g:vim_indent_cont = 0

" 補完メニューで preview しない
set completeopt-=preview

" 画面最下行にルーラーを表示する
set ruler

" }}}

" ### Input ### {{{

" backspaceで削除できる文字
set backspace=indent,eol,start

" キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
set notimeout ttimeout ttimeoutlen=200

" <F11>キーで'paste'と'nopaste'を切り替える
set pastetoggle=<F11>

" Yの動作をDやCと同じにする
map Y y$

" <C-L>で検索後の強調表示を解除する
nnoremap <C-L> :nohl<CR><C-L>

" }}}

" ### Command ### {{{

" コマンドライン補完
set wildmenu

" コマンドライン補完の方法
set wildmode=longest:full,full

" コマンドの履歴の保存数
set history=2000

" }}}

" ### Misc ### {{{

" 日本語ヘルプ
set helplang=ja

" K でヘルプを引く
set keywordprg=:help

" コマンドを使ったとき、行頭に移動しない
set nostartofline

" バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
" かどうか確認を求める
set confirm

" ビープの代わりにビジュアルベル(画面フラッシュ)を使う
set visualbell

" そしてビジュアルベルも無効化する
set t_vb=

" 全モードでマウスを有効化
set mouse=a

" }}}

" オリジナル foldtext
function! MyFoldText()
  let line = getline(v:foldstart)
  let marker_removed = substitute(line, '{{{', '', 'g') " }}}
  let line_count = v:foldend - v:foldstart
  let lines = line_count > 1 ? ' lines' : ' line'
  let count_in_brace = substitute(marker_removed, '{\s*$', '{ ('.line_count.lines.') }', '')
  return count_in_brace
endfunction

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" 以下追加プラグイン

call neobundle#end()

" Required:
filetype plugin indent on

"-------------------------
" End Neobundle Settings.
"-------------------------

" コメント行での改行時に自動的にコメントを挿入しない
autocmd FileType * setlocal formatoptions-=ro

