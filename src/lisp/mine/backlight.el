;;; backlight  --- Backlight
;;; Commentary:
;;; Code:

;; TODO: make it intel_backlight exclusive. add more control functions
(defvar vlm-brightness-bin "intel_backlight"
  "The brighness program.")

(defun set-lcd-brightness (&optional brightness)
  "Set BRIGHTNESS % value."
  (interactive "P")
  (let ((brightness (or brightness
                        (read-number "Brightness[%]: " 100))))
    (if (executable-find vlm-brightness-bin)
        (async-shell-command (format "%s %d"
                                     vlm-brightness-bin
                                     brightness))
      (message (concat (vlm-brightness-bin " not found"))))))

(provide 'lcd-backlight)
;; backlight.el ends here
