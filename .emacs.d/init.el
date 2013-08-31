;;
;; init.el created by Saneyuki Tadokoro
;;

;; General settings
(add-to-list 'load-path "~/.emacs.d/")

; Encoding
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)

; Disable automatic saving and making backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

; Do not add new line to end of file
(setq next-line-add-newlines nil)

; Show scroll bar in right
(set-scroll-bar-mode 'right)

; Indent and tabs
(setq js-indent-level 2)
(setq default-tab-width 2)
(setq-default tab-width 2 indent-tabs-mode nil)
(setq-default tab-always-indent nil)
(setq-default indent-line-function 'insert-tab)
(setq-default tab-stop-width 2)
(setq-default tab-stop-list '(2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 66 68 70 72 74 76 78 80 82 84 86 88 90 92 94 96 98 100 102 104 106 108 110 112 114 116 118 120 122 124 126 128 130 132 134 136 138 140 142 144 146 148 150 152 154 156 158 160 162 164 166 168 170 172 174 176 178 180 182 184 186 188 190 192 194 196 198 200))

;(define-key global-map "\C-7" 'backward-char)
;(define-key global-map "\C-8" 'next-line)
;(define-key global-map "\C-9" 'previous-line)
;(define-key global-map "\C-0" 'forward-char)
;(global-set-key [?\C-0] 'forward-char)
;(define-key global-map "\C-m" 'backward-char)

;(define-key global-map "\e[48;5u" 'forward-char)
;(define-key global-map "\e[48;5u" [?\C-0])
;(global-set-key [?\C-0] 'forward-char)

(define-key global-map "\C-h" 'previous-line)


;; sr-speedbar
(require 'sr-speedbar)

; Speedbar width
(setq sr-speedbar-width 40)
(setq sr-speedbar-width-x 40)
(setq sr-speedbar-width-console 40)

; Put the speedbar sidebar on the left
(setq sr-speedbar-right-side nil)

; Do not hide unknown files
(setq speedbar-show-unknown-files t)

;
(setq speedbar-smart-directory-expand-flag t)

; Do not use images
(setq speedbar-use-images nil)

; Starting sr-speedbar
(sr-speedbar-open)

(define-key esc-map "`" 'sr-speedbar-toggle)


;; tabbar
(require 'tabbar)

; Starting tabbar mode
(tabbar-mode 1)

; Disable to create tab groups
(setq tabbar-buffer-groups-function nil)
; Make tab space 2.0px
(setq tabbar-separator '(2.0))

; Disable tabbar button
(dolist (btn '(tabbar-buffer-home-button
	       tabbar-scroll-left-button
	       tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
		 (cons "" nil))))

; Set bar color
(set-face-attribute
 'tabbar-default nil
:background "white"
:foreground "black"
:height 1.0)

; Set active bar color
(set-face-attribute
 'tabbar-selected nil
:background "green"
:foreground "black"
:weight 'bold
:box nil)

; Set inactive bar color
(set-face-attribute
 'tabbar-unselected nil
:background "white"
:foreground "black"
:box nil)

(define-key esc-map "]" 'tabbar-forward)
(define-key esc-map "[" 'tabbar-backward)

(require 'php-mode)

(add-to-list 'auto-mode-alist
						 '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))
