;;; adapt  --- Adapt
;;; Commentary:
;;; Code:

;; TODO: fix lock after resume
(defun eos/sleep ()
  "Trigger sleep calling zzz"
  (interactive)
  (async-shell-command "sudo zzz"))

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

;; lock

(defvar eos-lock-command
  "my.lock"
  "The lock command which eos/lock uses")

(defun eos/lock ()
  "Call slock utility."
  (interactive)
  (cannon--make-comint-process eos-lock-command eos-lock-command))

(define-key ctl-x-map (kbd "<end>") 'eos/lock)

;; =================== Etags =======================
;; find . \( -name "*.[chCH]" -o -name "*.cpp" -o -name "*.hpp" \) -print | etags -D -Q --declarations -
;; (defvar eos/generate-etags ()
;;   "Generate TAGS with etags."
;;   (interactive)
;;   )

;; =================== Rsync =======================
(defun flow/send-files ()
  "Sends files from FLOW-LOCAL-SRC to FLOW-ADD:FLOW-REMOTE-SRC."
  (interactive)
  (rsync-push "khomp" "~/work/khomp/flow/" "khomp:~/Workspace/khomp/flow/"))

;; =================== Date =======================
(require 'battery)
(defun show-date ()
  "Prints the date to minibuffer"
  (interactive)
  (let ((battery (battery-remaining-time)))
    (message (format "%s %s"
                     (time-stamp-string)
                     (if battery
                         (format "⚠ %s" battery)
                       "⚡")))))

(defun insert-time-stamp ()
  "Inserts the time-stamp-string at point."
  (interactive)
  (insert (time-stamp-string)))

(global-set-key (kbd "s-t") 'show-date)

(defun occur-at-point ()
  "Occur with symbol or region as its arguments."
  (interactive)
  (let*
      ;; get region or symbol
      ((bounds (if (use-region-p)
                   (cons (region-beginning) (region-end))
                 (bounds-of-thing-at-point 'symbol)))
       ;; get string
       (string (unless bounds
                 (read-string "Occur: "))))
    (cond
     ;; region
     (bounds
      (occur (buffer-substring-no-properties
              (car bounds) (cdr bounds)))
      (deactivate-mark))
     ;; default string, symbol
     (t (occur string)))))

;; STUDY THIS!!!
;;(run-with-idle-timer)

;; not working...
;; (defun eval-line-with (&optional interpreter)
;;   "Send LINE to the target pitch and run the key binding for RET there.
;; This function does not disturb the current window"
;;   (interactive "s")
;;   (let *((name "*quick-eval*") ;; TODO: use a custom var
;;          (line (buffer-substring (ee-bol) (ee-eol)))
;;          (program-and-args (concat (when interpreter
;;                                      '(" " interpreter)) line)))
;;        (find-comintprocess interpreter line)))

(provide 'adapt)
;;; adapt.el ends here
