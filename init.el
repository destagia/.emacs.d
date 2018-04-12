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
;; 自動でファイルをリロード
(global-auto-revert-mode t)

(setq default-tab-width 4)


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
(global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x c") 'helm-find)

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

;; Font
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(yaml-mode dockerfile-mode company-go flycheck markdown-mode material-theme helm auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#263238" :foreground "#ffffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "nil" :family "PT Mono")))))

;; Goのパスを通す
(add-to-list 'exec-path (expand-file-name "/Users/shohei.miyashita/.goenv/shims"))

;; go get で入れたツールのパスを通す
(add-to-list 'exec-path (expand-file-name "/Users/shohei.miyashita/.go"))

;; 必要なパッケージのロード
(require 'go-mode)
(require 'company-go)

;; 諸々の有効化、設定
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook (lambda()
           (add-hook 'before-save-hook' 'gofmt-before-save)
           (local-set-key (kbd "M-.") 'godef-jump)
           (set (make-local-variable 'company-backends) '(company-go))
           (company-mode)
           (setq indent-tabs-mode nil)    ; タブを利用
           (setq c-basic-offset 4)        ; tabサイズを4にする
           (setq tab-width 4)))

