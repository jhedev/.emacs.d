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
        key-chord
        color-theme
        monokai-theme
        flycheck
        haskell-mode
        powerline
        es-lib
        auto-complete
	    ))


(el-get 'sync el-get-sources)

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

(require 'auto-complete)

