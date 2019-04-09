(defvar tayloraune/packages '(ac-slime
                              auto-complete
                              autopair
                              cider
                              clojure-mode
                              elpy
                              ess
                              f
                              feature-mode
                              flycheck
                              graphviz-dot-mode
                              heaven-and-hell
                              htmlize
                              magit
                              markdown-mode
                              nyan-mode
                              org
                              paredit
                              powerline
                              rvm
                              rg
                              smex
                              smart-mode-line
                              solarized-theme
                              web-mode
                              writegood-mode
                              yaml-mode)
  "Default packages")

(defun tayloraune/packages-installed-p ()
  (loop for pkg in tayloraune/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (tayloraune/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg tayloraune/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(require 'autopair)

(require 'f)

(elpy-enable)
(global-set-key (kbd "C-x k") 'kill-this-buffer)

(require 'nyan-mode)
(nyan-mode 1)

(setq heaven-and-hell-theme-type 'dark)
(setq heaven-and-hell-themes
      '((light . solarized-light)
        (dark . solarized-dark)))
;; Add init-hook so heaven-and-hell can load your theme
(add-hook 'after-init-hook 'heaven-and-hell-init-hook)

;; Set keys to toggle theme and return to default emacs theme
(global-set-key (kbd "C-c <f6>") 'heaven-and-hell-load-default-theme)
(global-set-key (kbd "<f6>") 'heaven-and-hell-toggle-theme)

(require 'smart-mode-line)
(setq sml/mode-width 0)
(setq sml/name-width 20)
(setq rm-whitelist "monkey")
(setq rm-blacklist nil)
(sml/setup)

(when (memq window-system '(mac ns x))
  (setq exec-path-from-shell-variables
        (append exec-path-from-shell-variables
                '("environment" "test_environment"
                  "USER" "WB_ROOT")))
  (exec-path-from-shell-initialize))
