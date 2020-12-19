
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(require 'xscheme)
;; https://github.com/emacs-dashboard/emacs-dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)

(setq dashboard-startup-banner 'logo)
(setq dashboard-center-content t)
(setq initial-frame-alist '((width . 120) (height . 36)))
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa-stable" . "https://stable.melpa.org/packages/")))
(setq scheme-program-name "/usr/bin/scheme")
(setq cider-default-repl-command "lein")
(setq inferior-lisp-program "/usr/bin/clisp")

(global-display-line-numbers-mode)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("2cbd2a0d861fd6baf446f4393f3c5ed00ed861fe9c9073c87a7c8438ada877d4" default)))
 '(org-startup-truncated nil)
 '(package-selected-packages
   (quote
    (dashboard rainbow-blocks slime cider clojure-mode-extra-font-locking clojure-mode go-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; 2020.05.29 Add go-mode indent and autoformat
(add-hook 'go-mode-hook
	  (lambda ()
	    (add-hook 'before-save-hook 'gofmt-before-save)
	    (setq tab-width 4)
	    (setq indent-tabs-mode 1)))

