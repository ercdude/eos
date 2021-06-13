;;; adapt  --- Adapt
;;; Commentary:
;;; Code:

(defun keyboard-activate-intl ()
  "Change keyboard map to us altgr-intl"
  ;; TODO accept var
  (interactive)
  (async-shell-command "setxkbmap us altgr-intl"))

(defun keyboard-deactivate-intl ()
  "Change keyboard map to us"
  ;; TODO accept var
  (interactive)
  (async-shell-command "setxkbmap us"))

(provide 'keyboard-setxkbmap)
