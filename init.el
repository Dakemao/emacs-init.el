
 

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;;cvt 1440 900
;;xrandr --newmode 1440x900 106.50 1440 1528 1672 1904 900 903 909 934 -hsync +vsync
;;xrandr --addmode DVI-1 1440x900
;;xrandr --output DVI-1 --mode 1440x900


;;export LC_CTYPE=zh_CN.UTF-8
;; You may delete these explanatory comments.
;;(package-initialize)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
)

(require 'cl)
;; add whatever you want package blow here
(defvar dklee/packages '(
			 company
			 plan9-theme
			 hungry-delete
			 swiper
			 counsel
			 smartparens
			 js2-mode
			 popwin
			 php-mode
			 web-mode
			 dash
			 multiple-cursors
			 js2-refactor
			 expand-region
			 ;;org-pomodoro
			 pomodoro
			 ;;helm-ag
			 powerline
			 ) "Default packages")

(setq package-selected-packages dklee/packages)

(defun dklee/packages-installed-p () 
  (loop for pkg in dklee/packages 
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (dklee/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg dklee/packages)
    (when (not (package-installed-p pkg)) 
      (package-install pkg))))


(tool-bar-mode -1)
(scroll-bar-mode -1)
(electric-indent-mode -1)

(global-linum-mode t)

(setq inhibit-splash-screen t)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)

(global-company-mode t)
(setq-default cursor-type 'bar)
(setq make-backup-files nil)

(require 'org)
(setq org-src-fontify-natively t)

(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-file)

(delete-selection-mode t)

(setq initial-frame-alist (quote ((fullscreen . maximized))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;show current line
(global-hl-line-mode t)

(load-theme 'plan9 t)

;;hungry delete
(require 'hungry-delete)
(global-hungry-delete-mode)


;;configurations swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)

;;configurations smartparens
(require 'smartparens-config)
(smartparens-global-mode t)

;;config js2-mode
(setq auto-mode-alist 
      (append '(("\\.js\\'" . js2-mode)) 
	      auto-mode-alist))


(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "C-c a") 'org-agenda)

(global-auto-revert-mode t)

;;popwin
(require 'popwin)
(popwin-mode 1)

(setq ring-bell-function 'ignore)

(fset 'yes-or-no-p 'y-or-n-p)

(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(put 'dired-find-alternate-file 'disable nil)

(require 'dired-x)
(setq dired-dwim-target t)

;;config php
(eval-after-load 'php-mode
  '(require 'php-ext))

;;config cursor
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)


;;config js2-refactor
(require 'js2-refactor)
    (add-hook 'js2-mode-hook #'js2-refactor-mode)
    (js2r-add-keybindings-with-prefix "C-c C-m")

;;config expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;;config org-pomodoro
;;(require 'org-pomodoro)

;;config pomodoro
(require 'pomodoro)
(pomodoro-add-to-mode-line)

;;config change M-n M-p to C-n C-p
(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;;powerline
(require 'powerline)
(powerline-default-theme)





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.3)
 '(custom-safe-themes
   (quote
    ("ebe90a9395fe0f2ac2f9bf8589daf28dc027b427b3e569e7b1eea795a924a136" default)))
 '(org-pomodoro-length 35))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


