;;; adapt  --- Adapt
;;; Commentary:
;;; Code:

;; ======================= backlight =======================
(defvar eos-brightness-bin "intel_backlight"
  "The brighness program.")

(defun eos/set-brightness (&optional brightness)
  "Set BRIGHTNESS % value."
  (interactive "P")
  (let ((brightness (or brightness
                     (read-number "Brightness[%]: " 100))))
    (if (executable-find eos-brightness-bin)
        (async-shell-command (format "%s %d"
                                     eos-brightness-bin
                                     brightness))
      (message (concat(eos-brightness-bin " not found"))))))

;; ======================= transparency  =======================
(defvar eos-transparency-bin "transset"
  "The transparency controller.")

;; Couldn't find a way to get the window id inside exwm
(defun eos/set-transparency-to-pointed-window (&optional transparency)
  "Set TRANSPARENCY to the clicked EXWM buffer."
  (interactive "P")
  (let ((transparency (or transparency
                          (read-number "Transparency:" 0.65))))
    (if (executable-find eos-transparency-bin)
        (progn
          (async-shell-command (format "%s %.1f"
                                       eos-transparency-bin
                                       transparency))
          (message "Click the wanted window"))
      (message (concat(eos-transparency-bin " not found"))))))

;; TODO: fix lock after resume (I think it's a freebsd job)
(defun eos/sleep ()
  "Trigger sleep calling zzz"
  (interactive)
  (async-shell-command "sudo zzz"))

;; ======================= xrandr =================================

;; TODO: retrieve the screen names on the fly
;; TODO: improve these variables, make it as a list
;; TODO: improve this xrandr interface
(defvar eos-xrandr-left-screen "HDMI-1"
  "The xrandr screen name located at the left side.")
(defvar eos-xrandr-right-screen "eDP-1"
  "The xrandr screen name located at the right side.")
(defun eos/xrandr-fix-monitor ()
  "Fix screen seting eos-xrandr-left-screen right of eos-xrandr-right-scren.
This is a workaround until no better xrandr interface is created."
  (interactive)
  (async-shell-command (format "xrandr --output %s --right-of %s"
                               eos-xrandr-right-screen
                               eos-xrandr-left-screen)))

;; =================== Date =======================
(defun eos/show-date ()
  "Prints the date to minibuffer"
  (interactive)
  (message (concat "Datetime is: " (time-stamp-string))))

(global-set-key (kbd "s-d") 'eos/show-date)


(provide 'adapt)
;;; adapt.el ends here
