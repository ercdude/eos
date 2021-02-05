;;; adapt  --- Adapt
;;; Commentary:
;;; Code:

(require 'time-stamp)

;; =================== Battery =======================
;; TODO: this is freebsd exclusive. Make a freebsd-sysctl.el?
(defun battery-remaining-percent()
  "Returns the remaining percentage of the battery level."
  (string-trim
   (shell-command-to-string "sysctl -n hw.acpi.battery.life")))

(defun battery-remaining-time()
  "Returns the remaining minutes (?) of the battery life."
  (interactive)
  (let ((time-str (string-trim
                   (shell-command-to-string
                    "sysctl -n hw.acpi.battery.time"))))
    (when (not (string= time-str "-1"))
      (message (format "%smin" time-str)))))

(defun battery-status()
  (interactive)
  "Returns the status of the battery."
  (async-shell-command "acpiconf -i 0" "*battery*"))

(provide 'battery)
;; battery.el ends here
