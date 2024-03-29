(global-set-key [(control h)] 'delete-backward-char)
(global-set-key (kbd "C-?") 'help-command)

;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)

(when (display-graphic-p)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (set-default-font 'terminus))

(global-set-key (kbd "C-x g") 'magit-status)

(add-to-list 'load-path "~/.dotfiles/.emacs.d/")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; ASCII doc editing.
(add-to-list 'auto-mode-alist '("\\\.\\(doc\\|asciidoc\\)$" . doc-mode))
;; YAML editing.
(add-to-list 'auto-mode-alist '("\\.\\(yml\\|yaml\\)$" . yaml-mode))
;; Markdown editing.
(add-to-list 'auto-mode-alist '("\\.\\(md\\|markdown\\)$" . markdown-mode))

(require 'whitespace)

;; Default fill column of 78.
(set-fill-column 78)

(defun mutt-mail-mode-hook()
  (flush-lines "^\\(> \n\\)*> -- \n\\(\n?> .*\\)*") ; kill quoted sigs
  (not-modified)
  (mail-text)
  (whitespace-cleanup)
  (set-fill-column 72)
  (setq whitespace-line-column 72))
(or (assoc "neomutt-" auto-mode-alist)
    (setq auto-mode-alist (cons '("/tmp/neomutt*" . mail-mode) auto-mode-alist)))
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
 '(c-default-style "k&r")
 '(column-number-mode t)
 '(custom-safe-themes
   '("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(ispell-dictionary "british")
 '(ispell-highlight-face 'flyspell-incorrect)
 '(magit-push-always-verify nil)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(org-agenda-files '("~/docs/rp/pf/iana.txt"))
 '(package-selected-packages
   '(d-mode meson-mode color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow php-mode org-magit dpkg-dev-el perl6-mode magit-org-todos lex bison-mode edbi-sqlite ## solarized-theme lua-mode cmake-mode markdown-mode yaml-mode magit))
 '(safe-local-variable-values
   '((buffer-file-coding-system . utf-8-unix)
     (ispell-dictionary . "en_GB")
     (flyspell-mode)
     (flyspell-mode t)))
 '(standard-indent 4)
 '(tab-always-indent t)
 '(tab-width 8)
 '(tool-bar-mode nil))

(load-theme 'sanityinc-tomorrow-night t)

(setq c-default-style "k&r"
      c-basic-offset 4)

;; default to unified diffs
(setq diff-switches "-u")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Mono" :foundry "xos4" :slant normal :weight normal :height 180 :width normal))))
 '(mode-line ((t (:background "gray30" :box (:line-width 1 :color "firebrick") :family "Terminus")))))
(put 'downcase-region 'disabled nil)
