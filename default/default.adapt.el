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

;; =================== Printscreen =======================
(defgroup screenshot nil
  "Screenshot command interface."
  :group 'extensions
  :group 'convenience)

(defcustom printscreen-program "scrot"
  "The program to take screenshot of X buffers."
  :type 'string
  :group 'screenshot)

(defcustom printscreen-dir (concat (getenv "HOME") "/images/")
  "The default dir to save screenshot files."
  :type 'string
  :group 'screenshot)

(defcustom printscreen-file-pattern "%Y%m%d%H%M%S_$wx$h_scrot.png"
  "The default file pattern to save screenshot files."
  :type 'string
  :group 'screenshot)

(defcustom printscreen-params
  "" ;; "-e 'mv $f ~/Images/'"
  "The arguments to be used with the screenshot program"
  :type 'string
  :group 'screenshot)

;; TODO: get a list of arguments, not a string
(defun eos--printscreen (filename)
  "Takes a screenshot using printscreen-program."
  (async-shell-command (format "%s %s %s"
                               printscreen-program
                               filename
                               printscreen-params)))

(defun eos/print-mouse-region (&optional image-path)
  "Saves a printscreen of a region selected with the mouse."
  (interactive)
  (let ((image-path
          (or image-path
            (concat
              (read-directory-name "Save to dir:"
                printscreen-dir)
              printscreen-file-pattern))))
    (eos--printscreen (concat (format "'%s' %s"
                                      (expand-file-name image-path)
                                      "--select")))))

(defun eos/printscreen (&optional image-path)
  "Saves a printscreen of all screen."
  (interactive)
  (let ((image-path
          (or image-path
            (concat
              (read-directory-name "Save to dir:"
                printscreen-dir)
              printscreen-file-pattern))))
    (eos--printscreen (format "'%s'" (expand-file-name image-path)))))

;; =================== Date =======================
(defun eos/show-date ()
  "Prints the date to minibuffer"
  (interactive)
  (message (concat "Datetime is: " (time-stamp-string))))

(global-set-key (kbd "s-d") 'eos/show-date)


(provide 'adapt)
;;; adapt.el ends here
