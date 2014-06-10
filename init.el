;; Load el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(setq el-get-sources
      '(evil
	evil-leader
        key-chord
        color-theme
        monokai-theme
        flycheck
        haskell-mode
        structured-haskell-mode
        powerline
        es-lib
        auto-complete
	     yasnippet))

(el-get 'sync el-get-sources)

;;evil leader
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key 
  "b" 'switch-to-buffer)
;;Enable evil mode
(require 'evil)
(evil-mode 1)
;;Set ESC to jk in insert mode
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

;;Disable toolbar
(tool-bar-mode -1)

;;Theme
(load-file "~/.emacs.d/el-get/monokai-theme/monokai-theme.el")
(color-theme-monokai)

;;Show line numbers
(global-linum-mode t)

;;Disable startup screen
(setq inhibit-startup-screen t)

;;Set fonts
(add-to-list 'default-frame-alist
                       '(font . "Menlo for Powerline-18"))

;;Powerline
(require 'powerline)
(powerline-default-theme)

;;Auto-complete
(require 'auto-complete)

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(setq default-directory "~")

(require 'haskell-mode)
(require 'shm)
(add-hook 'haskell-mode-hook 'structured-haskell-mode)

(iswitchb-mode 1)

(require 'flycheck)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

(require' yasnippet)
(yas-global-mode 1)
