(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "--simple-prompt -i --matplotlib=auto --pylab=auto"))
(add-hook 'elpy-mode-hook
          (lambda ()
            (local-unset-key (kbd "M-TAB"))
            (define-key elpy-mode-map (kbd "<f5>") 'elpy-company-backend)))
(setenv "WORKON_HOME" "/Users/taylor.aune/anaconda3/envs")
(pyvenv-mode 1)
