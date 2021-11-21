(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; vertical minibuffer
(straight-use-package 'ivy)
(straight-use-package 'counsel)
(straight-use-package 'ivy-rich)
(require 'ivy-rich)
(ivy-rich-mode 1)
(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; better-defaults
(straight-use-package
 '(better-defaults :type git :host github :repo "juniorxxue/better-defaults"))
(defalias 'yes-or-no-p 'y-or-n-p)
(require 'better-defaults)

;; $PATH
(straight-use-package 'exec-path-from-shell)
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; theme
(set-frame-font "Source Code Pro 15")
(straight-use-package 'spacemacs-theme)
(require 'spacemacs-light-theme)
(load-theme 'spacemacs-light t)
(add-to-list 'default-frame-alist '(ns-transparent-titlebar .t))

(straight-use-package
 '(splash-screen :type git :host github :repo "juniorxxue/emacs-splash"))
(require 'splash-screen)

(straight-use-package 'mood-line)
(require 'mood-line)
(mood-line-mode)

;; scroll
(straight-use-package 'good-scroll)
(require 'good-scroll)
(good-scroll-mode 1)
(global-set-key (kbd "M-j") #'good-scroll-up)
(global-set-key (kbd "M-k") #'good-scroll-down)
