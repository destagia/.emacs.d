;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)
;; 行数の表示
(global-linum-mode t)
(setq linum-format "%4d ")
;; 行間
(setq-default line-spacing 0.2)
;; 現在行をハイライト
(global-hl-line-mode t)
;; 対応する括弧をハイライト
(show-paren-mode t)
;; 括弧のハイライトの設定
(setq show-paren-style 'mixed)
;; 選択範囲をハイライト
(transient-mark-mode t)
;; 空白を可視化
;; (global-whitespace-mode 1)


;; メニューバーを非表示
(menu-bar-mode 0)
;; ツールバーを非表示
(tool-bar-mode 0)

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; HELM
(require 'helm-config)
(helm-mode t)
(global-set-key (kbd "M-x") 'helm-M-x)

;; Auto Complete
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'text-mode)         ; text-modeでも自動的に有効にする
(add-to-list 'ac-modes 'fundamental-mode)  ; fundamental-mode
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'yatex-mode)
(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)                   ; 補完メニュー表示時にC-n/C-pで補完候補選択
(setq ac-use-fuzzy t)                      ; 曖昧マッチ

;; Markdown
(setq markdown-command "multimarkdown")

;; Theme
(load-theme (quote material) t)


;; Color
(if window-system (progn
    (set-frame-parameter nil 'alpha 90) ;透明度
    ))

