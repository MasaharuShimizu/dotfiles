" エンコーディングを設定
scriptencoding utf-8
set encoding=utf-8

" カラースキーム
"colorscheme Lucius

" Vi互換モードをオフ(Vimの拡張機能を有効)
set nocompatible

" ### Indent ### {{{

" オートインデント
set autoindent

" 高度なインデント
set smartindent

" タブ文字の代わりにスペース2個を使う場合の設定。
set shiftwidth=2
set tabstop=2

" タブの代わりに空白文字を挿入
set expandtab

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

"スペルチェックから日本語を外す
set spelllang=en,cjk

" }}}

" ### Folding ### {{{
" 折りたたみを示す列を表示
"set foldcolumn=1

" 最初に折りたたみをなるべく開く
"set foldlevel=99

" デフォルトの折りたたみ方法
"set foldmethod=marker

" 折りたたまれたテキストの表示方法
"set foldtext=MyFoldText()
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

" 検索をファイルの先頭にループしない
set nowrapscan

" }}}

" ### Buffer ### {{{

" 外部でファイルが変更されたら自動で読みなおす
set autoread

" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden

" on だと guard が複数回実行されてしまう問題がある
set nowritebackup

" 既存のファイルを開くときはとりあえず utf-8
set fileencodings=utf-8,default,ucs-bom,latin1

" Vim を終了しても undo の記録を残す
set undofile undodir=~/.vimundo

"バックアップフォルダを指定
set backup
set backupdir=~/.vim/backup
set swapfile
set directory=~/.vim/swap

" }}}

" ### View ### {{{

" 背景を暗く設定
set background=dark

" 色づけをオン
syntax enable

" コマンドラインの行数
set cmdheight=2

" 現在行の色を変える
set cursorline
let g:cursorline_flg = 1 " cursorline はウィンドウローカルなのでグローバルなフラグを用意しておく
let g:cursorcolumn_flg = 0

" ステータス行を常に表示
set laststatus=2

"
set textwidth=78

" 行番号を表示
set number

" 不可侵文字を可視化
set list
set listchars=tab:>\ ,extends:<

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

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"vimgrepの結果を常に別ウィンドウに表示するように
autocmd QuickFixCmdPost *grep* cwindow

"カラムガイドを表示
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

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
set wildmode=longest:full

" コマンドの履歴の保存数
set history=2000

" }}}

" ### Misc ### {{{

" 日本語ヘルプ
set helplang=ja

" コマンドを使ったとき、行頭に移動しない
set nostartofline

" バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
" かどうか確認を求める
set confirm

" ビープの代わりにビジュアルベル(画面フラッシュ)を使う
set visualbell

" そしてビジュアルベルも無効化する
set t_vb=

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"Neobundleがfishでは動かなかったので
set shell=/bin/bash

"Yank to clipboard
set clipboard=unnamed,autoselect

"Helpを縦分割で開く
nnoremap <Space>h :<C-u>vert bel h<Space>

"スクロールを速くする
set lazyredraw
set ttyfast

"複数行連続してインデントするため
vnoremap > >gv
vnoremap < <gv

"vim-markdownでのコードフォルディングを無効にする
let g:vim_markdown_folding_disabled=1

"行末の空白を保存時に自動的に削除するようにした
autocmd BufWritePre * :%s/\s\+$//e

" 全モードでマウスを有効化
" set mouse=a

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
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'yuroyoro/vimdoc_ja'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'bling/vim-airline'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'toyamarinyon/vim-swift'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'koron/codic-vim'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'rhysd/vim-operator-surround'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'csscomb/vim-csscomb'
NeoBundle 'fatih/vim-go'
NeoBundle 'nsf/gocode'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'Lokaltog/powerline-fontpatcher'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" vim-airline
let g:airline_powerline_fonts=1
"set guifont=Ricty\ Discord\ Regular\ for\ Powerline:h15
let g:airline_theme='tomorrow'
set laststatus=2
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#left_sep = '|'
"let g:airline#extensions#tabline#left_alt_sep = '|'

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_color_change_percent = 20
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * : highlight IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * : highlight IndentGuidesEven ctermbg=237

" necocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
if !exists('g:neocomplcache_omni_patterns')
      let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
          return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
        endfunction
        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><C-e>  neocomplcache#cancel_popup()
        set completeopt-=preview

        " NERD commenter
        let NERDSpaceDelims = 1

        " Settings for CtrlP
        nnoremap s <Nop>
        nnoremap sb :<C-u>CtrlPBuffer<CR>
        " nnoremap sd :<C-u>CtrlPDir<CR>
        nnoremap sl :<C-u>CtrlPLine<CR>
        nnoremap sm :<C-u>CtrlPMRUFiles<CR>
        nnoremap sp :<C-u>CtrlP<CR>
        nnoremap sq :<C-u>CtrlPQuickfix<CR>
        nnoremap ss :<C-u>CtrlPMixed<CR>
        nnoremap st :<C-u>CtrlPTag<CR>
        nnoremap sw <C-w><C-w>
        nnoremap sn :bn<CR>
        nnoremap <C-p> :<C-u>CtrlPMixed<CR>
        let g:ctrlp_map = '<Nop>'
        let g:ctrlp_cmd = 'CtrlP'
        let g:ctrlp_working_path_mode = 'ra'
        set wildignore+=*/tmp/*,*.so,*.swp,*.zip
        let g:ctrlp_extensions = ['tag', 'quickfix', 'dir', 'line', 'mixed']

        " Settings for vim-operator-surround
        map <silent>sa <Plug>(operator-surround-append)
        map <silent>sd <Plug>(operator-surround-delete)
        map <silent>sr <Plug>(operator-surround-replace)

        " Settings for QuickRun
        nnoremap sc :<C-u>QuickRun<CR>
        let g:quickrun_config={'*': {'split': ''}}
        set splitbelow

        " Settings for incsearch
        set hlsearch
        map /  <Plug>(incsearch-forward)
        map ?  <Plug>(incsearch-backward)
        map g/ <Plug>(incsearch-stay)
        let g:incsearch#auto_nohlsearch = 1
        map n  <Plug>(incsearch-nohl-n)
        map N  <Plug>(incsearch-nohl-N)
        map *  <Plug>(incsearch-nohl-*)
        map #  <Plug>(incsearch-nohl-#)
        map g* <Plug>(incsearch-nohl-g*)
        map g# <Plug>(incsearch-nohl-g#)

        " Settings for vim-textobj-multiblock
        omap ab <Plug>(textobj-multiblock-a)
        omap ib <Plug>(textobj-multiblock-i)
        vmap ab <Plug>(textobj-multiblock-a)
        vmap ib <Plug>(textobj-multiblock-i)

        " Settings for NERDTree
        map <C-n> :NERDTreeToggle<CR>
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

        "カラースキームを設定
        "let g:molokai_original = 1
        colorscheme Lucius
        hi clear SpellBad
        hi SpellBad cterm=underline ctermfg=red

"-------------------------
" End Neobundle Settings.
"-------------------------

" コメント行での改行時に自動的にコメントを挿入しない
autocmd FileType * setlocal formatoptions-=ro

