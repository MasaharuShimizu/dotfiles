" エンコーディングを設定
scriptencoding utf-8
set encoding=utf-8
"タブ文字、行末など不可視文字を表示する
set list
"検索時に大文字を含んでいたら大/小を区別
set ignorecase
set smartcase
"検索をファイルの先頭へループしない
set nowrapscan
"削除でヤンクしない
nnoremap x "_x
"Yank to clipboard
set clipboard=unnamed

"タブ関係の設定
"タブの代わりに空白文字を挿入する
set expandtab
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"シフト移動幅
set shiftwidth=4
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
