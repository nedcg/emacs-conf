(setq-default cursor-type '(bar . 1)
              show-trailing-whitespace t
              indicate-empty-lines t
              truncate-lines t)

(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      backup-by-copying t
      backup-directory-alist `(("." . "~/.saves"))
      create-lockfiles nil
      custom-file (expand-file-name "custom.el" user-emacs-directory)
      delete-old-versions t
      indent-tabs-mode nil
      inhibit-splash-screen t
      inhibit-startup-message t
      initial-major-mode 'fundamental-mode
      initial-scratch-message ""
      kept-new-versions 6
      kept-old-versions 2
      large-file-warning-threshold (* 15 1024 1024)
      mac-command-modifier 'none
      mac-option-modifier 'meta
      mac-right-option-modifier 'super
      mac-right-command-modifier 'hyper
      make-backup-files nil
      sentence-end-double-space nil
      tab-width 2
      user-full-name "Eduardo Caceres"
      user-mail-address "nedcg@outlook.com"
      version-control t
      x-select-enable-clipboard t)

(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)
(tooltip-mode 0)
(delete-selection-mode t)
(transient-mark-mode t)
(subword-mode)

(defun sk/smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.
Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.
If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))
  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))
  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(defalias 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; remap C-a to `smarter-move-beginning-of-line`
(global-set-key [remap move-beginning-of-line]
                'sk/smarter-move-beginning-of-line)

(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(when (file-exists-p custom-file)
  (load custom-file))
