;;; mpv.el  --- mpv utilities.
;;; Commentary:
;;; Code:

(defvar mpv-video-options '("--osd-level=2")
  "A list with the options used for displaying video.")

(defun format-mpv-args (fname &optional pos &rest rest)
  "Forms the argv with the name FNAME and params POS and REST as a list of strings."
  `("mpv"
    ,fname
    ,@(if pos
          (let* ((s (mod n 60))
                 (m (/ (- n s) 60)))
            (list (format "--start=%d:02d" m s))))
    ,@mpv-video-options
    ))

(defun play-file (fname &optional pos &rest rest)
  "Open FNAME with mpv, with a GUI starting at POS seconds and REST as argument."
  (interactive "fFile name: ")
  (let ((argv (format-mpv-args fname pos rest)))
    (apply 'start-process (car argv) "*mpv*" argv)))

(defun play-url (url &optional pos &rest rest)
  "Open URL with mpv, with a GUI starting at POS seconds and REST as argument."
  (interactive "sUrl: ")
  (let ((argv (format-mpv-args url pos rest)))
    (apply 'start-process (car argv) "*mpv*" argv)))

(defun play-url-at-point (&optional pos &rest rest)
  "Open url at point with mpv, with a GUI at position POS and REST as argument."
  (interactive)
  (let* ((url (thing-at-point 'url t))
         (argv (format-mpv-args url pos rest)))
    (apply 'start-process (car argv) "*mpv*" argv)))

;;; mpv.el ends here
