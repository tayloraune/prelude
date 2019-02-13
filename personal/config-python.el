(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "--simple-prompt -i --matplotlib=auto --pylab=auto"))
