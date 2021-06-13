;;; adapt  --- Adapt
;;; Commentary:
;;; Code:

;; TODO: create transset.el
(defvar transparency-bin "transset"
  "The transparency controller.")

;; Couldn't find a way to get the window id inside exwm
(defun set-transparency-to-pointed-window (&optional transparency)
  "Set TRANSPARENCY to the clicked EXWM buffer."
  (interactive "P")
  (let ((transparency (or transparency
                          (read-number "Transparency:" 0.65))))
    (if (executable-find transparency-bin)
        (progn
          (async-shell-command (format "%s %.1f"
                                       transparency-bin
                                       transparency))
          (message "Click the wanted window"))
      (message (concat(transparency-bin " not found"))))))

(provide 'transset)
;; transset.el ends here
