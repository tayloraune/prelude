;; Fill
(setq-default fill-column 100)
(setq whitespace-line-column 101)

(add-hook
 'term-mode-hook
 (lambda() (setq show-trailing-whitespace nil)))
