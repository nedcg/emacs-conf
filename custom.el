(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'bind-key)

(use-package hydra
  :ensure t)

(use-package beacon
  :ensure t
  :demand t
  :diminish beacon-mode
  :config
  (beacon-mode 1))

(use-package smex
  :ensure t
  :config
  (smex-initialize))

(use-package cider
  :ensure t)

(use-package web-mode
  :ensure t
  :mode ("\\.html$" . web-mode))

(use-package json-mode
  :ensure t
  :mode "\\.json$")

(use-package yaml-mode
  :ensure t
  :mode (("\\.yml$" . yaml-mode)
	 ("\\.yaml$" . yaml-mode)))

(use-package nginx-mode
  :ensure t
  :commands (nginx-mode))

(use-package find-file-in-project
  :ensure t
  :bind* (("M-m p" . ffip))
  :config)

(use-package avy
  :ensure t
  :init
  (setq avy-keys-alist
        `((avy-goto-char-timer . (?a ?s ?d ?f ?g ?h ?j ?k ?l ?\;))
          (avy-goto-line . (?a ?s ?d ?f ?g ?h ?j ?k ?l ?\;))))
  (setq avy-style 'pre)
  :bind* (("M-m f" . avy-goto-char-timer)
          ("M-m F" . avy-goto-line)))

(use-package multiple-cursors
  :ensure t
  :bind (("C-s-c C-s-c" . 'mc/edit-lines)
         ("C->" . 'mc/mark-next-like-this)
         ("C-<" . 'mc/mark-previous-like-this)
         ("C-c C-<" . 'mc/mark-all-like-this)))

(use-package dumb-jump
  :ensure t
  :bind (("C-c S" . dumb-jump-go))
  :config
  (dumb-jump-mode))

(use-package smartparens
  :ensure t
  :bind
  ("C-c <up>" . sp-raise-sexp)
  ("ESC <up>" . sp-select-next-thing)
  ("C-M-t" . sp-transpose-sexp)
  ("C-M-k" . sp-kill-sexp)
  :diminish smartparens-mode
  :diminish smartparens-strict-mode
  :config
  (require 'smartparens-config)
  (smartparens-global-mode)
  (smartparens-global-strict-mode)
  (show-smartparens-global-mode)
  (sp-pair "(" ")" :wrap "C-c (")
  (sp-pair "[" "]" :wrap "C-c [")
  (sp-pair "{" "}" :wrap "C-c {")
  (sp-pair "'" "'" :wrap "C-c '")
  (sp-pair "\"" "\"" :wrap "C-c \""))

(use-package iedit
  :ensure t
  :commands (iedit-mode)
  :bind* (("M-m R" . iedit-mode)
	  ("M-m r" . iedit-mode-toggle-on-function)))

(use-package aggressive-indent
  :ensure t)

(use-package rainbow-delimiters
  :ensure t)

(use-package clojure-mode
  :ensure t
  :init
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode)
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  ;; clojurescript
  (add-hook 'clojurescript-mode-hook #'aggressive-indent-mode)
  (add-hook 'clojurescript-mode-hook #'rainbow-delimiters-mode))

(use-package rainbow-mode
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(clojure-keyword-face ((t (:foreground "black" :weight bold))))
 '(font-lock-comment-face ((t (:background "color-230"))))
 '(font-lock-function-name-face ((t (:foreground "blue1" :underline t))))
 '(font-lock-variable-name-face ((t (:foreground "blue1")))))
