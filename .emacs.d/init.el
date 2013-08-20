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
