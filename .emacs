;; キーワードのカラー表示を有効化
;; 「t」の部分を「nil」にするとカラー表示をOffにできる

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(global-font-lock-mode t)

;; テキストエンコーディングとしてUTF-8を優先的に使用する
;; 「utf-8」の部分を「cp932」とするとCP932（Windows用Shift JIS）優先となる
(prefer-coding-system 'utf-8)

;; 起動時のメッセージを表示しない
;;「t」を「nil」にするとメッセージが表示される
(setq inhibit-startup-message nil)

;; 選択範囲をハイライトする
;;「t」を「nil」にするとハイライトなしに
(setq-default transient-mark-mode t)

;;; 行番号・桁番号をモードラインに表示する・しない設定
(line-number-mode t) ; 行番号。tなら表示、nilなら非表示
(column-number-mode t) ; 桁番号。tなら表示、nilなら非表示

;; 対応するカッコをハイライト表示する
(show-paren-mode 1)

;; オートセーブOff
;; 「nil」を「t」にするとOnに
(auto-save-mode nil)

;; バックアップファイルを作る
;; 「nil」を「t」にするとバックアップファイルを作らない
(setq backup-inhibited t)
;;default setting
;;(setq backup-inhibited t)

;; 下記の「nil」を「t」とすると終了時にオートセーブファイルが削除される
(setq delete-auto-save-files t)

;; モードラインに現在時刻を表示する
;;(display-time)

;; CarbonEmacsでIMを利用するための設定（CarbonEmacsのみ必要）
;;(set-keyboard-coding-system 'sjis-mac)
;;(set-clipboard-coding-system 'sjis-mac)

;; Meadow向けの日本語環境設定（Meadowのみ必要）
;;(set-language-environment "Japanese")
;;(mw32-ime-initialize)
;;(setq default-input-method "MW32-IME")

;; カレントディレクトリをホームディレクトリに設定
;; ""内は任意のディレクトリを指定可能
(cd "~/")

;; 選択範囲の色を指定
(set-face-background 'region "SkyBlue")
(set-face-foreground 'region "black")

;; 起動時のウィンドウサイズ、色などを設定
(if (boundp 'window-system)
    (setq default-frame-alist
          (append (list
                   '(foreground-color . "white")  ; 文字色
                   '(background-color . "black")  ; 背景色
                   '(border-color     . "white")  ; ボーダー色
                   '(mouse-color      . "black")  ; マウスカーソルの色
                   '(cursor-color     . "black")  ; カーソルの色
                   '(cursor-type      . box)      ; カーソルの形状
                   '(top . 60) ; ウィンドウの表示位置（Y座標）
                   '(left . 140) ; ウィンドウの表示位置（X座標）
                   '(width . 80) ; ウィンドウの幅（文字数）
                   '(height . 40) ; ウィンドウの高さ（文字数）
                   )
                  default-frame-alist)))
(setq initial-frame-alist default-frame-alist )
(electric-pair-mode 1)
