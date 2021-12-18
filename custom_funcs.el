;;; custom_funcs.el -*- lexical-binding: t; -*-

 ;; (defun spacemacs/python-toggle-breakpoint ()
 ;;   "Add a break point, highlight it."
 ;;   (interactive)
 ;;   (let ((trace (cond ((spacemacs/pyenv-executable-find "trepan3k") "import trepan.api; trepan.api.debug()")
 ;;                      ((spacemacs/pyenv-executable-find "wdb") "import wdb; wdb.set_trace()")
 ;;                      ((spacemacs/pyenv-executable-find "ipdb") "import ipdb; ipdb.set_trace()")
 ;;                      ((spacemacs/pyenv-executable-find "pudb") "import pudb; pudb.set_trace()")
 ;;                      ((spacemacs/pyenv-executable-find "ipdb3") "import ipdb; ipdb.set_trace()")
 ;;                      ((spacemacs/pyenv-executable-find "pudb3") "import pudb; pudb.set_trace()")
 ;;                      ((spacemacs/pyenv-executable-find "python3.7") "breakpoint()")
 ;;                      ((spacemacs/pyenv-executable-find "python3.8") "breakpoint()")
 ;;                      (t "import pdb; pdb.set_trace()")))
 ;;         (line (thing-at-point 'line)))
 ;;     (if (and line (string-match trace line))
 ;;         (kill-whole-line)
 ;;       (progn
 ;;         (back-to-indentation)
 ;;         (insert trace)
 ;;         (insert "\n")
 ;;         (python-indent-line)))))
 
(defun spacemacs/python-toggle-breakpoint ()
   "Add a break point, highlight it."
   (interactive)
   (let ((trace (cond ((pipenv-executable-find "trepan3k") "import trepan.api; trepan.api.debug()")
                      ((pipenv-executable-find "wdb") "import wdb; wdb.set_trace()")
                      ((pipenv-executable-find "ipdb") "import ipdb; ipdb.set_trace()")
                      ((pipenv-executable-find "pudb") "import pudb; pudb.set_trace()")
                      ((pipenv-executable-find "ipdb3") "import ipdb; ipdb.set_trace()")
                      ((pipenv-executable-find "pudb3") "import pudb; pudb.set_trace()")
                      ((pipenv-executable-find "python3.7") "breakpoint()")
                      ((pipenv-executable-find "python3.8") "breakpoint()")
                      (t "import pdb; pdb.set_trace()")))
         (line (thing-at-point 'line)))
     (if (and line (string-match trace line))
         (kill-whole-line)
       (progn
         (back-to-indentation)
         (insert trace)
         (insert "\n")
         (python-indent-line)))))


;; key mappings
;; (map! :map python-mode-map
;;       :localleader
;;       :prefix ("d" . "debug")
;;       :desc "Toggle breakpoint"
;;       "b" #'spacemacs/python-toggle-breakpoint)
