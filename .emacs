;; Change default for backspace and help.
;; Emacs does not adhere to the *NIX tradition that C-h is backspace.
(global-set-key [(control h)] 'delete-backward-char)
(global-set-key (kbd "C-?") 'help-command)

(global-set-key (kbd "C-x g") 'magit-status)

(menu-bar-mode -1)
(tool-bar-mode -1)
;;(scroll-bar-mode -1)

(add-to-list 'load-path "~/.dotfiles/.emacs.d/")

(require 'doc-mode)
;; ASCII doc editing.
(add-to-list 'auto-mode-alist '("\\\.\\(doc\\|asciidoc\\)$" . doc-mode))

(require 'yaml-mode)
;; YAML editing.
(add-to-list 'auto-mode-alist '("\\.\\(yml\\|yaml\\)$" . yaml-mode))

(require 'whitespace)

(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Default fill column of 78.
(set-fill-column 78)

(defun mutt-mail-mode-hook()
  (flush-lines "^\\(> \n\\)*> -- \n\\(\n?> .*\\)*") ; kill quoted sigs
  (not-modified)
  (mail-text)
  (whitespace-cleanup)
  (set-fill-column 72)
  (setq whitespace-line-column 72))
(or (assoc "mutt-" auto-mode-alist)
    (setq auto-mode-alist (cons '("/tmp/mutt*" . mail-mode) auto-mode-alist)))
(add-hook 'mail-mode-hook 'mutt-mail-mode-hook)

(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(setq line-number-mode t)
(setq column-number-mode t)

;; Backup files are annoying and tabs are evil.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(custom-safe-themes (quote ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(ispell-dictionary "en_GB-ise")
 '(ispell-highlight-face (quote flyspell-incorrect))
 '(make-backup-files nil)
 '(standard-indent 4)
 '(tab-width 8))

(require 'magit)

(require 'dash)
(require 's)

(-each
   (-map
      (lambda (item)
      (format "~/.emacs.d/elpa/%s" item))
   (-filter
      (lambda (item) (s-contains? "theme" item))
      (directory-files "~/.emacs.d/elpa/")))
   (lambda (item)
      (add-to-list 'custom-theme-load-path item)))

(load-theme 'sanityinc-solarized-dark)
(set-default-font 'terminus)
