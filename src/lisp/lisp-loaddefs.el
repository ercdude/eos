;;; lisp-loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "ag" "ag/ag.el" (0 0 0 0))
;;; Generated autoloads from ag/ag.el

(autoload 'ag "ag" "\
Search using ag in a given DIRECTORY for a given literal search STRING,
with STRING defaulting to the symbol under point.

If called with a prefix, prompts for flags to pass to ag.

\(fn STRING DIRECTORY)" t nil)

(autoload 'ag-files "ag" "\
Search using ag in a given DIRECTORY for a given literal search STRING,
limited to files that match FILE-TYPE. STRING defaults to the
symbol under point.

If called with a prefix, prompts for flags to pass to ag.

\(fn STRING FILE-TYPE DIRECTORY)" t nil)

(autoload 'ag-regexp "ag" "\
Search using ag in a given directory for a given regexp.
The regexp should be in PCRE syntax, not Emacs regexp syntax.

If called with a prefix, prompts for flags to pass to ag.

\(fn STRING DIRECTORY)" t nil)

(autoload 'ag-project "ag" "\
Guess the root of the current project and search it with ag
for the given literal search STRING.

If called with a prefix, prompts for flags to pass to ag.

\(fn STRING)" t nil)

(autoload 'ag-project-files "ag" "\
Search using ag for a given literal search STRING,
limited to files that match FILE-TYPE. STRING defaults to the
symbol under point.

If called with a prefix, prompts for flags to pass to ag.

\(fn STRING FILE-TYPE)" t nil)

(autoload 'ag-project-regexp "ag" "\
Guess the root of the current project and search it with ag
for the given regexp. The regexp should be in PCRE syntax, not
Emacs regexp syntax.

If called with a prefix, prompts for flags to pass to ag.

\(fn REGEXP)" t nil)

(defalias 'ag-project-at-point 'ag-project)

(defalias 'ag-regexp-project-at-point 'ag-project-regexp)

(autoload 'ag-dired "ag" "\
Recursively find files in DIR matching literal search STRING.

The PATTERN is matched against the full path to the file, not
only against the file name.

The results are presented as a `dired-mode' buffer with
`default-directory' being DIR.

See also `ag-dired-regexp'.

\(fn DIR STRING)" t nil)

(autoload 'ag-dired-regexp "ag" "\
Recursively find files in DIR matching REGEXP.
REGEXP should be in PCRE syntax, not Emacs regexp syntax.

The REGEXP is matched against the full path to the file, not
only against the file name.

Results are presented as a `dired-mode' buffer with
`default-directory' being DIR.

See also `find-dired'.

\(fn DIR REGEXP)" t nil)

(autoload 'ag-project-dired "ag" "\
Recursively find files in current project matching PATTERN.

See also `ag-dired'.

\(fn PATTERN)" t nil)

(autoload 'ag-project-dired-regexp "ag" "\
Recursively find files in current project matching REGEXP.

See also `ag-dired-regexp'.

\(fn REGEXP)" t nil)

(autoload 'ag-kill-buffers "ag" "\
Kill all `ag-mode' buffers." t nil)

(autoload 'ag-kill-other-buffers "ag" "\
Kill all `ag-mode' buffers other than the current buffer." t nil)

(register-definition-prefixes "ag" '("ag-" "ag/"))

;;;***

;;;### (autoloads nil "all-the-icons" "all-the-icons/all-the-icons.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from all-the-icons/all-the-icons.el

(autoload 'all-the-icons-icon-for-dir "all-the-icons" "\
Get the formatted icon for DIR.
ARG-OVERRIDES should be a plist containining `:height',
`:v-adjust' or `:face' properties like in the normal icon
inserting functions.

Note: You want chevron, please use `all-the-icons-icon-for-dir-with-chevron'.

\(fn DIR &rest ARG-OVERRIDES)" nil nil)

(autoload 'all-the-icons-icon-for-file "all-the-icons" "\
Get the formatted icon for FILE.
ARG-OVERRIDES should be a plist containining `:height',
`:v-adjust' or `:face' properties like in the normal icon
inserting functions.

\(fn FILE &rest ARG-OVERRIDES)" nil nil)

(autoload 'all-the-icons-icon-for-mode "all-the-icons" "\
Get the formatted icon for MODE.
ARG-OVERRIDES should be a plist containining `:height',
`:v-adjust' or `:face' properties like in the normal icon
inserting functions.

\(fn MODE &rest ARG-OVERRIDES)" nil nil)

(autoload 'all-the-icons-icon-for-url "all-the-icons" "\
Get the formatted icon for URL.
If an icon for URL isn't found in `all-the-icons-url-alist', a globe is used.
ARG-OVERRIDES should be a plist containining `:height',
`:v-adjust' or `:face' properties like in the normal icon
inserting functions.

\(fn URL &rest ARG-OVERRIDES)" nil nil)

(autoload 'all-the-icons-install-fonts "all-the-icons" "\
Helper function to download and install the latests fonts based on OS.
When PFX is non-nil, ignore the prompt and just install

\(fn &optional PFX)" t nil)

(autoload 'all-the-icons-insert "all-the-icons" "\
Interactive icon insertion function.
When Prefix ARG is non-nil, insert the propertized icon.
When FAMILY is non-nil, limit the candidates to the icon set matching it.

\(fn &optional ARG FAMILY)" t nil)

(register-definition-prefixes "all-the-icons" '("all-the-icons-"))

;;;***

;;;### (autoloads nil "async" "emacs-async/async.el" (0 0 0 0))
;;; Generated autoloads from emacs-async/async.el

(autoload 'async-start-process "async" "\
Start the executable PROGRAM asynchronously named NAME.  See `async-start'.
PROGRAM is passed PROGRAM-ARGS, calling FINISH-FUNC with the
process object when done.  If FINISH-FUNC is nil, the future
object will return the process object when the program is
finished.  Set DEFAULT-DIRECTORY to change PROGRAM's current
working directory.

\(fn NAME PROGRAM FINISH-FUNC &rest PROGRAM-ARGS)" nil nil)

(autoload 'async-start "async" "\
Execute START-FUNC (often a lambda) in a subordinate Emacs process.
When done, the return value is passed to FINISH-FUNC.  Example:

    (async-start
       ;; What to do in the child process
       (lambda ()
         (message \"This is a test\")
         (sleep-for 3)
         222)

       ;; What to do when it finishes
       (lambda (result)
         (message \"Async process done, result should be 222: %s\"
                  result)))

If FINISH-FUNC is nil or missing, a future is returned that can
be inspected using `async-get', blocking until the value is
ready.  Example:

    (let ((proc (async-start
                   ;; What to do in the child process
                   (lambda ()
                     (message \"This is a test\")
                     (sleep-for 3)
                     222))))

        (message \"I'm going to do some work here\") ;; ....

        (message \"Waiting on async process, result should be 222: %s\"
                 (async-get proc)))

If you don't want to use a callback, and you don't care about any
return value from the child process, pass the `ignore' symbol as
the second argument (if you don't, and never call `async-get', it
will leave *emacs* process buffers hanging around):

    (async-start
     (lambda ()
       (delete-file \"a remote file on a slow link\" nil))
     'ignore)

Note: Even when FINISH-FUNC is present, a future is still
returned except that it yields no value (since the value is
passed to FINISH-FUNC).  Call `async-get' on such a future always
returns nil.  It can still be useful, however, as an argument to
`async-ready' or `async-wait'.

\(fn START-FUNC &optional FINISH-FUNC)" nil nil)

(register-definition-prefixes "async" '("async-"))

;;;***

;;;### (autoloads nil "async-bytecomp" "emacs-async/async-bytecomp.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emacs-async/async-bytecomp.el

(autoload 'async-byte-recompile-directory "async-bytecomp" "\
Compile all *.el files in DIRECTORY asynchronously.
All *.elc files are systematically deleted before proceeding.

\(fn DIRECTORY &optional QUIET)" nil nil)

(defvar async-bytecomp-package-mode nil "\
Non-nil if Async-Bytecomp-Package mode is enabled.
See the `async-bytecomp-package-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `async-bytecomp-package-mode'.")

(custom-autoload 'async-bytecomp-package-mode "async-bytecomp" nil)

(autoload 'async-bytecomp-package-mode "async-bytecomp" "\
Byte compile asynchronously packages installed with package.el.
Async compilation of packages can be controlled by
`async-bytecomp-allowed-packages'.

If called interactively, toggle `Async-Bytecomp-Package mode'.
If the prefix argument is positive, enable the mode, and if it is
zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(autoload 'async-byte-compile-file "async-bytecomp" "\
Byte compile Lisp code FILE asynchronously.

Same as `byte-compile-file' but asynchronous.

\(fn FILE)" t nil)

(register-definition-prefixes "async-bytecomp" '("async-byte"))

;;;***

;;;### (autoloads nil "async-test" "emacs-async/async-test.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from emacs-async/async-test.el

(register-definition-prefixes "async-test" '("async-test-"))

;;;***

;;;### (autoloads nil "backlight" "mine/backlight.el" (0 0 0 0))
;;; Generated autoloads from mine/backlight.el

(register-definition-prefixes "backlight" '("set-lcd-brightness" "vlm-brightness-bin"))

;;;***

;;;### (autoloads nil "browse-kill-ring" "browse-kill-ring/browse-kill-ring.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from browse-kill-ring/browse-kill-ring.el

(autoload 'browse-kill-ring-default-keybindings "browse-kill-ring" "\
Set up M-y (`yank-pop') so that it can invoke `browse-kill-ring'.
Normally, if M-y was not preceeded by C-y, then it has no useful
behavior.  This function sets things up so that M-y will invoke
`browse-kill-ring'." t nil)

(autoload 'browse-kill-ring "browse-kill-ring" "\
Display items in the `kill-ring' in another buffer." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "browse-kill-ring" '("browse-kill-ring-")))

;;;***

;;;### (autoloads nil "buck" "ghub/buck.el" (0 0 0 0))
;;; Generated autoloads from ghub/buck.el

(register-definition-prefixes "buck" '("buck-default-host"))

;;;***

;;;### (autoloads nil "cannon" "cannon/cannon.el" (0 0 0 0))
;;; Generated autoloads from cannon/cannon.el

(autoload 'cannon-show-mode-state "cannon" "\
Show cannon minor mode state: on|off." t nil)

(defvar cannon-mode nil "\
Non-nil if Cannon mode is enabled.
See the `cannon-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `cannon-mode'.")

(custom-autoload 'cannon-mode "cannon" nil)

(autoload 'cannon-mode "cannon" "\
Define a new minor mode `cannon-mode'.

If called interactively, toggle `Cannon mode'.  If the prefix
argument is positive, enable the mode, and if it is zero or
negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

This defines the toggle command `cannon-mode' and (by default)
a control variable `cannon-mode'.

Interactively with no prefix argument, it toggles the mode.
A prefix argument enables the mode if the argument is positive,
and disables it otherwise.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-cannon-mode "cannon" "\
Activate the minor mode." t nil)

(register-definition-prefixes "cannon" '("cannon-" "turn-off-cannon-mode"))

;;;***

;;;### (autoloads nil "chicken-apropos" "chicken/chicken-apropos.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from chicken/chicken-apropos.el

(register-definition-prefixes "chicken-apropos" '("apropos-special-form" "chicken-apropos-"))

;;;***

;;;### (autoloads nil "chicken-comint" "chicken/chicken-comint.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from chicken/chicken-comint.el

(autoload 'chicken-comint-run "chicken-comint" "\
Run an inferior instance of *CSI REPL* inside Emacs." t nil)

(add-hook 'chicken-comint-mode-hook 'chicken-comint-setup)

(register-definition-prefixes "chicken-comint" '("chicken-"))

;;;***

;;;### (autoloads nil "chicken-mode" "chicken/chicken-mode.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from chicken/chicken-mode.el

(autoload 'chicken-mode "chicken-mode" "\
Minor mode for interacting with Chicken.

If called interactively, toggle ‘Chicken minor mode’.  If the
prefix argument is positive, enable the mode, and if it is zero
or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode’s hook is called both when the mode is enabled and when
it is disabled.

The following commands are available:

\\{chicken-mode-map}

\(fn &optional ARG)" t nil)

(register-definition-prefixes "chicken-mode" '("chicken-mode"))

;;;***

;;;### (autoloads nil "chicken-op" "chicken/chicken-op.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from chicken/chicken-op.el

(register-definition-prefixes "chicken-op" '("chicken-"))

;;;***

;;;### (autoloads nil "chicken-overlay" "chicken/chicken-overlay.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from chicken/chicken-overlay.el

(register-definition-prefixes "chicken-overlay" '("chicken-overlay"))

;;;***

;;;### (autoloads nil "closql" "closql/closql.el" (0 0 0 0))
;;; Generated autoloads from closql/closql.el

(register-definition-prefixes "closql" '("closql-" "eieio-"))

;;;***

;;;### (autoloads nil "cmake-mode" "cmake-mode-20190710.1319/cmake-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from cmake-mode-20190710.1319/cmake-mode.el

(autoload 'cmake-mode "cmake-mode" "\
Major mode for editing CMake source files.

\(fn)" t nil)

(autoload 'cmake-command-run "cmake-mode" "\
Runs the command cmake with the arguments specified.  The
optional argument topic will be appended to the argument list.

\(fn TYPE &optional TOPIC BUFFER)" t nil)

(autoload 'cmake-help-list-commands "cmake-mode" "\
Prints out a list of the cmake commands." t nil)

(autoload 'cmake-help-command "cmake-mode" "\
Prints out the help message for the command the cursor is on." t nil)

(autoload 'cmake-help-module "cmake-mode" "\
Prints out the help message for the module the cursor is on." t nil)

(autoload 'cmake-help-variable "cmake-mode" "\
Prints out the help message for the variable the cursor is on." t nil)

(autoload 'cmake-help-property "cmake-mode" "\
Prints out the help message for the property the cursor is on." t nil)

(autoload 'cmake-help "cmake-mode" "\
Queries for any of the four available help topics and prints out the appropriate page." t nil)

(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))

(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "cmake-mode" '("cmake-")))

;;;***

;;;### (autoloads nil "connection" "dictionary-el/connection.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from dictionary-el/connection.el

(register-definition-prefixes "connection" '("connection-"))

;;;***

;;;### (autoloads nil "dash" "dash.el/dash.el" (0 0 0 0))
;;; Generated autoloads from dash.el/dash.el

(autoload 'dash-fontify-mode "dash" "\
Toggle fontification of Dash special variables.

If called interactively, toggle `Dash-Fontify mode'.  If the prefix
argument is positive, enable the mode, and if it is zero or negative,
disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable the
mode if ARG is nil, omitted, or is a positive number.  Disable the
mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when it is
disabled.

Dash-Fontify mode is a buffer-local minor mode intended for Emacs
Lisp buffers.  Enabling it causes the special variables bound in
anaphoric Dash macros to be fontified.  These anaphoras include
`it', `it-index', `acc', and `other'.  In older Emacs versions
which do not dynamically detect macros, Dash-Fontify mode
additionally fontifies Dash macro calls.

See also `dash-fontify-mode-lighter' and
`global-dash-fontify-mode'.

\(fn &optional ARG)" t nil)

(put 'global-dash-fontify-mode 'globalized-minor-mode t)

(defvar global-dash-fontify-mode nil "\
Non-nil if Global Dash-Fontify mode is enabled.
See the `global-dash-fontify-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-dash-fontify-mode'.")

(custom-autoload 'global-dash-fontify-mode "dash" nil)

(autoload 'global-dash-fontify-mode "dash" "\
Toggle Dash-Fontify mode in all buffers.
With prefix ARG, enable Global Dash-Fontify mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if ARG
is omitted or nil.

Dash-Fontify mode is enabled in all buffers where
`dash--turn-on-fontify-mode' would do it.

See `dash-fontify-mode' for more information on Dash-Fontify mode.

\(fn &optional ARG)" t nil)

(autoload 'dash-register-info-lookup "dash" "\
Register the Dash Info manual with `info-lookup-symbol'.
This allows Dash symbols to be looked up with \\[info-lookup-symbol]." t nil)

(register-definition-prefixes "dash" '("!cdr" "!cons" "--" "->" "-a" "-butlast" "-c" "-d" "-e" "-f" "-gr" "-i" "-juxt" "-keep" "-l" "-m" "-no" "-o" "-p" "-r" "-s" "-t" "-u" "-value-to-list" "-when-let" "-zip" "dash-"))

;;;***

;;;### (autoloads nil "ddoc" "dash-docs/ddoc.el" (0 0 0 0))
;;; Generated autoloads from dash-docs/ddoc.el

(autoload 'ddoc-show-mode-state "ddoc" "\
Show ddoc minor mode state: on/off." t nil)

(defvar ddoc-mode nil "\
Non-nil if Ddoc mode is enabled.
See the `ddoc-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `ddoc-mode'.")

(custom-autoload 'ddoc-mode "ddoc" nil)

(autoload 'ddoc-mode "ddoc" "\
Define a new minor mode `ddoc'.

If called interactively, toggle `Ddoc mode'.  If the prefix
argument is positive, enable the mode, and if it is zero or
negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

This defines the toggle command `ddoc' and (by default)
a control variable `ddoc'.

Interactively with no prefix argument, it toggles the mode.
A prefix argument enables the mode if the argument is positive,
and disables it otherwise.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-ddoc-mode "ddoc" "\
Enable ddoc minor mode." t nil)

(register-definition-prefixes "ddoc" '("ddoc-" "turn-off-ddoc-mode"))

;;;***

;;;### (autoloads nil "dev/ert" "s/dev/ert.el" (0 0 0 0))
;;; Generated autoloads from s/dev/ert.el

(autoload 'ert-deftest "dev/ert" "\
Define NAME (a symbol) as a test.

BODY is evaluated as a `progn' when the test is run.  It should
signal a condition on failure or just return if the test passes.

`should', `should-not' and `should-error' are useful for
assertions in BODY.

Use `ert' to run tests interactively.

Tests that are expected to fail can be marked as such
using :expected-result.  See `ert-test-result-type-p' for a
description of valid values for RESULT-TYPE.

\(fn NAME () [DOCSTRING] [:expected-result RESULT-TYPE] [:tags '(TAG...)] BODY...)" nil 'macro)

(put 'ert-deftest 'lisp-indent-function 2)

(put 'ert-info 'lisp-indent-function 1)

(autoload 'ert-run-tests-batch "dev/ert" "\
Run the tests specified by SELECTOR, printing results to the terminal.

SELECTOR works as described in `ert-select-tests', except if
SELECTOR is nil, in which case all tests rather than none will be
run; this makes the command line \"emacs -batch -l my-tests.el -f
ert-run-tests-batch-and-exit\" useful.

Returns the stats object.

\(fn &optional SELECTOR)" nil nil)

(autoload 'ert-run-tests-batch-and-exit "dev/ert" "\
Like `ert-run-tests-batch', but exits Emacs when done.

The exit status will be 0 if all test results were as expected, 1
on unexpected results, or 2 if the framework detected an error
outside of the tests (e.g. invalid SELECTOR or bug in the code
that runs the tests).

\(fn &optional SELECTOR)" nil nil)

(autoload 'ert-run-tests-interactively "dev/ert" "\
Run the tests specified by SELECTOR and display the results in a buffer.

SELECTOR works as described in `ert-select-tests'.
OUTPUT-BUFFER-NAME and MESSAGE-FN should normally be nil; they
are used for automated self-tests and specify which buffer to use
and how to display message.

\(fn SELECTOR &optional OUTPUT-BUFFER-NAME MESSAGE-FN)" t nil)

(defalias 'ert 'ert-run-tests-interactively)

(autoload 'ert-describe-test "dev/ert" "\
Display the documentation for TEST-OR-TEST-NAME (a symbol or ert-test).

\(fn TEST-OR-TEST-NAME)" t nil)

(register-definition-prefixes "dev/ert" '("ert-" "should"))

;;;***

;;;### (autoloads nil "dev/examples-to-docs" "s/dev/examples-to-docs.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from s/dev/examples-to-docs.el

(register-definition-prefixes "dev/examples-to-docs" '("create-docs-file" "def" "docs--" "example" "function" "github-id" "goto-and-remove" "quote-" "simplify-quotes" "three-first"))

;;;***

;;;### (autoloads nil "dev/examples-to-tests" "s/dev/examples-to-tests.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from s/dev/examples-to-tests.el

(register-definition-prefixes "dev/examples-to-tests" '("def-example-group" "defexamples" "examples-to-should"))

;;;***

;;;### (autoloads nil "dictionary" "dictionary-el/dictionary.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from dictionary-el/dictionary.el

(autoload 'dictionary-mode "dictionary" "\
This is a mode for searching a dictionary server implementing
 the protocol defined in RFC 2229.

 This is a quick reference to this mode describing the default key bindings:

 * q close the dictionary buffer
 * h display this help information
 * s ask for a new word to search
 * d search the word at point
 * n or Tab place point to the next link
 * p or S-Tab place point to the prev link

 * m ask for a pattern and list all matching words.
 * D select the default dictionary
 * M select the default search strategy

 * Return or Button2 visit that link
 * M-Return or M-Button2 search the word beneath link in all dictionaries
 " nil nil)

(autoload 'dictionary "dictionary" "\
Create a new dictonary buffer and install dictionary-mode" t nil)

(autoload 'dictionary-search "dictionary" "\
Search the `word' in `dictionary' if given or in all if nil.  
It presents the word at point as default input and allows editing it.

\(fn WORD &optional DICTIONARY)" t nil)

(autoload 'dictionary-lookup-definition "dictionary" "\
Unconditionally lookup the word at point." t nil)

(autoload 'dictionary-match-words "dictionary" "\
Search `pattern' in current default dictionary using default strategy.

\(fn &optional PATTERN &rest IGNORED)" t nil)

(autoload 'dictionary-mouse-popup-matching-words "dictionary" "\
Display entries matching the word at the cursor

\(fn EVENT)" t nil)

(autoload 'dictionary-popup-matching-words "dictionary" "\
Display entries matching the word at the point

\(fn &optional WORD)" t nil)

(register-definition-prefixes "dictionary" '("dictionary-"))

;;;***

;;;### (autoloads nil "dired-async" "emacs-async/dired-async.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emacs-async/dired-async.el

(defvar dired-async-mode nil "\
Non-nil if Dired-Async mode is enabled.
See the `dired-async-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `dired-async-mode'.")

(custom-autoload 'dired-async-mode "dired-async" nil)

(autoload 'dired-async-mode "dired-async" "\
Do dired actions asynchronously.

If called interactively, toggle `Dired-Async mode'.  If the
prefix argument is positive, enable the mode, and if it is zero
or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(autoload 'dired-async-do-copy "dired-async" "\
Run ‘dired-do-copy’ asynchronously.

\(fn &optional ARG)" t nil)

(autoload 'dired-async-do-symlink "dired-async" "\
Run ‘dired-do-symlink’ asynchronously.

\(fn &optional ARG)" t nil)

(autoload 'dired-async-do-hardlink "dired-async" "\
Run ‘dired-do-hardlink’ asynchronously.

\(fn &optional ARG)" t nil)

(autoload 'dired-async-do-rename "dired-async" "\
Run ‘dired-do-rename’ asynchronously.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "dired-async" '("dired-async-"))

;;;***

;;;### (autoloads nil "dired-avfs" "dired-hacks/dired-avfs.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from dired-hacks/dired-avfs.el

(register-definition-prefixes "dired-avfs" '("dired-avfs-"))

;;;***

;;;### (autoloads nil "dired-collapse" "dired-hacks/dired-collapse.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from dired-hacks/dired-collapse.el

(autoload 'dired-collapse-mode "dired-collapse" "\
Toggle collapsing of unique nested paths in Dired.

If called interactively, toggle `Dired-Collapse mode'.  If the
prefix argument is positive, enable the mode, and if it is zero
or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "dired-collapse" '("dired-collapse"))

;;;***

;;;### (autoloads nil "dired-columns" "dired-hacks/dired-columns.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from dired-hacks/dired-columns.el

(register-definition-prefixes "dired-columns" '("dired-columns-"))

;;;***

;;;### (autoloads nil "dired-filter" "dired-hacks/dired-filter.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from dired-hacks/dired-filter.el

(defvar dired-filter-map (let ((map (make-sparse-keymap))) (define-key map "n" 'dired-filter-by-name) (define-key map "r" 'dired-filter-by-regexp) (define-key map "." 'dired-filter-by-extension) (define-key map "h" 'dired-filter-by-dot-files) (define-key map "o" 'dired-filter-by-omit) (define-key map "g" 'dired-filter-by-garbage) (define-key map "e" 'dired-filter-by-predicate) (define-key map "f" 'dired-filter-by-file) (define-key map "d" 'dired-filter-by-directory) (define-key map "m" 'dired-filter-by-mode) (define-key map "s" 'dired-filter-by-symlink) (define-key map "x" 'dired-filter-by-executable) (define-key map "ig" 'dired-filter-by-git-ignored) (define-key map "|" 'dired-filter-or) (define-key map "!" 'dired-filter-negate) (define-key map "*" 'dired-filter-decompose) (define-key map (kbd "TAB") 'dired-filter-transpose) (define-key map "p" 'dired-filter-pop) (define-key map "/" 'dired-filter-pop-all) (define-key map "S" 'dired-filter-save-filters) (define-key map "D" 'dired-filter-delete-saved-filters) (define-key map "A" 'dired-filter-add-saved-filters) (define-key map "L" 'dired-filter-load-saved-filters) map) "\
Keymap used for filtering files.")

(defvar dired-filter-mark-map (let ((map (make-sparse-keymap))) (define-key map "n" 'dired-filter-mark-by-name) (define-key map "r" 'dired-filter-mark-by-regexp) (define-key map "." 'dired-filter-mark-by-extension) (define-key map "h" 'dired-filter-mark-by-dot-files) (define-key map "o" 'dired-filter-mark-by-omit) (define-key map "g" 'dired-filter-mark-by-garbage) (define-key map "e" 'dired-filter-mark-by-predicate) (define-key map "f" 'dired-filter-mark-by-file) (define-key map "d" 'dired-filter-mark-by-directory) (define-key map "m" 'dired-filter-mark-by-mode) (define-key map "s" 'dired-filter-mark-by-symlink) (define-key map "x" 'dired-filter-mark-by-executable) (define-key map "ig" 'dired-filter-mark-by-git-ignored) (define-key map "L" 'dired-filter-mark-by-saved-filters) map) "\
Keymap used for marking files.")

(autoload 'dired-filter-define "dired-filter" "\
Create a filter NAME.

Files matched by the predicate are kept in the listing.

For filters where the reverse behaviour makes more sense as
default, you can set the `:remove' argument to `t' to flip the
truth value by default.  Do not flip the value in the predicate
itself!

DOCUMENTATION is the documentation of the created filter.

BODY should contain forms which will be evaluated to test whether
or not a particular file should be displayed or not.  The forms
in BODY will be evaluated with FILE-NAME bound to the file name,
and QUALIFIER bound to the current argument of the filter.
During the evaluation point is at the beginning of line.

:description is a short description of this filter (usually one
or two words).

:reader is a form that is used by `interactive' to read optional
argument.  If not specified or nil, the filter does not accept
argument from user.

:qualifier-description is a form to format qualifier for display.

:remove reverses the default matching strategy of the filter.

\(fn NAME DOCUMENTATION (&key DESCRIPTION (QUALIFIER-DESCRIPTION \\='(identity qualifier)) READER REMOVE) &rest BODY)" nil t)

(function-put 'dired-filter-define 'lisp-indent-function '2)

(function-put 'dired-filter-define 'doc-string-elt '2)
 (autoload 'dired-filter-by-dot-files "dired-filter")
 (autoload 'dired-filter-mark-by-dot-files "dired-filter")
 (autoload 'dired-filter-by-name "dired-filter")
 (autoload 'dired-filter-mark-by-name "dired-filter")
 (autoload 'dired-filter-by-regexp "dired-filter")
 (autoload 'dired-filter-mark-by-regexp "dired-filter")
 (autoload 'dired-filter-by-extension "dired-filter")
 (autoload 'dired-filter-mark-by-extension "dired-filter")
 (autoload 'dired-filter-by-omit "dired-filter")
 (autoload 'dired-filter-mark-by-omit "dired-filter")
 (autoload 'dired-filter-by-git-ignored "dired-filter")
 (autoload 'dired-filter-mark-by-git-ignored "dired-filter")
 (autoload 'dired-filter-by-garbage "dired-filter")
 (autoload 'dired-filter-mark-by-garbage "dired-filter")
 (autoload 'dired-filter-by-executable "dired-filter")
 (autoload 'dired-filter-mark-by-executable "dired-filter")
 (autoload 'dired-filter-by-predicate "dired-filter")
 (autoload 'dired-filter-mark-by-predicate "dired-filter")
 (autoload 'dired-filter-by-directory "dired-filter")
 (autoload 'dired-filter-mark-by-directory "dired-filter")
 (autoload 'dired-filter-by-file "dired-filter")
 (autoload 'dired-filter-mark-by-file "dired-filter")
 (autoload 'dired-filter-by-mode "dired-filter")
 (autoload 'dired-filter-mark-by-mode "dired-filter")
 (autoload 'dired-filter-by-symlink "dired-filter")
 (autoload 'dired-filter-mark-by-symlink "dired-filter")

(autoload 'dired-filter-transpose "dired-filter" "\
Transpose the two top filters." t nil)

(autoload 'dired-filter-or "dired-filter" "\
Or the top two filters." t nil)

(autoload 'dired-filter-negate "dired-filter" "\
Logically negate the top filter." t nil)

(autoload 'dired-filter-decompose "dired-filter" "\
Decompose the composite filter on top of the stack.

This means, if the filter is an `or' or `not' filter, pop it and
push all its constituents back on the stack." t nil)

(autoload 'dired-filter-pop "dired-filter" "\
Remove the top filter in this buffer.

\(fn &optional ARG)" t nil)

(autoload 'dired-filter-pop-all "dired-filter" "\
Remove all the filters in this buffer." t nil)

(autoload 'dired-filter-save-filters "dired-filter" "\
Save the the FILTERS in this dired buffer under a NAME for later use.

\(fn NAME FILTERS)" t nil)

(autoload 'dired-filter-delete-saved-filters "dired-filter" "\
Delete saved filters with NAME from `dired-filter-saved-filters'.

\(fn NAME)" t nil)

(autoload 'dired-filter-load-saved-filters "dired-filter" "\
Set this buffer's filters to filters with NAME from `dired-filter-saved-filters'.

\(fn NAME)" t nil)

(autoload 'dired-filter-add-saved-filters "dired-filter" "\
Add to this buffer's filters filters with NAME from `dired-filter-saved-filters'.

\(fn NAME)" t nil)

(autoload 'dired-filter-mode "dired-filter" "\
Toggle filtering of files in Dired.

If called interactively, toggle `Dired-Filter mode'.  If the
prefix argument is positive, enable the mode, and if it is zero
or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

When you toggle the filter mode, the filter stack and all other
state is preserved, except the display is not altered.  This
allows you to quickly toggle the active filter without need of
popping the stack and then re-inserting the filters again.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "dired-filter" '("dired-filter"))

;;;***

;;;### (autoloads nil "dired-hacks-utils" "dired-hacks/dired-hacks-utils.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from dired-hacks/dired-hacks-utils.el

(register-definition-prefixes "dired-hacks-utils" '("dired-"))

;;;***

;;;### (autoloads nil "dired-images" "dired-hacks/dired-images.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from dired-hacks/dired-images.el

(register-definition-prefixes "dired-images" '("di-"))

;;;***

;;;### (autoloads nil "dired-list" "dired-hacks/dired-list.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from dired-hacks/dired-list.el

(autoload 'dired-list-mpc "dired-list" "\
Search mpd(1) database using QUERY and display results as a `dired' buffer.

\(fn QUERY)" t nil)

(autoload 'dired-list-git-ls-files "dired-list" "\
List all files in DIR managed by git and display results as a `dired' buffer.

\(fn DIR)" t nil)

(autoload 'dired-list-hg-locate "dired-list" "\
List all files in DIR managed by mercurial and display results as a `dired' buffer.

\(fn DIR)" t nil)

(autoload 'dired-list-locate "dired-list" "\
Locate(1) all files matching NEEDLE and display results as a `dired' buffer.

\(fn NEEDLE)" t nil)

(autoload 'dired-list-find-file "dired-list" "\
Run find(1) on DIR.

By default, directories matching `grep-find-ignored-directories'
and files matching `grep-find-ignored-files' are ignored.

If called with raw prefix argument \\[universal-argument], no
files will be ignored.

\(fn DIR CMD)" t nil)

(autoload 'dired-list-find-name "dired-list" "\
Search DIR recursively for files matching the globbing pattern PATTERN,
and run dired on those files.

PATTERN is a shell wildcard (not an Emacs regexp) and need not be quoted.

By default, directories matching `grep-find-ignored-directories'
and files matching `grep-find-ignored-files' are ignored.

If called with raw prefix argument \\[universal-argument], no
files will be ignored.

\(fn DIR PATTERN)" t nil)

(register-definition-prefixes "dired-list" '("dired-list"))

;;;***

;;;### (autoloads nil "dired-narrow" "dired-hacks/dired-narrow.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from dired-hacks/dired-narrow.el

(autoload 'dired-narrow-regexp "dired-narrow" "\
Narrow a dired buffer to the files matching a regular expression." t nil)

(autoload 'dired-narrow "dired-narrow" "\
Narrow a dired buffer to the files matching a string.

If the string contains spaces, then each word is matched against
the file name separately.  To succeed, all of them have to match
but the order does not matter.

For example \"foo bar\" matches filename \"bar-and-foo.el\"." t nil)

(autoload 'dired-narrow-fuzzy "dired-narrow" "\
Narrow a dired buffer to the files matching a fuzzy string.

A fuzzy string is constructed from the filter string by inserting
\".*\" between each letter.  This is then matched as regular
expression against the file name." t nil)

(register-definition-prefixes "dired-narrow" '("dired-narrow-"))

;;;***

;;;### (autoloads nil "dired-open" "dired-hacks/dired-open.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from dired-hacks/dired-open.el

(autoload 'dired-open-file "dired-open" "\
Try `dired-open-functions' to open the thing under point.

That can be either file or any other line of dired listing.

If no function succeeded, run `dired-find-file' normally.

With \\[universal-argument], run `dired-find-file' normally.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "dired-open" '("dired-open-"))

;;;***

;;;### (autoloads nil "dired-rainbow" "dired-hacks/dired-rainbow.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from dired-hacks/dired-rainbow.el

(register-definition-prefixes "dired-rainbow" '("dired-rainbow-"))

;;;***

;;;### (autoloads nil "dired-ranger" "dired-hacks/dired-ranger.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from dired-hacks/dired-ranger.el

(autoload 'dired-ranger-copy "dired-ranger" "\
Place the marked items in the copy ring.

With non-nil prefix argument, add the marked items to the current
selection.  This allows you to gather files from multiple dired
buffers for a single paste.

\(fn ARG)" t nil)

(autoload 'dired-ranger-paste "dired-ranger" "\
Copy the items from copy ring to current directory.

With raw prefix argument \\[universal-argument], do not remove
the selection from the stack so it can be copied again.

With numeric prefix argument, copy the n-th selection from the
copy ring.

\(fn ARG)" t nil)

(autoload 'dired-ranger-move "dired-ranger" "\
Move the items from copy ring to current directory.

This behaves like `dired-ranger-paste' but moves the files
instead of copying them.

\(fn ARG)" t nil)

(autoload 'dired-ranger-bookmark "dired-ranger" "\
Bookmark current dired buffer.

CHAR is a single character (a-zA-Z0-9) representing the bookmark.
Reusing a bookmark replaces the content.  These bookmarks are not
persistent, they are used for quick jumping back and forth
between currently used directories.

\(fn CHAR)" t nil)

(autoload 'dired-ranger-bookmark-visit "dired-ranger" "\
Visit bookmark CHAR.

If the associated dired buffer was killed, we try to reopen it
according to the setting `dired-ranger-bookmark-reopen'.

The special bookmark `dired-ranger-bookmark-LRU' always jumps to
the least recently visited dired buffer.

See also `dired-ranger-bookmark'.

\(fn CHAR)" t nil)

(register-definition-prefixes "dired-ranger" '("dired-ranger-"))

;;;***

;;;### (autoloads nil "dired-subtree" "dired-hacks/dired-subtree.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from dired-hacks/dired-subtree.el

(autoload 'dired-subtree-narrow "dired-subtree" "\
Narrow the buffer to this subtree." t nil)

(autoload 'dired-subtree-up "dired-subtree" "\
Jump up one directory.

\(fn &optional ARG)" t nil)

(autoload 'dired-subtree-down "dired-subtree" "\
Jump down one directory.

\(fn &optional ARG)" t nil)

(autoload 'dired-subtree-next-sibling "dired-subtree" "\
Go to the next sibling.

\(fn &optional ARG)" t nil)

(autoload 'dired-subtree-previous-sibling "dired-subtree" "\
Go to the previous sibling.

\(fn &optional ARG)" t nil)

(autoload 'dired-subtree-beginning "dired-subtree" "\
Go to the first file in this subtree." t nil)

(autoload 'dired-subtree-end "dired-subtree" "\
Go to the first file in this subtree." t nil)

(autoload 'dired-subtree-mark-subtree "dired-subtree" "\
Mark all files in this subtree.

With prefix argument mark all the files in subdirectories
recursively.

\(fn &optional ALL)" t nil)

(autoload 'dired-subtree-unmark-subtree "dired-subtree" "\
Unmark all files in this subtree.

With prefix argument unmark all the files in subdirectories
recursively.

\(fn &optional ALL)" t nil)

(autoload 'dired-subtree-revert "dired-subtree" "\
Revert the subtree.

This means reinserting the content of this subtree and all its
children." t nil)

(autoload 'dired-subtree-insert "dired-subtree" "\
Insert subtree under this directory." t nil)

(autoload 'dired-subtree-remove "dired-subtree" "\
Remove subtree at point." t nil)

(autoload 'dired-subtree-toggle "dired-subtree" "\
Insert subtree at point or remove it if it was not present." t nil)

(autoload 'dired-subtree-cycle "dired-subtree" "\
Org-mode like cycle visibility:

1) Show subtree
2) Show subtree recursively (if previous command was cycle)
3) Remove subtree

Numeric prefix will set max depth

\(fn &optional MAX-DEPTH)" t nil)

(autoload 'dired-subtree-only-this-file "dired-subtree" "\
Remove all the siblings on the route from this file to the top-most directory.

With ARG non-nil, do not remove expanded directories in parents.

\(fn &optional ARG)" t nil)

(autoload 'dired-subtree-only-this-directory "dired-subtree" "\
Remove all the siblings on the route from this directory to the top-most directory.

With ARG non-nil, do not remove expanded directories in parents.

\(fn &optional ARG)" t nil)

(autoload 'dired-subtree-apply-filter "dired-subtree" "\
Push a local filter for this subtree.

This depends on `dired-filter' package.

It works exactly the same as global dired filters, only
restricted to a subtree.  The global filter is also applied to
the subtree.  The filter action is read from `dired-filter-map'." t nil)

(register-definition-prefixes "dired-subtree" '("dired-"))

;;;***

;;;### (autoloads nil "dired-tagsistant" "dired-hacks/dired-tagsistant.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from dired-hacks/dired-tagsistant.el

(autoload 'dired-tagsistant-some-tags "dired-tagsistant" "\
Display all files matching some tag in TAGS.

\(fn TAGS)" t nil)

(autoload 'dired-tagsistant-all-tags "dired-tagsistant" "\
Display all files matching all tags in TAGS.

\(fn TAGS)" t nil)

(autoload 'dired-tagsistant-some-tags-regexp "dired-tagsistant" "\
Display all files where some of their tags matches REGEXP.

\(fn REGEXP)" t nil)

(autoload 'dired-tagsistant-all-tags-regexp "dired-tagsistant" "\
Display all files where all of their tags match REGEXP.

\(fn REGEXP)" t nil)

(autoload 'dired-tagsistant-list-tags "dired-tagsistant" "\
Print all tags on each file of FILES.

If FILES contains only one file, print in minibuffer, otherwise
pop a window with a list of all tags for each file.

\(fn FILES)" t nil)

(autoload 'dired-tagsistant-tag "dired-tagsistant" "\
Tag FILES with TAGS by copying them into tagsistant store.

FILES is a list of files to tag.

TAGS is a list of tags to assign to the files.  Each tripple tag
should be represented by one string.  Non-existing tags will be
created automatically.

\(fn FILES TAGS)" t nil)

(autoload 'dired-tagsistant-tag-symlink "dired-tagsistant" "\
Tag files with TAGS by tagging symlinks pointing to them.

Symbolic links are resolved recursively and always point to the
*real* file.  This saves space in the database and make updating
of broken links much simpler.

FILES is a list of files to tag.

TAGS is a list of tags to assign to the files.  Each tripple tag
should be represented by one string.  Non-existing tags will be
created automatically.

\(fn FILES TAGS)" t nil)

(autoload 'dired-tagsistant-add-relation "dired-tagsistant" "\


\(fn PARENT REL CHILD)" t nil)

(register-definition-prefixes "dired-tagsistant" '("dired-tagsistant-"))

;;;***

;;;### (autoloads nil "editorconfig" "editorconfig-emacs/editorconfig.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from editorconfig-emacs/editorconfig.el

(autoload 'editorconfig-apply "editorconfig" "\
Get and apply EditorConfig properties to current buffer.

This function does not respect the values of `editorconfig-exclude-modes' and
`editorconfig-exclude-regexps' and always applies available properties.
Use `editorconfig-mode-apply' instead to make use of these variables." t nil)

(defvar editorconfig-mode nil "\
Non-nil if Editorconfig mode is enabled.
See the `editorconfig-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `editorconfig-mode'.")

(custom-autoload 'editorconfig-mode "editorconfig" nil)

(autoload 'editorconfig-mode "editorconfig" "\
Toggle EditorConfig feature.

If called interactively, toggle `Editorconfig mode'.  If the
prefix argument is positive, enable the mode, and if it is zero
or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

To disable EditorConfig in some buffers, modify
`editorconfig-exclude-modes' or `editorconfig-exclude-regexps'.

\(fn &optional ARG)" t nil)

(autoload 'editorconfig-find-current-editorconfig "editorconfig" "\
Find the closest .editorconfig file for current file." t nil)

(autoload 'editorconfig-display-current-properties "editorconfig" "\
Display EditorConfig properties extracted for current buffer." t nil)

(defalias 'describe-editorconfig-properties 'editorconfig-display-current-properties)

(autoload 'editorconfig-format-buffer "editorconfig" "\
Format buffer according to .editorconfig indent_style and indent_width." t nil)

(autoload 'editorconfig-version "editorconfig" "\
Get EditorConfig version as string.

If called interactively or if SHOW-VERSION is non-nil, show the
version in the echo area and the messages buffer.

\(fn &optional SHOW-VERSION)" t nil)

(register-definition-prefixes "editorconfig" '("editorconfig-"))

;;;***

;;;### (autoloads nil "editorconfig-conf-mode" "editorconfig-emacs/editorconfig-conf-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from editorconfig-emacs/editorconfig-conf-mode.el

(autoload 'editorconfig-conf-mode "editorconfig-conf-mode" "\
Major mode for editing .editorconfig files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.editorconfig\\'" . editorconfig-conf-mode))

(register-definition-prefixes "editorconfig-conf-mode" '("editorconfig-conf-mode-"))

;;;***

;;;### (autoloads nil "editorconfig-core" "editorconfig-emacs/editorconfig-core.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from editorconfig-emacs/editorconfig-core.el

(autoload 'editorconfig-core-get-nearest-editorconfig "editorconfig-core" "\
Return path to .editorconfig file that is closest to DIRECTORY.

\(fn DIRECTORY)" nil nil)

(autoload 'editorconfig-core-get-properties "editorconfig-core" "\
Get EditorConfig properties for FILE.
If FILE is not given, use currently visiting file.
Give CONFNAME for basename of config file other than .editorconfig.
If need to specify config format version, give CONFVERSION.

This functions returns alist of properties.  Each element will look like
'(KEY . VALUE) .

\(fn &optional FILE CONFNAME CONFVERSION)" nil nil)

(autoload 'editorconfig-core-get-properties-hash "editorconfig-core" "\
Get EditorConfig properties for FILE.
If FILE is not given, use currently visiting file.
Give CONFNAME for basename of config file other than .editorconfig.
If need to specify config format version, give CONFVERSION.

This function is almost same as `editorconfig-core-get-properties', but returns
hash object instead.

\(fn &optional FILE CONFNAME CONFVERSION)" nil nil)

(register-definition-prefixes "editorconfig-core" '("editorconfig-core--"))

;;;***

;;;### (autoloads nil "editorconfig-core-handle" "editorconfig-emacs/editorconfig-core-handle.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from editorconfig-emacs/editorconfig-core-handle.el

(register-definition-prefixes "editorconfig-core-handle" '("editorconfig-core-handle"))

;;;***

;;;### (autoloads nil "editorconfig-fnmatch" "editorconfig-emacs/editorconfig-fnmatch.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from editorconfig-emacs/editorconfig-fnmatch.el

(autoload 'editorconfig-fnmatch-p "editorconfig-fnmatch" "\
Test whether STRING match PATTERN.

Matching ignores case if `case-fold-search' is non-nil.

PATTERN should be a shell glob pattern, and some zsh-like wildcard matchings can
be used:

*           Matches any string of characters, except path separators (/)
**          Matches any string of characters
?           Matches any single character
\[name]      Matches any single character in name
\[^name]     Matches any single character not in name
{s1,s2,s3}  Matches any of the strings given (separated by commas)
{min..max}  Matches any number between min and max

\(fn STRING PATTERN)" nil nil)

(register-definition-prefixes "editorconfig-fnmatch" '("editorconfig-fnmatch-"))

;;;***

;;;### (autoloads nil "el_client" "xelb/el_client.el" (0 0 0 0))
;;; Generated autoloads from xelb/el_client.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el_client" '("xelb-")))

;;;***

;;;### (autoloads nil "emacsql" "emacsql/emacsql.el" (0 0 0 0))
;;; Generated autoloads from emacsql/emacsql.el

(autoload 'emacsql-show-last-sql "emacsql" "\
Display the compiled SQL of the s-expression SQL expression before point.
A prefix argument causes the SQL to be printed into the current buffer.

\(fn &optional PREFIX)" t nil)

(register-definition-prefixes "emacsql" '("emacsql-"))

;;;***

;;;### (autoloads nil "emacsql-compiler" "emacsql/emacsql-compiler.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emacsql/emacsql-compiler.el

(register-definition-prefixes "emacsql-compiler" '("emacsql-"))

;;;***

;;;### (autoloads nil "emacsql-mysql" "emacsql/emacsql-mysql.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emacsql/emacsql-mysql.el

(register-definition-prefixes "emacsql-mysql" '("emacsql-mysql-"))

;;;***

;;;### (autoloads nil "emacsql-pg" "emacsql/emacsql-pg.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from emacsql/emacsql-pg.el

(register-definition-prefixes "emacsql-pg" '("emacsql-pg-connection"))

;;;***

;;;### (autoloads nil "emacsql-psql" "emacsql/emacsql-psql.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from emacsql/emacsql-psql.el

(register-definition-prefixes "emacsql-psql" '("emacsql-psql-"))

;;;***

;;;### (autoloads nil "emacsql-sqlite" "emacsql/emacsql-sqlite.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emacsql/emacsql-sqlite.el

(register-definition-prefixes "emacsql-sqlite" '("emacsql-sqlite-"))

;;;***

;;;### (autoloads nil "emms" "emms/emms.el" (0 0 0 0))
;;; Generated autoloads from emms/emms.el

(register-definition-prefixes "emms" '("define-emms-" "emms-" "with-current-emms-playlist"))

;;;***

;;;### (autoloads nil "emms-bookmarks" "emms/emms-bookmarks.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from emms/emms-bookmarks.el

(register-definition-prefixes "emms-bookmarks" '("emms-bookmarks-"))

;;;***

;;;### (autoloads nil "emms-browser" "emms/emms-browser.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from emms/emms-browser.el

(autoload 'emms-browser "emms-browser" "\
Launch or switch to the EMMS Browser." t nil)

(autoload 'emms-smart-browse "emms-browser" "\
Display browser and playlist.
Toggle between selecting browser, playlist or hiding both. Tries
to behave sanely if the user has manually changed the window
configuration." t nil)

(register-definition-prefixes "emms-browser" '("case-fold-string" "emms-"))

;;;***

;;;### (autoloads nil "emms-cache" "emms/emms-cache.el" (0 0 0 0))
;;; Generated autoloads from emms/emms-cache.el

(autoload 'emms-cache-enable "emms-cache" "\
Enable caching of Emms track data." t nil)

(autoload 'emms-cache-disable "emms-cache" "\
Disable caching of Emms track data." t nil)

(autoload 'emms-cache-toggle "emms-cache" "\
Toggle caching of Emms track data." t nil)

(register-definition-prefixes "emms-cache" '("emms-cache"))

;;;***

;;;### (autoloads nil "emms-compat" "emms/emms-compat.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from emms/emms-compat.el

(register-definition-prefixes "emms-compat" '("emms-"))

;;;***

;;;### (autoloads nil "emms-cue" "emms/emms-cue.el" (0 0 0 0))
;;; Generated autoloads from emms/emms-cue.el

(register-definition-prefixes "emms-cue" '("emms-"))

;;;***

;;;### (autoloads nil "emms-history" "emms/emms-history.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from emms/emms-history.el

(register-definition-prefixes "emms-history" '("emms-history-"))

;;;***

;;;### (autoloads nil "emms-i18n" "emms/emms-i18n.el" (0 0 0 0))
;;; Generated autoloads from emms/emms-i18n.el

(register-definition-prefixes "emms-i18n" '("emms-i18n-"))

;;;***

;;;### (autoloads nil "emms-info" "emms/emms-info.el" (0 0 0 0))
;;; Generated autoloads from emms/emms-info.el

(register-definition-prefixes "emms-info" '("emms-info-"))

;;;***

;;;### (autoloads nil "emms-info-exiftool" "emms/emms-info-exiftool.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-info-exiftool.el

(register-definition-prefixes "emms-info-exiftool" '("emms-info-exiftool"))

;;;***

;;;### (autoloads nil "emms-info-libtag" "emms/emms-info-libtag.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-info-libtag.el

(register-definition-prefixes "emms-info-libtag" '("emms-info-libtag"))

;;;***

;;;### (autoloads nil "emms-info-metaflac" "emms/emms-info-metaflac.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-info-metaflac.el

(register-definition-prefixes "emms-info-metaflac" '("emms-info-metaflac"))

;;;***

;;;### (autoloads nil "emms-info-mp3info" "emms/emms-info-mp3info.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-info-mp3info.el

(register-definition-prefixes "emms-info-mp3info" '("emms-info-mp3"))

;;;***

;;;### (autoloads nil "emms-info-native" "emms/emms-info-native.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-info-native.el

(register-definition-prefixes "emms-info-native" '("emms-info-native"))

;;;***

;;;### (autoloads nil "emms-info-ogginfo" "emms/emms-info-ogginfo.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-info-ogginfo.el

(register-definition-prefixes "emms-info-ogginfo" '("emms-info-ogginfo"))

;;;***

;;;### (autoloads nil "emms-info-opusinfo" "emms/emms-info-opusinfo.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-info-opusinfo.el

(register-definition-prefixes "emms-info-opusinfo" '("emms-info-opusinfo"))

;;;***

;;;### (autoloads nil "emms-info-tinytag" "emms/emms-info-tinytag.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-info-tinytag.el

(register-definition-prefixes "emms-info-tinytag" '("emms-info-tinytag"))

;;;***

;;;### (autoloads nil "emms-last-played" "emms/emms-last-played.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-last-played.el

(register-definition-prefixes "emms-last-played" '("emms-last-played-"))

;;;***

;;;### (autoloads nil "emms-later-do" "emms/emms-later-do.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from emms/emms-later-do.el

(register-definition-prefixes "emms-later-do" '("emms-later-do"))

;;;***

;;;### (autoloads nil "emms-librefm-scrobbler" "emms/emms-librefm-scrobbler.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-librefm-scrobbler.el

(register-definition-prefixes "emms-librefm-scrobbler" '("emms-librefm-scrobbler-"))

;;;***

;;;### (autoloads nil "emms-librefm-stream" "emms/emms-librefm-stream.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-librefm-stream.el

(register-definition-prefixes "emms-librefm-stream" '("emms-librefm-stream"))

;;;***

;;;### (autoloads nil "emms-lyrics" "emms/emms-lyrics.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from emms/emms-lyrics.el

(autoload 'emms-lyrics-enable "emms-lyrics" "\
Enable displaying emms lyrics." t nil)

(autoload 'emms-lyrics-disable "emms-lyrics" "\
Disable displaying emms lyrics." t nil)

(autoload 'emms-lyrics-toggle "emms-lyrics" "\
Toggle displaying emms lyrics." t nil)

(register-definition-prefixes "emms-lyrics" '("emms-lyrics"))

;;;***

;;;### (autoloads nil "emms-mark" "emms/emms-mark.el" (0 0 0 0))
;;; Generated autoloads from emms/emms-mark.el

(register-definition-prefixes "emms-mark" '("emms-mark-"))

;;;***

;;;### (autoloads nil "emms-metaplaylist-mode" "emms/emms-metaplaylist-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-metaplaylist-mode.el

(register-definition-prefixes "emms-metaplaylist-mode" '("emms-metaplaylist-mode"))

;;;***

;;;### (autoloads nil "emms-mode-line" "emms/emms-mode-line.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from emms/emms-mode-line.el

(autoload 'emms-mode-line-enable "emms-mode-line" "\
Turn on `emms-mode-line'." t nil)

(autoload 'emms-mode-line-disable "emms-mode-line" "\
Turn off `emms-mode-line'." t nil)

(autoload 'emms-mode-line-toggle "emms-mode-line" "\
Toggle `emms-mode-line'." t nil)

(register-definition-prefixes "emms-mode-line" '("emms-mode-line"))

;;;***

;;;### (autoloads nil "emms-mode-line-icon" "emms/emms-mode-line-icon.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-mode-line-icon.el

(register-definition-prefixes "emms-mode-line-icon" '("emms-mode-line-icon-"))

;;;***

;;;### (autoloads nil "emms-player-mpd" "emms/emms-player-mpd.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-player-mpd.el

(autoload 'emms-player-mpd-clear "emms-player-mpd" "\
Clear the MusicPD playlist." t nil)

(autoload 'emms-player-mpd-connect "emms-player-mpd" "\
Connect to MusicPD and retrieve its current playlist.

Afterward, the status of MusicPD will be tracked.

This also has the effect of changing the current EMMS playlist to
be the same as the current MusicPD playlist.  Thus, this
function is useful to call if the contents of the EMMS playlist
buffer get out-of-sync for some reason." t nil)

(autoload 'emms-player-mpd-show "emms-player-mpd" "\
Describe the current EMMS track in the minibuffer.

If INSERTP is non-nil, insert the description into the current
buffer instead.

If CALLBACK is a function, call it with the current buffer and
description as arguments instead of displaying the description or
inserting it.

This function uses `emms-show-format' to format the current track.
It differs from `emms-show' in that it asks MusicPD for the current track,
rather than EMMS.

\(fn &optional INSERTP CALLBACK)" t nil)

(register-definition-prefixes "emms-player-mpd" '("emms-"))

;;;***

;;;### (autoloads nil "emms-player-mpg321-remote" "emms/emms-player-mpg321-remote.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-player-mpg321-remote.el

(register-definition-prefixes "emms-player-mpg321-remote" '("emms-player-mpg321-remote"))

;;;***

;;;### (autoloads nil "emms-player-mplayer" "emms/emms-player-mplayer.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-player-mplayer.el

(register-definition-prefixes "emms-player-mplayer" '("emms-player-mplayer-" "mplayer"))

;;;***

;;;### (autoloads nil "emms-player-mpv" "emms/emms-player-mpv.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-player-mpv.el

(register-definition-prefixes "emms-player-mpv" '("emms-player-mpv"))

;;;***

;;;### (autoloads nil "emms-player-simple" "emms/emms-player-simple.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-player-simple.el

(register-definition-prefixes "emms-player-simple" '("alsaplayer" "define-emms-simple-player" "emms-player-" "fluidsynth" "mikmod" "mpg321" "ogg123" "playsound" "speexdec" "timidity"))

;;;***

;;;### (autoloads nil "emms-player-vlc" "emms/emms-player-vlc.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-player-vlc.el

(register-definition-prefixes "emms-player-vlc" '("emms-player-vlc-" "vlc"))

;;;***

;;;### (autoloads nil "emms-player-xine" "emms/emms-player-xine.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-player-xine.el

(register-definition-prefixes "emms-player-xine" '("emms-" "xine"))

;;;***

;;;### (autoloads nil "emms-playing-time" "emms/emms-playing-time.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-playing-time.el

(autoload 'emms-playing-time-enable-display "emms-playing-time" "\
Display playing time on mode line." t nil)

(autoload 'emms-playing-time-disable-display "emms-playing-time" "\
Remove playing time from mode line." t nil)

(register-definition-prefixes "emms-playing-time" '("emms-playing-time"))

;;;***

;;;### (autoloads nil "emms-playlist-limit" "emms/emms-playlist-limit.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-playlist-limit.el

(register-definition-prefixes "emms-playlist-limit" '("define-emms-playlist-limit" "emms-playlist-limit-"))

;;;***

;;;### (autoloads nil "emms-playlist-mode" "emms/emms-playlist-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-playlist-mode.el

(autoload 'emms-playlist-mode "emms-playlist-mode" "\
A major mode for Emms playlists.
\\{emms-playlist-mode-map}" t nil)

(register-definition-prefixes "emms-playlist-mode" '("emms"))

;;;***

;;;### (autoloads nil "emms-playlist-sort" "emms/emms-playlist-sort.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-playlist-sort.el

(register-definition-prefixes "emms-playlist-sort" '("define-emms-playlist-sort" "emms-"))

;;;***

;;;### (autoloads nil "emms-score" "emms/emms-score.el" (0 0 0 0))
;;; Generated autoloads from emms/emms-score.el

(autoload 'emms-score-enable "emms-score" "\
Turn on emms-score." t nil)

(autoload 'emms-score-disable "emms-score" "\
Turn off emms-score." t nil)

(autoload 'emms-score-toggle "emms-score" "\
Toggle emms-score." t nil)

(register-definition-prefixes "emms-score" '("emms-score"))

;;;***

;;;### (autoloads nil "emms-setup" "emms/emms-setup.el" (0 0 0 0))
;;; Generated autoloads from emms/emms-setup.el

(autoload 'emms-minimalistic "emms-setup" "\
An Emms setup script.
Invisible playlists and all the basics for playing media." nil nil)

(autoload 'emms-all "emms-setup" "\
An Emms setup script.
Everything included in the `emms-minimalistic' setup and adds all
the stable features which come with the Emms distribution." nil nil)

(autoload 'emms-default-players "emms-setup" "\
Set `emms-player-list' to `emms-setup-default-player-list'." nil nil)

(autoload 'emms-devel "emms-setup" nil nil nil)

(autoload 'emms-standard "emms-setup" nil nil nil)

(register-definition-prefixes "emms-setup" '("emms-setup-default-player-list"))

;;;***

;;;### (autoloads nil "emms-show-all" "emms/emms-show-all.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from emms/emms-show-all.el

(register-definition-prefixes "emms-show-all" '("emms-show-all"))

;;;***

;;;### (autoloads nil "emms-source-file" "emms/emms-source-file.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-source-file.el
 (autoload 'emms-play-file "emms-source-file" nil t)
 (autoload 'emms-add-file "emms-source-file" nil t)
 (autoload 'emms-play-directory "emms-source-file" nil t)
 (autoload 'emms-add-directory "emms-source-file" nil t)
 (autoload 'emms-play-directory-tree "emms-source-file" nil t)
 (autoload 'emms-add-directory-tree "emms-source-file" nil t)
 (autoload 'emms-play-find "emms-source-file" nil t)
 (autoload 'emms-add-find "emms-source-file" nil t)
 (autoload 'emms-play-dired "emms-source-file" nil t)
 (autoload 'emms-add-dired "emms-source-file" nil t)

(autoload 'emms-source-file-directory-tree "emms-source-file" "\
Return a list of all files under DIR that match REGEX.
This function uses `emms-source-file-directory-tree-function'.

\(fn DIR REGEX)" nil nil)

(autoload 'emms-source-file-regex "emms-source-file" "\
Return a regexp that matches everything any player (that supports
files) can play." nil nil)

(autoload 'emms-locate "emms-source-file" "\
Search for REGEXP and display the results in a locate buffer

\(fn REGEXP)" t nil)
 (autoload 'emms-play-url "emms-source-file" nil t)
 (autoload 'emms-add-url "emms-source-file" nil t)
 (autoload 'emms-play-streamlist "emms-source-file" nil t)
 (autoload 'emms-add-streamlist "emms-source-file" nil t)

(register-definition-prefixes "emms-source-file" '("dire" "emms-" "file" "find" "streamlist" "url"))

;;;***

;;;### (autoloads nil "emms-source-playlist" "emms/emms-source-playlist.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-source-playlist.el
 (autoload 'emms-play-playlist "emms-source-playlist" nil t)
 (autoload 'emms-add-playlist "emms-source-playlist" nil t)
 (autoload 'emms-play-native-playlist "emms-source-playlist" nil t)
 (autoload 'emms-add-native-playlist "emms-source-playlist" nil t)
 (autoload 'emms-play-m3u-playlist "emms-source-playlist" nil t)
 (autoload 'emms-add-m3u-playlist "emms-source-playlist" nil t)
 (autoload 'emms-play-pls-playlist "emms-source-playlist" nil t)
 (autoload 'emms-add-pls-playlist "emms-source-playlist" nil t)
 (autoload 'emms-play-playlist-file "emms-source-playlist" nil t)
 (autoload 'emms-add-playlist-file "emms-source-playlist" nil t)
 (autoload 'emms-play-playlist-directory
          "emms-source-playlist" nil t)
 (autoload 'emms-add-playlist-directory
          "emms-source-playlist" nil t)
 (autoload 'emms-play-playlist-directory-tree
          "emms-source-playlist" nil t)
 (autoload 'emms-add-playlist-directory-tree
          "emms-source-file" nil t)

(register-definition-prefixes "emms-source-playlist" '("emms-" "m3u-playlist" "native-playlist" "playlist" "pls-playlist"))

;;;***

;;;### (autoloads nil "emms-streams" "emms/emms-streams.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from emms/emms-streams.el

(register-definition-prefixes "emms-streams" '("emms-streams"))

;;;***

;;;### (autoloads nil "emms-tag-editor" "emms/emms-tag-editor.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-tag-editor.el

(register-definition-prefixes "emms-tag-editor" '("emms-tag-editor-"))

;;;***

;;;### (autoloads nil "emms-url" "emms/emms-url.el" (0 0 0 0))
;;; Generated autoloads from emms/emms-url.el

(register-definition-prefixes "emms-url" '("emms-"))

;;;***

;;;### (autoloads nil "emms-volume" "emms/emms-volume.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from emms/emms-volume.el

(autoload 'emms-volume-raise "emms-volume" "\
Raise the speaker volume." t nil)

(autoload 'emms-volume-lower "emms-volume" "\
Lower the speaker volume." t nil)

(autoload 'emms-volume-mode-plus "emms-volume" "\
Raise volume and enable or extend the `emms-volume-minor-mode' timeout." t nil)

(autoload 'emms-volume-mode-minus "emms-volume" "\
Lower volume and enable or extend the `emms-volume-minor-mode' timeout." t nil)

(register-definition-prefixes "emms-volume" '("emms-volume-"))

;;;***

;;;### (autoloads nil "emms-volume-amixer" "emms/emms-volume-amixer.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-volume-amixer.el

(autoload 'emms-volume-amixer-change "emms-volume-amixer" "\
Change amixer master volume by AMOUNT.

\(fn AMOUNT)" nil nil)

(register-definition-prefixes "emms-volume-amixer" '("emms-volume-amixer-c"))

;;;***

;;;### (autoloads nil "emms-volume-mixerctl" "emms/emms-volume-mixerctl.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-volume-mixerctl.el

(autoload 'emms-volume-mixerctl-change "emms-volume-mixerctl" "\
Change mixerctl master volume by AMOUNT.

\(fn AMOUNT)" nil nil)

(register-definition-prefixes "emms-volume-mixerctl" '("emms-volume-mixerctl-c"))

;;;***

;;;### (autoloads nil "emms-volume-pulse" "emms/emms-volume-pulse.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emms/emms-volume-pulse.el

(autoload 'emms-volume-pulse-change "emms-volume-pulse" "\
Change PulseAudio volume by AMOUNT.

\(fn AMOUNT)" nil nil)

(register-definition-prefixes "emms-volume-pulse" '("emms-volume-"))

;;;***

;;;### (autoloads nil "exwm" "exwm/exwm.el" (0 0 0 0))
;;; Generated autoloads from exwm/exwm.el

(autoload 'exwm-restart "exwm" "\
Restart EXWM." t nil)

(autoload 'exwm-init "exwm" "\
Initialize EXWM.

\(fn &optional FRAME)" t nil)

(autoload 'exwm-exit "exwm" "\
Exit EXWM." t nil)

(autoload 'exwm-enable "exwm" "\
Enable/Disable EXWM.

\(fn &optional UNDO)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm" '("exwm-")))

;;;***

;;;### (autoloads nil "exwm-cm" "exwm/exwm-cm.el" (0 0 0 0))
;;; Generated autoloads from exwm/exwm-cm.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-cm" '("exwm-cm-")))

;;;***

;;;### (autoloads nil "exwm-config" "exwm/exwm-config.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from exwm/exwm-config.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-config" '("exwm-config-")))

;;;***

;;;### (autoloads nil "exwm-core" "exwm/exwm-core.el" (0 0 0 0))
;;; Generated autoloads from exwm/exwm-core.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-core" '("exwm-")))

;;;***

;;;### (autoloads nil "exwm-floating" "exwm/exwm-floating.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from exwm/exwm-floating.el

(autoload 'exwm-floating-toggle-floating "exwm-floating" "\
Toggle the current window between floating and non-floating states." t nil)

(autoload 'exwm-floating-hide "exwm-floating" "\
Hide the current floating X window (which would show again when selected)." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-floating" '("exwm-floating-")))

;;;***

;;;### (autoloads nil "exwm-input" "exwm/exwm-input.el" (0 0 0 0))
;;; Generated autoloads from exwm/exwm-input.el

(autoload 'exwm-input-set-key "exwm-input" "\
Set a global key binding.

The new key binding only takes effect in real time when this command is
called interactively, and is lost when this session ends unless it's
specifically saved in the Customize interface for `exwm-input-global-keys'.

In configuration you should customize or set `exwm-input-global-keys'
instead.

\(fn KEY COMMAND)" t nil)

(autoload 'exwm-input-grab-keyboard "exwm-input" "\
Switch to line-mode.

\(fn &optional ID)" t nil)

(autoload 'exwm-input-release-keyboard "exwm-input" "\
Switch to char-mode.

\(fn &optional ID)" t nil)

(autoload 'exwm-input-toggle-keyboard "exwm-input" "\
Toggle between 'line-mode' and 'char-mode'.

\(fn &optional ID)" t nil)

(autoload 'exwm-input-send-next-key "exwm-input" "\
Send next key to client window.

EXWM will prompt for the key to send.  This command can be prefixed to send
multiple keys.  If END-KEY is non-nil, stop sending keys if it's pressed.

\(fn TIMES &optional END-KEY)" t nil)

(autoload 'exwm-input-set-simulation-key "exwm-input" "\
Set a simulation key.

The simulation key takes effect in real time, but is lost when this session
ends unless it's specifically saved in the Customize interface for
`exwm-input-simulation-keys'.

\(fn ORIGINAL-KEY SIMULATED-KEY)" t nil)

(autoload 'exwm-input-send-simulation-key "exwm-input" "\
Fake a key event according to the last input key sequence.

\(fn TIMES)" t nil)

(autoload 'exwm-input-invoke-factory "exwm-input" "\
Make a command that invokes KEYS when called.

One use is to access the keymap bound to KEYS (as prefix keys) in char-mode.

\(fn KEYS)" nil t)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-input" '("exwm-input-")))

;;;***

;;;### (autoloads nil "exwm-layout" "exwm/exwm-layout.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from exwm/exwm-layout.el

(autoload 'exwm-layout-set-fullscreen "exwm-layout" "\
Make window ID fullscreen.

\(fn &optional ID)" t nil)

(autoload 'exwm-layout-unset-fullscreen "exwm-layout" "\
Restore window from fullscreen state.

\(fn &optional ID)" t nil)

(autoload 'exwm-layout-toggle-fullscreen "exwm-layout" "\
Toggle fullscreen mode.

\(fn &optional ID)" t nil)

(autoload 'exwm-layout-enlarge-window "exwm-layout" "\
Make the selected window DELTA pixels taller.

If no argument is given, make the selected window one pixel taller.  If the
optional argument HORIZONTAL is non-nil, make selected window DELTA pixels
wider.  If DELTA is negative, shrink selected window by -DELTA pixels.

Normal hints are checked and regarded if the selected window is displaying an
`exwm-mode' buffer.  However, this may violate the normal hints set on other X
windows.

\(fn DELTA &optional HORIZONTAL)" t nil)

(autoload 'exwm-layout-enlarge-window-horizontally "exwm-layout" "\
Make the selected window DELTA pixels wider.

See also `exwm-layout-enlarge-window'.

\(fn DELTA)" t nil)

(autoload 'exwm-layout-shrink-window "exwm-layout" "\
Make the selected window DELTA pixels lower.

See also `exwm-layout-enlarge-window'.

\(fn DELTA)" t nil)

(autoload 'exwm-layout-shrink-window-horizontally "exwm-layout" "\
Make the selected window DELTA pixels narrower.

See also `exwm-layout-enlarge-window'.

\(fn DELTA)" t nil)

(autoload 'exwm-layout-hide-mode-line "exwm-layout" "\
Hide mode-line." t nil)

(autoload 'exwm-layout-show-mode-line "exwm-layout" "\
Show mode-line." t nil)

(autoload 'exwm-layout-toggle-mode-line "exwm-layout" "\
Toggle the display of mode-line." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-layout" '("exwm-layout-")))

;;;***

;;;### (autoloads nil "exwm-manage" "exwm/exwm-manage.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from exwm/exwm-manage.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-manage" '("exwm-manage-")))

;;;***

;;;### (autoloads nil "exwm-randr" "exwm/exwm-randr.el" (0 0 0 0))
;;; Generated autoloads from exwm/exwm-randr.el

(autoload 'exwm-randr-refresh "exwm-randr" "\
Refresh workspaces according to the updated RandR info." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-randr" '("exwm-randr-")))

;;;***

;;;### (autoloads nil "exwm-systemtray" "exwm/exwm-systemtray.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from exwm/exwm-systemtray.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-systemtray" '("exwm-systemtray-" "xcb:systemtray:-ClientMessage")))

;;;***

;;;### (autoloads nil "exwm-workspace" "exwm/exwm-workspace.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from exwm/exwm-workspace.el

(autoload 'exwm-workspace--get-geometry "exwm-workspace" "\
Return the geometry of frame FRAME.

\(fn FRAME)" nil nil)

(autoload 'exwm-workspace--current-height "exwm-workspace" "\
Return the height of current workspace." nil nil)

(autoload 'exwm-workspace--minibuffer-own-frame-p "exwm-workspace" "\
Reports whether the minibuffer is displayed in its own frame." nil nil)

(autoload 'exwm-workspace-switch "exwm-workspace" "\
Switch to workspace INDEX (0-based).

Query for the index if not specified when called interactively.  Passing a
workspace frame as the first option or making use of the rest options are
for internal use only.

\(fn FRAME-OR-INDEX &optional FORCE)" t nil)

(autoload 'exwm-workspace-switch-create "exwm-workspace" "\
Switch to workspace INDEX or creating it first if it does not exist yet.

Passing a workspace frame as the first option is for internal use only.

\(fn FRAME-OR-INDEX)" t nil)

(autoload 'exwm-workspace-swap "exwm-workspace" "\
Interchange position of WORKSPACE1 with that of WORKSPACE2.

\(fn WORKSPACE1 WORKSPACE2)" t nil)

(autoload 'exwm-workspace-move "exwm-workspace" "\
Move WORKSPACE to the NTH position.

When called interactively, prompt for a workspace and move current one just
before it.

\(fn WORKSPACE NTH)" t nil)

(autoload 'exwm-workspace-add "exwm-workspace" "\
Add a workspace as the INDEX-th workspace, or the last one if INDEX is nil.

INDEX must not exceed the current number of workspaces.

\(fn &optional INDEX)" t nil)

(autoload 'exwm-workspace-delete "exwm-workspace" "\
Delete the workspace FRAME-OR-INDEX.

\(fn &optional FRAME-OR-INDEX)" t nil)

(autoload 'exwm-workspace-move-window "exwm-workspace" "\
Move window ID to workspace FRAME-OR-INDEX.

\(fn FRAME-OR-INDEX &optional ID)" t nil)

(autoload 'exwm-workspace-switch-to-buffer "exwm-workspace" "\
Make the current Emacs window display another buffer.

\(fn BUFFER-OR-NAME)" t nil)

(autoload 'exwm-workspace-attach-minibuffer "exwm-workspace" "\
Attach the minibuffer so that it always shows." t nil)

(autoload 'exwm-workspace-detach-minibuffer "exwm-workspace" "\
Detach the minibuffer so that it automatically hides." t nil)

(autoload 'exwm-workspace-toggle-minibuffer "exwm-workspace" "\
Attach the minibuffer if it's detached, or detach it if it's attached." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-workspace" '("exwm-workspace-")))

;;;***

;;;### (autoloads nil "exwm-xim" "exwm/exwm-xim.el" (0 0 0 0))
;;; Generated autoloads from exwm/exwm-xim.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-xim" '("exwm-xim-")))

;;;***

;;;### (autoloads nil "flycheck" "flycheck/flycheck.el" (0 0 0 0))
;;; Generated autoloads from flycheck/flycheck.el

(autoload 'flycheck-manual "flycheck" "\
Open the Flycheck manual." t nil)

(autoload 'flycheck-mode "flycheck" "\
Flycheck is a minor mode for on-the-fly syntax checking.

In `flycheck-mode' the buffer is automatically syntax-checked
using the first suitable syntax checker from `flycheck-checkers'.
Use `flycheck-select-checker' to select a checker for the current
buffer manually.

If you run into issues, use `\\[flycheck-verify-setup]' to get help.

Flycheck supports many languages out of the box, and many
additional ones are available on MELPA.  Adding new ones is very
easy.  Complete documentation is available online at URL
`https://www.flycheck.org/en/latest/'.  Please report issues and
request features at URL `https://github.com/flycheck/flycheck'.

Flycheck displays its status in the mode line.  In the default
configuration, it looks like this:

`FlyC'     This buffer has not been checked yet.
`FlyC-'    Flycheck doesn't have a checker for this buffer.
`FlyC*'    Flycheck is running.  Expect results soon!
`FlyC:3|2' This buffer contains three warnings and two errors.
           Use `\\[flycheck-list-errors]' to see the list.

You may also see the following icons:
`FlyC!'    The checker crashed.
`FlyC.'    The last syntax check was manually interrupted.
`FlyC?'    The checker did something unexpected, like exiting with 1
           but returning no errors.

The following keybindings are available in `flycheck-mode':

\\{flycheck-mode-map}
\(you can change the prefix by customizing
`flycheck-keymap-prefix')

If called interactively, enable Flycheck mode if ARG is positive,
and disable it if ARG is zero or negative.  If called from Lisp,
also enable the mode if ARG is omitted or nil, and toggle it if
ARG is ‘toggle’; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(put 'global-flycheck-mode 'globalized-minor-mode t)

(defvar global-flycheck-mode nil "\
Non-nil if Global Flycheck mode is enabled.
See the `global-flycheck-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-flycheck-mode'.")

(custom-autoload 'global-flycheck-mode "flycheck" nil)

(autoload 'global-flycheck-mode "flycheck" "\
Toggle Flycheck mode in all buffers.
With prefix ARG, enable Global Flycheck mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if ARG is
omitted or nil.

Flycheck mode is enabled in all buffers where
`flycheck-mode-on-safe' would do it.

See `flycheck-mode' for more information on Flycheck mode.

\(fn &optional ARG)" t nil)

(autoload 'flycheck-define-error-level "flycheck" "\
Define a new error LEVEL with PROPERTIES.

The following PROPERTIES constitute an error level:

`:severity SEVERITY'
     A number denoting the severity of this level.  The higher
     the number, the more severe is this level compared to other
     levels.  Defaults to 0; info is -10, warning is 10, and
     error is 100.

     The severity is used by `flycheck-error-level-<' to
     determine the ordering of errors according to their levels.

`:compilation-level LEVEL'

     A number indicating the broad class of messages that errors
     at this level belong to: one of 0 (info), 1 (warning), or
     2 or nil (error).  Defaults to nil.

     This is used by `flycheck-checker-pattern-to-error-regexp'
     to map error levels into `compilation-mode''s hierarchy and
     to get proper highlighting of errors in `compilation-mode'.

`:overlay-category CATEGORY'
     A symbol denoting the overlay category to use for error
     highlight overlays for this level.  See Info
     node `(elisp)Overlay Properties' for more information about
     overlay categories.

     A category for an error level overlay should at least define
     the `face' property, for error highlighting.  Another useful
     property for error level categories is `priority', to
     influence the stacking of multiple error level overlays.

`:fringe-bitmap BITMAPS'
     A fringe bitmap symbol denoting the bitmap to use for fringe
     indicators for this level, or a cons of two bitmaps (one for
     narrow fringes and one for wide fringes).  See Info node
     `(elisp)Fringe Bitmaps' for more information about fringe
     bitmaps, including a list of built-in fringe bitmaps.

`:fringe-face FACE'
     A face symbol denoting the face to use for fringe indicators
     for this level.

`:margin-spec SPEC'
     A display specification indicating what to display in the
     margin when `flycheck-indication-mode' is `left-margin' or
     `right-margin'.  See Info node `(elisp)Displaying in the
     Margins'.  If omitted, Flycheck generates an image spec from
     the fringe bitmap.

`:error-list-face FACE'
     A face symbol denoting the face to use for messages of this
     level in the error list.  See `flycheck-list-errors'.

\(fn LEVEL &rest PROPERTIES)" nil nil)

(function-put 'flycheck-define-error-level 'lisp-indent-function '1)

(autoload 'flycheck-define-command-checker "flycheck" "\
Define SYMBOL as syntax checker to run a command.

Define SYMBOL as generic syntax checker via
`flycheck-define-generic-checker', which uses an external command
to check the buffer.  SYMBOL and DOCSTRING are the same as for
`flycheck-define-generic-checker'.

In addition to the properties understood by
`flycheck-define-generic-checker', the following PROPERTIES
constitute a command syntax checker.  Unless otherwise noted, all
properties are mandatory.  Note that the default `:error-filter'
of command checkers is `flycheck-sanitize-errors'.

`:command COMMAND'
     The command to run for syntax checking.

     COMMAND is a list of the form `(EXECUTABLE [ARG ...])'.

     EXECUTABLE is a string with the executable of this syntax
     checker.  It can be overridden with the variable
     `flycheck-SYMBOL-executable'.  Note that this variable is
     NOT implicitly defined by this function.  Use
     `flycheck-def-executable-var' to define this variable.

     Each ARG is an argument to the executable, either as string,
     or as special symbol or form for
     `flycheck-substitute-argument', which see.

`:error-patterns PATTERNS'
     A list of patterns to parse the output of the `:command'.

     Each ITEM in PATTERNS is a list `(LEVEL SEXP ...)', where
     LEVEL is a Flycheck error level (see
     `flycheck-define-error-level'), followed by one or more RX
     `SEXP's which parse an error of that level and extract line,
     column, file name and the message.

     See `rx' for general information about RX, and
     `flycheck-rx-to-string' for some special RX forms provided
     by Flycheck.

     All patterns are applied in the order of declaration to the
     whole output of the syntax checker.  Output already matched
     by a pattern will not be matched by subsequent patterns.  In
     other words, the first pattern wins.

     This property is optional.  If omitted, however, an
     `:error-parser' is mandatory.

`:error-parser FUNCTION'
     A function to parse errors with.

     The function shall accept three arguments OUTPUT CHECKER
     BUFFER.  OUTPUT is the syntax checker output as string,
     CHECKER the syntax checker that was used, and BUFFER a
     buffer object representing the checked buffer.  The function
     must return a list of `flycheck-error' objects parsed from
     OUTPUT.

     This property is optional.  If omitted, it defaults to
     `flycheck-parse-with-patterns'.  In this case,
     `:error-patterns' is mandatory.

`:standard-input t'
     Whether to send the buffer contents on standard input.

     If this property is given and has a non-nil value, send the
     contents of the buffer on standard input.

     Defaults to nil.

Note that you may not give `:start', `:interrupt', and
`:print-doc' for a command checker.  You can give a custom
`:verify' function, though, whose results will be appended to the
default `:verify' function of command checkers.

\(fn SYMBOL DOCSTRING &rest PROPERTIES)" nil nil)

(function-put 'flycheck-define-command-checker 'lisp-indent-function '1)

(function-put 'flycheck-define-command-checker 'doc-string-elt '2)

(autoload 'flycheck-def-config-file-var "flycheck" "\
Define SYMBOL as config file variable for CHECKER, with default FILE-NAME.

SYMBOL is declared as customizable variable using `defcustom', to
provide configuration files for the given syntax CHECKER.
CUSTOM-ARGS are forwarded to `defcustom'.

FILE-NAME is the initial value of the new variable.  If omitted,
the default value is nil.  It can be either a string or a list of
strings.

Use this together with the `config-file' form in the `:command'
argument to `flycheck-define-checker'.

\(fn SYMBOL CHECKER &optional FILE-NAME &rest CUSTOM-ARGS)" nil t)

(function-put 'flycheck-def-config-file-var 'lisp-indent-function '3)

(autoload 'flycheck-def-option-var "flycheck" "\
Define SYMBOL as option variable with INIT-VALUE for CHECKER.

SYMBOL is declared as customizable variable using `defcustom', to
provide an option for the given syntax CHECKERS (a checker or a
list of checkers).  INIT-VALUE is the initial value of the
variable, and DOCSTRING is its docstring.  CUSTOM-ARGS are
forwarded to `defcustom'.

Use this together with the `option', `option-list' and
`option-flag' forms in the `:command' argument to
`flycheck-define-checker'.

\(fn SYMBOL INIT-VALUE CHECKERS DOCSTRING &rest CUSTOM-ARGS)" nil t)

(function-put 'flycheck-def-option-var 'lisp-indent-function '3)

(function-put 'flycheck-def-option-var 'doc-string-elt '4)

(autoload 'flycheck-define-checker "flycheck" "\
Define SYMBOL as command syntax checker with DOCSTRING and PROPERTIES.

Like `flycheck-define-command-checker', but PROPERTIES must not
be quoted.  Also, implicitly define the executable variable for
SYMBOL with `flycheck-def-executable-var'.

\(fn SYMBOL DOCSTRING &rest PROPERTIES)" nil t)

(function-put 'flycheck-define-checker 'lisp-indent-function '1)

(function-put 'flycheck-define-checker 'doc-string-elt '2)

(register-definition-prefixes "flycheck" '("flycheck-" "help-flycheck-checker-d" "list-flycheck-errors"))

;;;***

;;;### (autoloads nil "flycheck-buttercup" "flycheck/flycheck-buttercup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from flycheck/flycheck-buttercup.el

(register-definition-prefixes "flycheck-buttercup" '("flycheck-buttercup-format-error-list"))

;;;***

;;;### (autoloads nil "flycheck-ert" "flycheck/flycheck-ert.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from flycheck/flycheck-ert.el

(register-definition-prefixes "flycheck-ert" '("flycheck-er"))

;;;***

;;;### (autoloads nil "gcmh" "gcmh/gcmh.el" (0 0 0 0))
;;; Generated autoloads from gcmh/gcmh.el

(defvar gcmh-mode nil "\
Non-nil if Gcmh mode is enabled.
See the `gcmh-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `gcmh-mode'.")

(custom-autoload 'gcmh-mode "gcmh" nil)

(autoload 'gcmh-mode "gcmh" "\
Minor mode to tweak Garbage Collection strategy.

If called interactively, toggle `Gcmh mode'.  If the prefix
argument is positive, enable the mode, and if it is zero or
negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "gcmh" '("gcmh-"))

;;;***

;;;### (autoloads nil "ghub" "ghub/ghub.el" (0 0 0 0))
;;; Generated autoloads from ghub/ghub.el

(autoload 'ghub-clear-caches "ghub" "\
Clear all caches that might negatively affect Ghub.

If a library that is used by Ghub caches incorrect information
such as a mistyped password, then that can prevent Ghub from
asking the user for the correct information again.

Set `url-http-real-basic-auth-storage' to nil
and call `auth-source-forget+'." t nil)

(register-definition-prefixes "ghub" '("ghub-" "url-http-handle-authentication@unauthorized-bugfix"))

;;;***

;;;### (autoloads nil "ghub-graphql" "ghub/ghub-graphql.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from ghub/ghub-graphql.el

(register-definition-prefixes "ghub-graphql" '("ghub-"))

;;;***

;;;### (autoloads nil "glab" "ghub/glab.el" (0 0 0 0))
;;; Generated autoloads from ghub/glab.el

(register-definition-prefixes "glab" '("glab-default-host"))

;;;***

;;;### (autoloads nil "gogs" "ghub/gogs.el" (0 0 0 0))
;;; Generated autoloads from ghub/gogs.el

(register-definition-prefixes "gogs" '("gogs-default-host"))

;;;***

;;;### (autoloads nil "gsexp" "ghub/gsexp.el" (0 0 0 0))
;;; Generated autoloads from ghub/gsexp.el

(register-definition-prefixes "gsexp" '("gsexp-"))

;;;***

;;;### (autoloads nil "gtea" "ghub/gtea.el" (0 0 0 0))
;;; Generated autoloads from ghub/gtea.el

(register-definition-prefixes "gtea" '("gtea-default-host"))

;;;***

;;;### (autoloads nil "iedit" "iedit/iedit.el" (0 0 0 0))
;;; Generated autoloads from iedit/iedit.el

(autoload 'iedit-mode "iedit" "\
Toggle Iedit mode.
This command behaves differently, depending on the mark, point,
prefix argument and variable `iedit-transient-mark-sensitive'.

If Iedit mode is off, turn Iedit mode on.

When Iedit mode is turned on, all the occurrences of the current
region in the buffer (possibly narrowed) or a region are
highlighted.  If one occurrence is modified, the change are
propagated to all other occurrences simultaneously.

If region is not active, `iedit-default-occurrence' is called to
get an occurrence candidate, according to the thing at point.  It
might be url, email address, markup tag or current symbol(or
word).

In the above two situations, with digit prefix argument 0, only
occurrences in current function are matched.  This is good for
renaming refactoring in programming.

You can also switch to Iedit mode from isearch mode directly. The
current search string is used as occurrence.  All occurrences of
the current search string are highlighted.

With an universal prefix argument, the occurrence when Iedit mode
is turned off last time in current buffer is used as occurrence.
This is intended to recover last Iedit mode which is turned off.
If region active, Iedit mode is limited within the current
region.

With repeated universal prefix argument, the occurrence when
Iedit mode is turned off last time (might be in other buffer) is
used as occurrence.  If region active, Iedit mode is limited
within the current region.

With digital prefix argument 1, Iedit mode is limited on the
current symbol or the active region, which means just one
instance is highlighted.  This behavior serves as a start point
of incremental selection work flow.

If Iedit mode is on and region is active, Iedit mode is
restricted in the region, e.g. the occurrences outside of the
region is excluded.

If Iedit mode is on and region is active, with an universal
prefix argument, Iedit mode is restricted outside of the region,
e.g. the occurrences in the region is excluded.

Turn off Iedit mode in other situations.

Commands:
\\{iedit-mode-keymap}
Keymap used within overlays:
\\{iedit-mode-occurrence-keymap}

\(fn &optional ARG)" t nil)

(autoload 'iedit-mode-toggle-on-function "iedit" "\
Toggle Iedit mode on current function." t nil)

(register-definition-prefixes "iedit" '("iedit-"))

;;;***

;;;### (autoloads nil "iedit-lib" "iedit/iedit-lib.el" (0 0 0 0))
;;; Generated autoloads from iedit/iedit-lib.el

(register-definition-prefixes "iedit-lib" '("iedit-"))

;;;***

;;;### (autoloads nil "iedit-rect" "iedit/iedit-rect.el" (0 0 0 0))
;;; Generated autoloads from iedit/iedit-rect.el

(autoload 'iedit-rectangle-mode "iedit-rect" "\
Toggle Iedit-rect mode.

When Iedit-rect mode is on, a rectangle is started with visible
rectangle highlighting.  Rectangle editing support is based on
Iedit mechanism.

Commands:
\\{iedit-rect-keymap}

\(fn &optional BEG END)" t nil)

(register-definition-prefixes "iedit-rect" '("iedit-rect"))

;;;***

;;;### (autoloads nil "iedit-tests" "iedit/iedit-tests.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from iedit/iedit-tests.el

(register-definition-prefixes "iedit-tests" '("goto-word" "iedit-printable-test-lists" "marker-position-list" "with-iedit-test-"))

;;;***

;;;### (autoloads nil "init-tryout" "lua-mode/init-tryout.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from lua-mode/init-tryout.el

(register-definition-prefixes "init-tryout" '("add-trace-for"))

;;;***

;;;### (autoloads nil "jack" "emms/jack.el" (0 0 0 0))
;;; Generated autoloads from emms/jack.el

(register-definition-prefixes "jack" '("jack-"))

;;;***

;;;### (autoloads nil "lisp/git-rebase" "magit/lisp/git-rebase.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/git-rebase.el

(autoload 'git-rebase-current-line "lisp/git-rebase" "\
Parse current line into a `git-rebase-action' instance.
If the current line isn't recognized as a rebase line, an
instance with all nil values is returned." nil nil)

(autoload 'git-rebase-mode "lisp/git-rebase" "\
Major mode for editing of a Git rebase file.

Rebase files are generated when you run 'git rebase -i' or run
`magit-interactive-rebase'.  They describe how Git should perform
the rebase.  See the documentation for git-rebase (e.g., by
running 'man git-rebase' at the command line) for details.

\(fn)" t nil)

(defconst git-rebase-filename-regexp "/git-rebase-todo\\'")

(add-to-list 'auto-mode-alist (cons git-rebase-filename-regexp 'git-rebase-mode))

(register-definition-prefixes "lisp/git-rebase" '("git-rebase-"))

;;;***

;;;### (autoloads nil "glsl-mode" "glsl-mode/glsl-mode.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from glsl-mode/glsl-mode.el

(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))

(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))

(add-to-list 'auto-mode-alist '("\\.geom\\'" . glsl-mode))

(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))

(autoload 'glsl-mode "glsl-mode" "\
Major mode for editing GLSL shader files.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "glsl-mode" '("gl-version" "glsl-")))

;;;***

;;;### (autoloads nil "init" "../init.el" (0 0 0 0))
;;; Generated autoloads from ../init.el

(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))

(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))

(add-to-list 'auto-mode-alist '("\\.geom\\'" . glsl-mode))

(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))

(register-definition-prefixes "init" '("eos-xrandr-" "redo" "safe-" "saved-file-name-handler-alist" "vlm-" "vm-not-used-libraries" "yes-or-no-p"))

;;;***

;;;### (autoloads nil "install-package" "dictionary-el/install-package.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from dictionary-el/install-package.el

(register-definition-prefixes "install-package" '("install-package"))

;;;***

;;;### (autoloads nil "keyboard" "mine/keyboard.el" (0 0 0 0))
;;; Generated autoloads from mine/keyboard.el

(register-definition-prefixes "keyboard" '("keyboard-"))

;;;***

;;;### (autoloads nil "lazy-load" "lazy/lazy-load.el" (0 0 0 0))
;;; Generated autoloads from lazy/lazy-load.el

(autoload 'lazy-load-update-autoloads "lazy-load" "\
Generate autoloads from directories file defined in `lazy-load-files-alist'.
This function will iterate over the custom associative list
`lazy-load-files-alist' using its parameters to determinate
the resulting `loaddefs' file-name and location." t nil)

(defvar lazy-load-mode nil "\
Non-nil if Lazy-Load mode is enabled.
See the `lazy-load-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `lazy-load-mode'.")

(custom-autoload 'lazy-load-mode "lazy-load" nil)

(autoload 'lazy-load-mode "lazy-load" "\
Define a new minor mode `lazy-load-mode'.

If called interactively, toggle `Lazy-Load mode'.  If the prefix
argument is positive, enable the mode, and if it is zero or
negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

This defines the toggle command [lazy-load-mode] and (by default)
a control variable `lazy-load-mode'.

Interactively with no prefix argument, it toggles the mode.
A prefix argument enables the mode if the argument is positive,
and disables it otherwise.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-lazy-load-mode "lazy-load" "\
Enable lazy-load minor mode." t nil)

(register-definition-prefixes "lazy-load" '("lazy-load-" "turn-off-lazy-load-mode"))

;;;***

;;;### (autoloads nil "lex-buffer" "lex/lex-buffer.el" (0 0 0 0))
;;; Generated autoloads from lex/lex-buffer.el

(autoload 'switch-to-scratch "lex-buffer" "\
Switch to *scratch* buffer." t nil)

(autoload 'indent-buffer "lex-buffer" "\
Indent the currently visited buffer." t nil)

(autoload 'indent-region-or-buffer "lex-buffer" "\
Indent a region if selected, otherwise the whole buffer." t nil)

(autoload 'duplicate-line-or-region "lex-buffer" "\
Duplicate current line or region N times.
If there's no region, the current line will be duplicated.
Otherwise, the selected region will be duplicated.

\(fn &optional N)" t nil)

(autoload 'transpose-lines-up "lex-buffer" "\
Transpose lines in down direction." t nil)

(autoload 'transpose-lines-down "lex-buffer" "\
Transpose lines in up direction." t nil)

(autoload 'transpose-word-left "lex-buffer" "\
Transpose N words to the opposite direction (left).

\(fn N)" t nil)

(autoload 'copy-line "lex-buffer" "\
Copy lines without kill then.
With prefix argument ARG, kill (copy) that many lines from point.

\(fn &optional ARG)" t nil)

(autoload 'copy-buffer-file-name "lex-buffer" "\
Copy (`kill-new') BUFFER-NAME filename.

\(fn BUFFER-NAME)" t nil)

(autoload 'kill-region-or-backward-word "lex-buffer" "\
Kill region or `backward-kill-word'." t nil)

(autoload 'back-to-indent-or-line "lex-buffer" "\
Move point back to indentation or beginning of line.
With argument ARG not nil or 1, move forward ARG - 1 lines first.

\(fn ARG)" t nil)

(autoload 'list-occurrences-at-point "lex-buffer" "\
Occur with symbol or region as its arguments." t nil)

(autoload 'complete-or-indent "lex-buffer" "\
Complete or indent." t nil)

(autoload 'complete-at-point-or-indent "lex-buffer" "\
This smart tab is a `minibuffer' compliant.
It acts as usual in the `minibuffer'.
Case mark is active, indents region.
Case point is at the end of a symbol, expands it.
Or indents the current line." t nil)

(register-definition-prefixes "lex-buffer" '("transpose-"))

;;;***

;;;### (autoloads nil "lex-compile" "lex/lex-compile.el" (0 0 0 0))
;;; Generated autoloads from lex/lex-compile.el

(autoload 'add-compile-command "lex-compile" "\
Add compile COMMAND to `compile-history' list.

\(fn COMMAND)" t nil)

(autoload 'compile-command-history "lex-compile" "\
Run compile COMMAND using `compile-history' as candidates source.

\(fn COMMAND)" t nil)

(autoload 'byte-compile-current-file "lex-compile" "\
Save and byte compile the current file." t nil)

(autoload 'byte-compile-library "lex-compile" "\
Byte compile a library, 'el' files from an arbitrary DIR.

\(fn DIR)" t nil)

(autoload 'byte-compile-libraries "lex-compile" "\
Recompile all libraries under the root DIR.

\(fn DIR)" t nil)

;;;***

;;;### (autoloads nil "lex-eval" "lex/lex-eval.el" (0 0 0 0))
;;; Generated autoloads from lex/lex-eval.el

(autoload 'eval-command-history "lex-eval" "\
Eval previous command using `command-history'." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "lex-eval" '("command-history-collection")))

;;;***

;;;### (autoloads nil "lex-files" "lex/lex-files.el" (0 0 0 0))
;;; Generated autoloads from lex/lex-files.el

(autoload 'file-type "lex-files" "\
Show FILE-NAME type information in echo area.

\(fn FILE-NAME)" t nil)

(autoload 'recent-file-collection "lex-files" "\
Return recent files (candidates) collection." nil nil)

(autoload 'find-recent-file "lex-files" "\
Find recent FILE.

\(fn FILE)" t nil)

(autoload 'set-default-directory "lex-files" "\
Set new current working directory (CWD).

\(fn CWD)" t nil)

(autoload 'execute-file "lex-files" "\
Execute arbitrary EXECUTABLE file using `start-process'.

If \\[universal-argument] is used, display a secondary
prompt asking for additional ARGS - arguments.

\(fn EXECUTABLE &optional ARGS)" t nil)

(autoload 'delete-file-at-point "lex-files" "\
Delete file at point (filename or region)." t nil)

;;;***

;;;### (autoloads nil "lex-load" "lex/lex-load.el" (0 0 0 0))
;;; Generated autoloads from lex/lex-load.el

(autoload 'safe-load-file "lex-load" "\
Load FILE if exists.

\(fn FILE)" nil t)

(autoload 'safe-add-dirs-to-load-path "lex-load" "\
Add DIRS (directories) to `load-path'.

\(fn DIRS)" nil t)

(autoload 'add-dir-to-load-path "lex-load" "\
Add arbitrary DIR (string) to `load-path'.
If call interactively asks for the directory using
the \\[minibuffer].

\(fn DIR)" t nil)

(autoload 'del-dir-from-load-path "lex-load" "\
Remove an DIR from `load-path'.

\(fn DIR)" t nil)

(autoload 'del-invalid-load-path "lex-load" "\
Delete non-existent directories from load-path." t nil)

(autoload 'clean-load-path "lex-load" "\
Delete duplicates from load-path." t nil)

(autoload 'list-load-path "lex-load" "\
List `load-path' in buffer." t nil)

(autoload 'reload-library "lex-load" "\
Reload target LIBRARY.
When optional argument FORCE is non-nil, unload feature
and its dependents.

\(fn LIBRARY &optional FORCE)" t nil)

(register-definition-prefixes "lex-load" '("safe-add-subdirs-to-load-path"))

;;;***

;;;### (autoloads nil "lex-mark" "lex/lex-mark.el" (0 0 0 0))
;;; Generated autoloads from lex/lex-mark.el

(autoload 'goto-mark "lex-mark" "\
Goto selected `mark' position." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "lex-mark" '("mark-ring-collection" "parse-mark-line-to-string")))

;;;***

;;;### (autoloads nil "lex-minibuffer" "lex/lex-minibuffer.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from lex/lex-minibuffer.el

(autoload 'minibuffer-kill-current-completion "lex-minibuffer" "\
Put `minibuffer' completion at the top of the `kill-ring'." t nil)

(autoload 'minibuffer-insert-completion-at-point "lex-minibuffer" "\
Insert `minibuffer' top completion at point." t nil)

(autoload 'minibuffer-insert-completion-in-buffer "lex-minibuffer" "\
Insert `minibuffer' completion in current active buffer." t nil)

(autoload 'minibuffer-describe-current-completion "lex-minibuffer" "\
Describe symbol using top-most `minibuffer' completion candidate." t nil)

(autoload 'select-minibuffer-window "lex-minibuffer" "\
Go to the active minibuffer, if available." t nil)

(autoload 'select-completions-window "lex-minibuffer" "\
Go to the active completions window, if available." t nil)

(autoload 'goto-minibuffer-or-call-it "lex-minibuffer" "\
Go to minibuffer window or call `execute-extended-command'." t nil)

(autoload 'goto-minibuffer-or-completions-window "lex-minibuffer" "\
Focus the active minibuffer or the \\*Completions\\*.
If both the minibuffer and the Completions are present, this
command will first move per invocation to the former, then the
latter, and then continue to switch between the two." t nil)

(register-definition-prefixes "lex-minibuffer" '("minibuffer-action"))

;;;***

;;;### (autoloads nil "lex-term" "lex/lex-term.el" (0 0 0 0))
;;; Generated autoloads from lex/lex-term.el

(autoload 'term-send-esc "lex-term" "\
Send ESC in term mode." t nil)

(autoload 'term-send-return "lex-term" "\
Use `term-send-raw-string' instead of `term-send-input'.
Because `term-send-input' duplicates input when
you type Ctrl-M in the in buffer terminal
emulator." t nil)

(autoload 'term-send-backward-kill-word "lex-term" "\
Backward kill word in term mode." t nil)

(autoload 'term-send-forward-kill-word "lex-term" "\
Kill word in term mode." t nil)

(autoload 'term-send-backward-word "lex-term" "\
Move backward word in term mode." t nil)

(autoload 'term-send-forward-word "lex-term" "\
Move forward word in term mode." t nil)

(autoload 'term-send-reverse-search-history "lex-term" "\
Search history reverse." t nil)

(autoload 'term-send-delete-word "lex-term" "\
Delete word in term mode." t nil)

(autoload 'term-send-quote "lex-term" "\
Quote the next character in `term-mode'.
Similar to how `quoted-insert' works in a regular buffer." t nil)

(autoload 'term-send-M-x "lex-term" "\
Type META-X in `term-mode' side effect invoke the `minibuffer'." t nil)

(autoload 'term-setup-keystroke "lex-term" "\
Keystroke setup of `term-char-mode'.
By default, the key bindings of `term-char-mode' conflict
with user's keystroke. So this function unbinds some keys
with `term-raw-map', and binds some keystroke with `term-raw-map'." nil nil)

(autoload 'term-kill-buffer-hook "lex-term" "\
Function to be added in the `kill-buffer-hook' list." nil nil)

(autoload 'term-make "lex-term" "\
Call `make-term' with the right arguments.
Asks for the NAME of the created terminal buffer interactively.
Get shell from the SHELL environment variable directly.

\(fn NAME &optional SHELL)" t nil)

(register-definition-prefixes "lex-term" '("term-"))

;;;***

;;;### (autoloads nil "lex-uu" "lex/lex-uu.el" (0 0 0 0))
;;; Generated autoloads from lex/lex-uu.el

(autoload 'set-transparency "lex-uu" "\
Set OPACITY transparency passing ARGS to `lex-transset' program.

\(fn OPACITY &optional ARGS)" t nil)

(autoload 'set-frame-transparency "lex-uu" "\
Set transparency in current frame." t nil)

(autoload 'set-window-transparency "lex-uu" "\
Set OPACITY transparency in selected X window (including EMACS).

\(fn OPACITY)" t nil)

(autoload 'capture-screen "lex-uu" "\
Capture screen (an image) and save at DEST directory.

\(fn &optional DEST)" t nil)

(autoload 'lock-screen "lex-uu" "\
Lock screen using `lex-slock' utility." t nil)

(autoload 'set-volume "lex-uu" "\
Set volume VALUE in up or down DIRECTION.

\(fn VALUE &optional DIRECTION)" t nil)

(autoload 'increase-volume "lex-uu" "\
Increase volume by a factor of 5.
If \\[universal-argument] is used, display a prompt
asking for the volume value - N.

\(fn &optional N)" t nil)

(autoload 'lower-volume "lex-uu" "\
Lower volume by a factor of 5.
If \\[universal-argument] is used, display a prompt
asking for the volume value - N.

\(fn &optional N)" t nil)

(autoload 'mute-audio "lex-uu" "\
Mute volume." t nil)

(autoload 'export-pdf-to-text "lex-uu" "\
Convert a PDF to TXT file.

When \\[universal-argument] is used, asks for the
text file output name.

\(fn PDF TXT)" t nil)

(register-definition-prefixes "lex-uu" '("lex-"))

;;;***

;;;### (autoloads nil "link" "dictionary-el/link.el" (0 0 0 0))
;;; Generated autoloads from dictionary-el/link.el

(register-definition-prefixes "link" '("link-"))

;;;***

;;;### (autoloads nil "lisp/magit" "magit/lisp/magit.el" (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit.el

(define-obsolete-variable-alias 'global-magit-file-mode 'magit-define-global-key-bindings "Magit 3.0.0")

(defvar magit-define-global-key-bindings t "\
Whether to bind some Magit commands in the global keymap.

If this variable is non-nil, then the following bindings may
be added to the global keymap.  The default is t.

key             binding
---             -------
C-x g           magit-status
C-x M-g         magit-dispatch
C-c M-g         magit-file-dispatch

These bindings may be added when `after-init-hook' is called.
Each binding is added if and only if at that time no other key
is bound to the same command and no other command is bound to
the same key.  In other words we try to avoid adding bindings
that are unnecessary, as well as bindings that conflict with
other bindings.

Adding the above bindings is delayed until `after-init-hook'
is called to allow users to set the variable anywhere in their
init file (without having to make sure to do so before `magit'
is loaded or autoloaded) and to increase the likelihood that
all the potentially conflicting user bindings have already
been added.

Setting this variable after the hook has already been called
has no effect.

We recommend that you bind \"C-c g\" instead of \"C-c M-g\" to
`magit-file-dispatch'.  The former is a much better binding
but the \"C-c <letter>\" namespace is strictly reserved for
users; preventing Magit from using it by default.

Also see info node `(magit)Commands for Buffers Visiting Files'.")

(custom-autoload 'magit-define-global-key-bindings "lisp/magit" t)

(defun magit-maybe-define-global-key-bindings nil (when magit-define-global-key-bindings (let ((map (current-global-map))) (dolist (elt '(("C-x g" . magit-status) ("C-x M-g" . magit-dispatch) ("C-c M-g" . magit-file-dispatch))) (let ((key (kbd (car elt))) (def (cdr elt))) (unless (or (lookup-key map key) (where-is-internal def (make-sparse-keymap) t)) (define-key map key def)))))))

(if after-init-time (magit-maybe-define-global-key-bindings) (add-hook 'after-init-hook 'magit-maybe-define-global-key-bindings t))
 (autoload 'magit-dispatch "magit" nil t)
 (autoload 'magit-run "magit" nil t)

(autoload 'magit-git-command "lisp/magit" "\
Execute COMMAND asynchronously; display output.

Interactively, prompt for COMMAND in the minibuffer. \"git \" is
used as initial input, but can be deleted to run another command.

With a prefix argument COMMAND is run in the top-level directory
of the current working tree, otherwise in `default-directory'.

\(fn COMMAND)" t nil)

(autoload 'magit-git-command-topdir "lisp/magit" "\
Execute COMMAND asynchronously; display output.

Interactively, prompt for COMMAND in the minibuffer. \"git \" is
used as initial input, but can be deleted to run another command.

COMMAND is run in the top-level directory of the current
working tree.

\(fn COMMAND)" t nil)

(autoload 'magit-shell-command "lisp/magit" "\
Execute COMMAND asynchronously; display output.

Interactively, prompt for COMMAND in the minibuffer.  With a
prefix argument COMMAND is run in the top-level directory of
the current working tree, otherwise in `default-directory'.

\(fn COMMAND)" t nil)

(autoload 'magit-shell-command-topdir "lisp/magit" "\
Execute COMMAND asynchronously; display output.

Interactively, prompt for COMMAND in the minibuffer.  COMMAND
is run in the top-level directory of the current working tree.

\(fn COMMAND)" t nil)

(autoload 'magit-version "lisp/magit" "\
Return the version of Magit currently in use.
If optional argument PRINT-DEST is non-nil, output
stream (interactively, the echo area, or the current buffer with
a prefix argument), also print the used versions of Magit, Git,
and Emacs to it.

\(fn &optional PRINT-DEST)" t nil)

(register-definition-prefixes "lisp/magit" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-apply" "magit/lisp/magit-apply.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-apply.el

(autoload 'magit-stage-file "lisp/magit-apply" "\
Stage all changes to FILE.
With a prefix argument or when there is no file at point ask for
the file to be staged.  Otherwise stage the file at point without
requiring confirmation.

\(fn FILE)" t nil)

(autoload 'magit-stage-modified "lisp/magit-apply" "\
Stage all changes to files modified in the worktree.
Stage all new content of tracked files and remove tracked files
that no longer exist in the working tree from the index also.
With a prefix argument also stage previously untracked (but not
ignored) files.

\(fn &optional ALL)" t nil)

(autoload 'magit-unstage-file "lisp/magit-apply" "\
Unstage all changes to FILE.
With a prefix argument or when there is no file at point ask for
the file to be unstaged.  Otherwise unstage the file at point
without requiring confirmation.

\(fn FILE)" t nil)

(autoload 'magit-unstage-all "lisp/magit-apply" "\
Remove all changes from the staging area." t nil)

(register-definition-prefixes "lisp/magit-apply" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-autorevert" "magit/lisp/magit-autorevert.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-autorevert.el

(put 'magit-auto-revert-mode 'globalized-minor-mode t)

(defvar magit-auto-revert-mode (not (or global-auto-revert-mode noninteractive)) "\
Non-nil if Magit-Auto-Revert mode is enabled.
See the `magit-auto-revert-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `magit-auto-revert-mode'.")

(custom-autoload 'magit-auto-revert-mode "lisp/magit-autorevert" nil)

(autoload 'magit-auto-revert-mode "lisp/magit-autorevert" "\
Toggle Auto-Revert mode in all buffers.
With prefix ARG, enable Magit-Auto-Revert mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if ARG is
omitted or nil.

Auto-Revert mode is enabled in all buffers where
`magit-turn-on-auto-revert-mode-if-desired' would do it.

See `auto-revert-mode' for more information on Auto-Revert mode.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "lisp/magit-autorevert" '("auto-revert-buffer" "magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-bisect" "magit/lisp/magit-bisect.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-bisect.el
 (autoload 'magit-bisect "magit-bisect" nil t)

(autoload 'magit-bisect-start "lisp/magit-bisect" "\
Start a bisect session.

Bisecting a bug means to find the commit that introduced it.
This command starts such a bisect session by asking for a known
good and a known bad commit.  To move the session forward use the
other actions from the bisect transient command (\\<magit-status-mode-map>\\[magit-bisect]).

\(fn BAD GOOD ARGS)" t nil)

(autoload 'magit-bisect-reset "lisp/magit-bisect" "\
After bisecting, cleanup bisection state and return to original `HEAD'." t nil)

(autoload 'magit-bisect-good "lisp/magit-bisect" "\
While bisecting, mark the current commit as good.
Use this after you have asserted that the commit does not contain
the bug in question." t nil)

(autoload 'magit-bisect-bad "lisp/magit-bisect" "\
While bisecting, mark the current commit as bad.
Use this after you have asserted that the commit does contain the
bug in question." t nil)

(autoload 'magit-bisect-mark "lisp/magit-bisect" "\
While bisecting, mark the current commit with a bisect term.
During a bisect using alternate terms, commits can still be
marked with `magit-bisect-good' and `magit-bisect-bad', as those
commands map to the correct term (\"good\" to --term-old's value
and \"bad\" to --term-new's).  However, in some cases, it can be
difficult to keep that mapping straight in your head; this
command provides an interface that exposes the underlying terms." t nil)

(autoload 'magit-bisect-skip "lisp/magit-bisect" "\
While bisecting, skip the current commit.
Use this if for some reason the current commit is not a good one
to test.  This command lets Git choose a different one." t nil)

(autoload 'magit-bisect-run "lisp/magit-bisect" "\
Bisect automatically by running commands after each step.

Unlike `git bisect run' this can be used before bisecting has
begun.  In that case it behaves like `git bisect start; git
bisect run'.

\(fn CMDLINE &optional BAD GOOD ARGS)" t nil)

(register-definition-prefixes "lisp/magit-bisect" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-blame" "magit/lisp/magit-blame.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-blame.el
 (autoload 'magit-blame-echo "magit-blame" nil t)
 (autoload 'magit-blame-addition "magit-blame" nil t)
 (autoload 'magit-blame-removal "magit-blame" nil t)
 (autoload 'magit-blame-reverse "magit-blame" nil t)
 (autoload 'magit-blame "magit-blame" nil t)

(register-definition-prefixes "lisp/magit-blame" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-bookmark" "magit/lisp/magit-bookmark.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-bookmark.el

(autoload 'magit--handle-bookmark "lisp/magit-bookmark" "\
Open a bookmark created by `magit--make-bookmark'.
Call the `magit-*-setup-buffer' function of the the major-mode
with the variables' values as arguments, which were recorded by
`magit--make-bookmark'.  Ignore `magit-display-buffer-function'.

\(fn BOOKMARK)" nil nil)

(register-definition-prefixes "lisp/magit-bookmark" '("magit--make-bookmark"))

;;;***

;;;### (autoloads nil "lisp/magit-branch" "magit/lisp/magit-branch.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-branch.el
 (autoload 'magit-branch "magit" nil t)

(autoload 'magit-checkout "lisp/magit-branch" "\
Checkout REVISION, updating the index and the working tree.
If REVISION is a local branch, then that becomes the current
branch.  If it is something else, then `HEAD' becomes detached.
Checkout fails if the working tree or the staging area contain
changes.

\(git checkout REVISION).

\(fn REVISION &optional ARGS)" t nil)

(autoload 'magit-branch-create "lisp/magit-branch" "\
Create BRANCH at branch or revision START-POINT.

\(fn BRANCH START-POINT)" t nil)

(autoload 'magit-branch-and-checkout "lisp/magit-branch" "\
Create and checkout BRANCH at branch or revision START-POINT.

\(fn BRANCH START-POINT &optional ARGS)" t nil)

(autoload 'magit-branch-or-checkout "lisp/magit-branch" "\
Hybrid between `magit-checkout' and `magit-branch-and-checkout'.

Ask the user for an existing branch or revision.  If the user
input actually can be resolved as a branch or revision, then
check that out, just like `magit-checkout' would.

Otherwise create and checkout a new branch using the input as
its name.  Before doing so read the starting-point for the new
branch.  This is similar to what `magit-branch-and-checkout'
does.

\(fn ARG &optional START-POINT)" t nil)

(autoload 'magit-branch-checkout "lisp/magit-branch" "\
Checkout an existing or new local branch.

Read a branch name from the user offering all local branches and
a subset of remote branches as candidates.  Omit remote branches
for which a local branch by the same name exists from the list
of candidates.  The user can also enter a completely new branch
name.

- If the user selects an existing local branch, then check that
  out.

- If the user selects a remote branch, then create and checkout
  a new local branch with the same name.  Configure the selected
  remote branch as push target.

- If the user enters a new branch name, then create and check
  that out, after also reading the starting-point from the user.

In the latter two cases the upstream is also set.  Whether it is
set to the chosen START-POINT or something else depends on the
value of `magit-branch-adjust-remote-upstream-alist', just like
when using `magit-branch-and-checkout'.

\(fn BRANCH &optional START-POINT)" t nil)

(autoload 'magit-branch-orphan "lisp/magit-branch" "\
Create and checkout an orphan BRANCH with contents from revision START-POINT.

\(fn BRANCH START-POINT)" t nil)

(autoload 'magit-branch-spinout "lisp/magit-branch" "\
Create new branch from the unpushed commits.
Like `magit-branch-spinoff' but remain on the current branch.
If there are any uncommitted changes, then behave exactly like
`magit-branch-spinoff'.

\(fn BRANCH &optional FROM)" t nil)

(autoload 'magit-branch-spinoff "lisp/magit-branch" "\
Create new branch from the unpushed commits.

Create and checkout a new branch starting at and tracking the
current branch.  That branch in turn is reset to the last commit
it shares with its upstream.  If the current branch has no
upstream or no unpushed commits, then the new branch is created
anyway and the previously current branch is not touched.

This is useful to create a feature branch after work has already
began on the old branch (likely but not necessarily \"master\").

If the current branch is a member of the value of option
`magit-branch-prefer-remote-upstream' (which see), then the
current branch will be used as the starting point as usual, but
the upstream of the starting-point may be used as the upstream
of the new branch, instead of the starting-point itself.

If optional FROM is non-nil, then the source branch is reset
to `FROM~', instead of to the last commit it shares with its
upstream.  Interactively, FROM is only ever non-nil, if the
region selects some commits, and among those commits, FROM is
the commit that is the fewest commits ahead of the source
branch.

The commit at the other end of the selection actually does not
matter, all commits between FROM and `HEAD' are moved to the new
branch.  If FROM is not reachable from `HEAD' or is reachable
from the source branch's upstream, then an error is raised.

\(fn BRANCH &optional FROM)" t nil)

(autoload 'magit-branch-reset "lisp/magit-branch" "\
Reset a branch to the tip of another branch or any other commit.

When the branch being reset is the current branch, then do a
hard reset.  If there are any uncommitted changes, then the user
has to confirm the reset because those changes would be lost.

This is useful when you have started work on a feature branch but
realize it's all crap and want to start over.

When resetting to another branch and a prefix argument is used,
then also set the target branch as the upstream of the branch
that is being reset.

\(fn BRANCH TO &optional SET-UPSTREAM)" t nil)

(autoload 'magit-branch-delete "lisp/magit-branch" "\
Delete one or multiple branches.
If the region marks multiple branches, then offer to delete
those, otherwise prompt for a single branch to be deleted,
defaulting to the branch at point.

\(fn BRANCHES &optional FORCE)" t nil)

(autoload 'magit-branch-rename "lisp/magit-branch" "\
Rename the branch named OLD to NEW.

With a prefix argument FORCE, rename even if a branch named NEW
already exists.

If `branch.OLD.pushRemote' is set, then unset it.  Depending on
the value of `magit-branch-rename-push-target' (which see) maybe
set `branch.NEW.pushRemote' and maybe rename the push-target on
the remote.

\(fn OLD NEW &optional FORCE)" t nil)

(autoload 'magit-branch-shelve "lisp/magit-branch" "\
Shelve a BRANCH.
Rename \"refs/heads/BRANCH\" to \"refs/shelved/BRANCH\",
and also rename the respective reflog file.

\(fn BRANCH)" t nil)

(autoload 'magit-branch-unshelve "lisp/magit-branch" "\
Unshelve a BRANCH
Rename \"refs/shelved/BRANCH\" to \"refs/heads/BRANCH\",
and also rename the respective reflog file.

\(fn BRANCH)" t nil)
 (autoload 'magit-branch-configure "magit-branch" nil t)

(register-definition-prefixes "lisp/magit-branch" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-clone" "magit/lisp/magit-clone.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-clone.el
 (autoload 'magit-clone "magit-clone" nil t)

(autoload 'magit-clone-regular "lisp/magit-clone" "\
Create a clone of REPOSITORY in DIRECTORY.
Then show the status buffer for the new repository.

\(fn REPOSITORY DIRECTORY ARGS)" t nil)

(autoload 'magit-clone-shallow "lisp/magit-clone" "\
Create a shallow clone of REPOSITORY in DIRECTORY.
Then show the status buffer for the new repository.
With a prefix argument read the DEPTH of the clone;
otherwise use 1.

\(fn REPOSITORY DIRECTORY ARGS DEPTH)" t nil)

(autoload 'magit-clone-shallow-since "lisp/magit-clone" "\
Create a shallow clone of REPOSITORY in DIRECTORY.
Then show the status buffer for the new repository.
Exclude commits before DATE, which is read from the
user.

\(fn REPOSITORY DIRECTORY ARGS DATE)" t nil)

(autoload 'magit-clone-shallow-exclude "lisp/magit-clone" "\
Create a shallow clone of REPOSITORY in DIRECTORY.
Then show the status buffer for the new repository.
Exclude commits reachable from EXCLUDE, which is a
branch or tag read from the user.

\(fn REPOSITORY DIRECTORY ARGS EXCLUDE)" t nil)

(autoload 'magit-clone-bare "lisp/magit-clone" "\
Create a bare clone of REPOSITORY in DIRECTORY.
Then show the status buffer for the new repository.

\(fn REPOSITORY DIRECTORY ARGS)" t nil)

(autoload 'magit-clone-mirror "lisp/magit-clone" "\
Create a mirror of REPOSITORY in DIRECTORY.
Then show the status buffer for the new repository.

\(fn REPOSITORY DIRECTORY ARGS)" t nil)

(register-definition-prefixes "lisp/magit-clone" '("magit-clone-"))

;;;***

;;;### (autoloads nil "lisp/magit-commit" "magit/lisp/magit-commit.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-commit.el
 (autoload 'magit-commit "magit-commit" nil t)

(autoload 'magit-commit-create "lisp/magit-commit" "\
Create a new commit on `HEAD'.
With a prefix argument, amend to the commit at `HEAD' instead.

\(git commit [--amend] ARGS)

\(fn &optional ARGS)" t nil)

(autoload 'magit-commit-amend "lisp/magit-commit" "\
Amend the last commit.

\(git commit --amend ARGS)

\(fn &optional ARGS)" t nil)

(autoload 'magit-commit-extend "lisp/magit-commit" "\
Amend the last commit, without editing the message.

With a prefix argument keep the committer date, otherwise change
it.  The option `magit-commit-extend-override-date' can be used
to inverse the meaning of the prefix argument.  
\(git commit
--amend --no-edit)

\(fn &optional ARGS OVERRIDE-DATE)" t nil)

(autoload 'magit-commit-reword "lisp/magit-commit" "\
Reword the last commit, ignoring staged changes.

With a prefix argument keep the committer date, otherwise change
it.  The option `magit-commit-reword-override-date' can be used
to inverse the meaning of the prefix argument.

Non-interactively respect the optional OVERRIDE-DATE argument
and ignore the option.

\(git commit --amend --only)

\(fn &optional ARGS OVERRIDE-DATE)" t nil)

(autoload 'magit-commit-fixup "lisp/magit-commit" "\
Create a fixup commit.

With a prefix argument the target COMMIT has to be confirmed.
Otherwise the commit at point may be used without confirmation
depending on the value of option `magit-commit-squash-confirm'.

\(fn &optional COMMIT ARGS)" t nil)

(autoload 'magit-commit-squash "lisp/magit-commit" "\
Create a squash commit, without editing the squash message.

With a prefix argument the target COMMIT has to be confirmed.
Otherwise the commit at point may be used without confirmation
depending on the value of option `magit-commit-squash-confirm'.

\(fn &optional COMMIT ARGS)" t nil)

(autoload 'magit-commit-augment "lisp/magit-commit" "\
Create a squash commit, editing the squash message.

With a prefix argument the target COMMIT has to be confirmed.
Otherwise the commit at point may be used without confirmation
depending on the value of option `magit-commit-squash-confirm'.

\(fn &optional COMMIT ARGS)" t nil)

(autoload 'magit-commit-instant-fixup "lisp/magit-commit" "\
Create a fixup commit targeting COMMIT and instantly rebase.

\(fn &optional COMMIT ARGS)" t nil)

(autoload 'magit-commit-instant-squash "lisp/magit-commit" "\
Create a squash commit targeting COMMIT and instantly rebase.

\(fn &optional COMMIT ARGS)" t nil)

(autoload 'magit-commit-reshelve "lisp/magit-commit" "\
Change the committer date and possibly the author date of `HEAD'.

The current time is used as the initial minibuffer input and the
original author or committer date is available as the previous
history element.

Both the author and the committer dates are changes, unless one
of the following is true, in which case only the committer date
is updated:
- You are not the author of the commit that is being reshelved.
- The command was invoked with a prefix argument.
- Non-interactively if UPDATE-AUTHOR is nil.

\(fn DATE UPDATE-AUTHOR &optional ARGS)" t nil)

(autoload 'magit-commit-absorb-modules "lisp/magit-commit" "\
Spread modified modules across recent commits.

\(fn PHASE COMMIT)" t nil)
 (autoload 'magit-commit-absorb "magit-commit" nil t)
 (autoload 'magit-commit-autofixup "magit-commit" nil t)

(register-definition-prefixes "lisp/magit-commit" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-diff" "magit/lisp/magit-diff.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-diff.el
 (autoload 'magit-diff "magit-diff" nil t)
 (autoload 'magit-diff-refresh "magit-diff" nil t)

(autoload 'magit-diff-dwim "lisp/magit-diff" "\
Show changes for the thing at point.

\(fn &optional ARGS FILES)" t nil)

(autoload 'magit-diff-range "lisp/magit-diff" "\
Show differences between two commits.

REV-OR-RANGE should be a range or a single revision.  If it is a
revision, then show changes in the working tree relative to that
revision.  If it is a range, but one side is omitted, then show
changes relative to `HEAD'.

If the region is active, use the revisions on the first and last
line of the region as the two sides of the range.  With a prefix
argument, instead of diffing the revisions, choose a revision to
view changes along, starting at the common ancestor of both
revisions (i.e., use a \"...\" range).

\(fn REV-OR-RANGE &optional ARGS FILES)" t nil)

(autoload 'magit-diff-working-tree "lisp/magit-diff" "\
Show changes between the current working tree and the `HEAD' commit.
With a prefix argument show changes between the working tree and
a commit read from the minibuffer.

\(fn &optional REV ARGS FILES)" t nil)

(autoload 'magit-diff-staged "lisp/magit-diff" "\
Show changes between the index and the `HEAD' commit.
With a prefix argument show changes between the index and
a commit read from the minibuffer.

\(fn &optional REV ARGS FILES)" t nil)

(autoload 'magit-diff-unstaged "lisp/magit-diff" "\
Show changes between the working tree and the index.

\(fn &optional ARGS FILES)" t nil)

(autoload 'magit-diff-unmerged "lisp/magit-diff" "\
Show changes that are being merged.

\(fn &optional ARGS FILES)" t nil)

(autoload 'magit-diff-while-committing "lisp/magit-diff" "\
While committing, show the changes that are about to be committed.
While amending, invoking the command again toggles between
showing just the new changes or all the changes that will
be committed.

\(fn &optional ARGS)" t nil)

(autoload 'magit-diff-buffer-file "lisp/magit-diff" "\
Show diff for the blob or file visited in the current buffer.

When the buffer visits a blob, then show the respective commit.
When the buffer visits a file, then show the differenced between
`HEAD' and the working tree.  In both cases limit the diff to
the file or blob." t nil)

(autoload 'magit-diff-paths "lisp/magit-diff" "\
Show changes between any two files on disk.

\(fn A B)" t nil)

(autoload 'magit-show-commit "lisp/magit-diff" "\
Visit the revision at point in another buffer.
If there is no revision at point or with a prefix argument prompt
for a revision.

\(fn REV &optional ARGS FILES MODULE)" t nil)

(register-definition-prefixes "lisp/magit-diff" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-ediff" "magit/lisp/magit-ediff.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-ediff.el
 (autoload 'magit-ediff "magit-ediff" nil)

(autoload 'magit-ediff-resolve "lisp/magit-ediff" "\
Resolve outstanding conflicts in FILE using Ediff.
FILE has to be relative to the top directory of the repository.

In the rare event that you want to manually resolve all
conflicts, including those already resolved by Git, use
`ediff-merge-revisions-with-ancestor'.

\(fn FILE)" t nil)

(autoload 'magit-ediff-stage "lisp/magit-ediff" "\
Stage and unstage changes to FILE using Ediff.
FILE has to be relative to the top directory of the repository.

\(fn FILE)" t nil)

(autoload 'magit-ediff-compare "lisp/magit-ediff" "\
Compare REVA:FILEA with REVB:FILEB using Ediff.

FILEA and FILEB have to be relative to the top directory of the
repository.  If REVA or REVB is nil, then this stands for the
working tree state.

If the region is active, use the revisions on the first and last
line of the region.  With a prefix argument, instead of diffing
the revisions, choose a revision to view changes along, starting
at the common ancestor of both revisions (i.e., use a \"...\"
range).

\(fn REVA REVB FILEA FILEB)" t nil)

(autoload 'magit-ediff-dwim "lisp/magit-ediff" "\
Compare, stage, or resolve using Ediff.
This command tries to guess what file, and what commit or range
the user wants to compare, stage, or resolve using Ediff.  It
might only be able to guess either the file, or range or commit,
in which case the user is asked about the other.  It might not
always guess right, in which case the appropriate `magit-ediff-*'
command has to be used explicitly.  If it cannot read the user's
mind at all, then it asks the user for a command to run." t nil)

(autoload 'magit-ediff-show-staged "lisp/magit-ediff" "\
Show staged changes using Ediff.

This only allows looking at the changes; to stage, unstage,
and discard changes using Ediff, use `magit-ediff-stage'.

FILE must be relative to the top directory of the repository.

\(fn FILE)" t nil)

(autoload 'magit-ediff-show-unstaged "lisp/magit-ediff" "\
Show unstaged changes using Ediff.

This only allows looking at the changes; to stage, unstage,
and discard changes using Ediff, use `magit-ediff-stage'.

FILE must be relative to the top directory of the repository.

\(fn FILE)" t nil)

(autoload 'magit-ediff-show-working-tree "lisp/magit-ediff" "\
Show changes between `HEAD' and working tree using Ediff.
FILE must be relative to the top directory of the repository.

\(fn FILE)" t nil)

(autoload 'magit-ediff-show-commit "lisp/magit-ediff" "\
Show changes introduced by COMMIT using Ediff.

\(fn COMMIT)" t nil)

(autoload 'magit-ediff-show-stash "lisp/magit-ediff" "\
Show changes introduced by STASH using Ediff.
`magit-ediff-show-stash-with-index' controls whether a
three-buffer Ediff is used in order to distinguish changes in the
stash that were staged.

\(fn STASH)" t nil)

(register-definition-prefixes "lisp/magit-ediff" '("magit-ediff-"))

;;;***

;;;### (autoloads nil "lisp/magit-extras" "magit/lisp/magit-extras.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-extras.el

(autoload 'magit-run-git-gui "lisp/magit-extras" "\
Run `git gui' for the current git repository." t nil)

(autoload 'magit-run-git-gui-blame "lisp/magit-extras" "\
Run `git gui blame' on the given FILENAME and COMMIT.
Interactively run it for the current file and the `HEAD', with a
prefix or when the current file cannot be determined let the user
choose.  When the current buffer is visiting FILENAME instruct
blame to center around the line point is on.

\(fn COMMIT FILENAME &optional LINENUM)" t nil)

(autoload 'magit-run-gitk "lisp/magit-extras" "\
Run `gitk' in the current repository." t nil)

(autoload 'magit-run-gitk-branches "lisp/magit-extras" "\
Run `gitk --branches' in the current repository." t nil)

(autoload 'magit-run-gitk-all "lisp/magit-extras" "\
Run `gitk --all' in the current repository." t nil)

(autoload 'ido-enter-magit-status "lisp/magit-extras" "\
Drop into `magit-status' from file switching.

This command does not work in Emacs 26.1.
See https://github.com/magit/magit/issues/3634
and https://debbugs.gnu.org/cgi/bugreport.cgi?bug=31707.

To make this command available use something like:

  (add-hook \\='ido-setup-hook
            (lambda ()
              (define-key ido-completion-map
                (kbd \"C-x g\") \\='ido-enter-magit-status)))

Starting with Emacs 25.1 the Ido keymaps are defined just once
instead of every time Ido is invoked, so now you can modify it
like pretty much every other keymap:

  (define-key ido-common-completion-map
    (kbd \"C-x g\") \\='ido-enter-magit-status)" t nil)

(autoload 'magit-project-status "lisp/magit-extras" "\
Run `magit-status' in the current project's root." t nil)

(autoload 'magit-dired-jump "lisp/magit-extras" "\
Visit file at point using Dired.
With a prefix argument, visit in another window.  If there
is no file at point, then instead visit `default-directory'.

\(fn &optional OTHER-WINDOW)" t nil)

(autoload 'magit-dired-log "lisp/magit-extras" "\
Show log for all marked files, or the current file.

\(fn &optional FOLLOW)" t nil)

(autoload 'magit-do-async-shell-command "lisp/magit-extras" "\
Open FILE with `dired-do-async-shell-command'.
Interactively, open the file at point.

\(fn FILE)" t nil)

(autoload 'magit-previous-line "lisp/magit-extras" "\
Like `previous-line' but with Magit-specific shift-selection.

Magit's selection mechanism is based on the region but selects an
area that is larger than the region.  This causes `previous-line'
when invoked while holding the shift key to move up one line and
thereby select two lines.  When invoked inside a hunk body this
command does not move point on the first invocation and thereby
it only selects a single line.  Which inconsistency you prefer
is a matter of preference.

\(fn &optional ARG TRY-VSCROLL)" t nil)

(function-put 'magit-previous-line 'interactive-only '"use `forward-line' with negative argument instead.")

(autoload 'magit-next-line "lisp/magit-extras" "\
Like `next-line' but with Magit-specific shift-selection.

Magit's selection mechanism is based on the region but selects
an area that is larger than the region.  This causes `next-line'
when invoked while holding the shift key to move down one line
and thereby select two lines.  When invoked inside a hunk body
this command does not move point on the first invocation and
thereby it only selects a single line.  Which inconsistency you
prefer is a matter of preference.

\(fn &optional ARG TRY-VSCROLL)" t nil)

(function-put 'magit-next-line 'interactive-only 'forward-line)

(autoload 'magit-clean "lisp/magit-extras" "\
Remove untracked files from the working tree.
With a prefix argument also remove ignored files,
with two prefix arguments remove ignored files only.

\(git clean -f -d [-x|-X])

\(fn &optional ARG)" t nil)

(autoload 'magit-add-change-log-entry "lisp/magit-extras" "\
Find change log file and add date entry and item for current change.
This differs from `add-change-log-entry' (which see) in that
it acts on the current hunk in a Magit buffer instead of on
a position in a file-visiting buffer.

\(fn &optional WHOAMI FILE-NAME OTHER-WINDOW)" t nil)

(autoload 'magit-add-change-log-entry-other-window "lisp/magit-extras" "\
Find change log file in other window and add entry and item.
This differs from `add-change-log-entry-other-window' (which see)
in that it acts on the current hunk in a Magit buffer instead of
on a position in a file-visiting buffer.

\(fn &optional WHOAMI FILE-NAME)" t nil)

(autoload 'magit-edit-line-commit "lisp/magit-extras" "\
Edit the commit that added the current line.

With a prefix argument edit the commit that removes the line,
if any.  The commit is determined using `git blame' and made
editable using `git rebase --interactive' if it is reachable
from `HEAD', or by checking out the commit (or a branch that
points at it) otherwise.

\(fn &optional TYPE)" t nil)

(autoload 'magit-diff-edit-hunk-commit "lisp/magit-extras" "\
From a hunk, edit the respective commit and visit the file.

First visit the file being modified by the hunk at the correct
location using `magit-diff-visit-file'.  This actually visits a
blob.  When point is on a diff header, not within an individual
hunk, then this visits the blob the first hunk is about.

Then invoke `magit-edit-line-commit', which uses an interactive
rebase to make the commit editable, or if that is not possible
because the commit is not reachable from `HEAD' by checking out
that commit directly.  This also causes the actual worktree file
to be visited.

Neither the blob nor the file buffer are killed when finishing
the rebase.  If that is undesirable, then it might be better to
use `magit-rebase-edit-command' instead of this command.

\(fn FILE)" t nil)

(autoload 'magit-reshelve-since "lisp/magit-extras" "\
Change the author and committer dates of the commits since REV.

Ask the user for the first reachable commit whose dates should
be changed.  Then read the new date for that commit.  The initial
minibuffer input and the previous history element offer good
values.  The next commit will be created one minute later and so
on.

This command is only intended for interactive use and should only
be used on highly rearranged and unpublished history.

If KEYID is non-nil, then use that to sign all reshelved commits.
Interactively use the value of the \"--gpg-sign\" option in the
list returned by `magit-rebase-arguments'.

\(fn REV KEYID)" t nil)

(autoload 'magit-pop-revision-stack "lisp/magit-extras" "\
Insert a representation of a revision into the current buffer.

Pop a revision from the `magit-revision-stack' and insert it into
the current buffer according to `magit-pop-revision-stack-format'.
Revisions can be put on the stack using `magit-copy-section-value'
and `magit-copy-buffer-revision'.

If the stack is empty or with a prefix argument, instead read a
revision in the minibuffer.  By using the minibuffer history this
allows selecting an item which was popped earlier or to insert an
arbitrary reference or revision without first pushing it onto the
stack.

When reading the revision from the minibuffer, then it might not
be possible to guess the correct repository.  When this command
is called inside a repository (e.g. while composing a commit
message), then that repository is used.  Otherwise (e.g. while
composing an email) then the repository recorded for the top
element of the stack is used (even though we insert another
revision).  If not called inside a repository and with an empty
stack, or with two prefix arguments, then read the repository in
the minibuffer too.

\(fn REV TOPLEVEL)" t nil)

(autoload 'magit-copy-section-value "lisp/magit-extras" "\
Save the value of the current section for later use.

Save the section value to the `kill-ring', and, provided that
the current section is a commit, branch, or tag section, push
the (referenced) revision to the `magit-revision-stack' for use
with `magit-pop-revision-stack'.

When `magit-copy-revision-abbreviated' is non-nil, save the
abbreviated revision to the `kill-ring' and the
`magit-revision-stack'.

When the current section is a branch or a tag, and a prefix
argument is used, then save the revision at its tip to the
`kill-ring' instead of the reference name.

When the region is active, then save that to the `kill-ring',
like `kill-ring-save' would, instead of behaving as described
above.  If a prefix argument is used and the region is within
a hunk, then strip the diff marker column and keep only either
the added or removed lines, depending on the sign of the prefix
argument.

\(fn ARG)" t nil)

(autoload 'magit-copy-buffer-revision "lisp/magit-extras" "\
Save the revision of the current buffer for later use.

Save the revision shown in the current buffer to the `kill-ring'
and push it to the `magit-revision-stack'.

This command is mainly intended for use in `magit-revision-mode'
buffers, the only buffers where it is always unambiguous exactly
which revision should be saved.

Most other Magit buffers usually show more than one revision, in
some way or another, so this command has to select one of them,
and that choice might not always be the one you think would have
been the best pick.

In such buffers it is often more useful to save the value of
the current section instead, using `magit-copy-section-value'.

When the region is active, then save that to the `kill-ring',
like `kill-ring-save' would, instead of behaving as described
above.

When `magit-copy-revision-abbreviated' is non-nil, save the
abbreviated revision to the `kill-ring' and the
`magit-revision-stack'." t nil)

(autoload 'magit-abort-dwim "lisp/magit-extras" "\
Abort current operation.
Depending on the context, this will abort a merge, a rebase, a
patch application, a cherry-pick, a revert, or a bisect." t nil)

(register-definition-prefixes "lisp/magit-extras" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-fetch" "magit/lisp/magit-fetch.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-fetch.el
 (autoload 'magit-fetch "magit-fetch" nil t)
 (autoload 'magit-fetch-from-pushremote "magit-fetch" nil t)
 (autoload 'magit-fetch-from-upstream "magit-fetch" nil t)

(autoload 'magit-fetch-other "lisp/magit-fetch" "\
Fetch from another repository.

\(fn REMOTE ARGS)" t nil)

(autoload 'magit-fetch-branch "lisp/magit-fetch" "\
Fetch a BRANCH from a REMOTE.

\(fn REMOTE BRANCH ARGS)" t nil)

(autoload 'magit-fetch-refspec "lisp/magit-fetch" "\
Fetch a REFSPEC from a REMOTE.

\(fn REMOTE REFSPEC ARGS)" t nil)

(autoload 'magit-fetch-all "lisp/magit-fetch" "\
Fetch from all remotes.

\(fn ARGS)" t nil)

(autoload 'magit-fetch-all-prune "lisp/magit-fetch" "\
Fetch from all remotes, and prune.
Prune remote tracking branches for branches that have been
removed on the respective remote." t nil)

(autoload 'magit-fetch-all-no-prune "lisp/magit-fetch" "\
Fetch from all remotes." t nil)

(autoload 'magit-fetch-modules "lisp/magit-fetch" "\
Fetch all submodules.

Option `magit-fetch-modules-jobs' controls how many submodules
are being fetched in parallel.  Also fetch the super-repository,
because `git-fetch' does not support not doing that.  With a
prefix argument fetch all remotes.

\(fn &optional ALL)" t nil)

(register-definition-prefixes "lisp/magit-fetch" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-files" "magit/lisp/magit-files.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-files.el

(autoload 'magit-find-file "lisp/magit-files" "\
View FILE from REV.
Switch to a buffer visiting blob REV:FILE, creating one if none
already exists.  If prior to calling this command the current
buffer and/or cursor position is about the same file, then go
to the line and column corresponding to that location.

\(fn REV FILE)" t nil)

(autoload 'magit-find-file-other-window "lisp/magit-files" "\
View FILE from REV, in another window.
Switch to a buffer visiting blob REV:FILE, creating one if none
already exists.  If prior to calling this command the current
buffer and/or cursor position is about the same file, then go to
the line and column corresponding to that location.

\(fn REV FILE)" t nil)

(autoload 'magit-find-file-other-frame "lisp/magit-files" "\
View FILE from REV, in another frame.
Switch to a buffer visiting blob REV:FILE, creating one if none
already exists.  If prior to calling this command the current
buffer and/or cursor position is about the same file, then go to
the line and column corresponding to that location.

\(fn REV FILE)" t nil)
 (autoload 'magit-file-dispatch "magit" nil t)

(autoload 'magit-blob-visit-file "lisp/magit-files" "\
View the file from the worktree corresponding to the current blob.
When visiting a blob or the version from the index, then go to
the same location in the respective file in the working tree." t nil)

(autoload 'magit-file-checkout "lisp/magit-files" "\
Checkout FILE from REV.

\(fn REV FILE)" t nil)

(register-definition-prefixes "lisp/magit-files" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-git" "magit/lisp/magit-git.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-git.el

(register-definition-prefixes "lisp/magit-git" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-gitignore" "magit/lisp/magit-gitignore.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-gitignore.el
 (autoload 'magit-gitignore "magit-gitignore" nil t)

(autoload 'magit-gitignore-in-topdir "lisp/magit-gitignore" "\
Add the Git ignore RULE to the top-level \".gitignore\" file.
Since this file is tracked, it is shared with other clones of the
repository.  Also stage the file.

\(fn RULE)" t nil)

(autoload 'magit-gitignore-in-subdir "lisp/magit-gitignore" "\
Add the Git ignore RULE to a \".gitignore\" file in DIRECTORY.
Prompt the user for a directory and add the rule to the
\".gitignore\" file in that directory.  Since such files are
tracked, they are shared with other clones of the repository.
Also stage the file.

\(fn RULE DIRECTORY)" t nil)

(autoload 'magit-gitignore-in-gitdir "lisp/magit-gitignore" "\
Add the Git ignore RULE to \"$GIT_DIR/info/exclude\".
Rules in that file only affects this clone of the repository.

\(fn RULE)" t nil)

(autoload 'magit-gitignore-on-system "lisp/magit-gitignore" "\
Add the Git ignore RULE to the file specified by `core.excludesFile'.
Rules that are defined in that file affect all local repositories.

\(fn RULE)" t nil)

(autoload 'magit-skip-worktree "lisp/magit-gitignore" "\
Call \"git update-index --skip-worktree -- FILE\".

\(fn FILE)" t nil)

(autoload 'magit-no-skip-worktree "lisp/magit-gitignore" "\
Call \"git update-index --no-skip-worktree -- FILE\".

\(fn FILE)" t nil)

(autoload 'magit-assume-unchanged "lisp/magit-gitignore" "\
Call \"git update-index --assume-unchanged -- FILE\".

\(fn FILE)" t nil)

(autoload 'magit-no-assume-unchanged "lisp/magit-gitignore" "\
Call \"git update-index --no-assume-unchanged -- FILE\".

\(fn FILE)" t nil)

(register-definition-prefixes "lisp/magit-gitignore" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-imenu" "magit/lisp/magit-imenu.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-imenu.el

(autoload 'magit-imenu--log-prev-index-position-function "lisp/magit-imenu" "\
Move point to previous line in current buffer.
This function is used as a value for
`imenu-prev-index-position-function'." nil nil)

(autoload 'magit-imenu--log-extract-index-name-function "lisp/magit-imenu" "\
Return imenu name for line at point.
This function is used as a value for
`imenu-extract-index-name-function'.  Point should be at the
beginning of the line." nil nil)

(autoload 'magit-imenu--diff-prev-index-position-function "lisp/magit-imenu" "\
Move point to previous file line in current buffer.
This function is used as a value for
`imenu-prev-index-position-function'." nil nil)

(autoload 'magit-imenu--diff-extract-index-name-function "lisp/magit-imenu" "\
Return imenu name for line at point.
This function is used as a value for
`imenu-extract-index-name-function'.  Point should be at the
beginning of the line." nil nil)

(autoload 'magit-imenu--status-create-index-function "lisp/magit-imenu" "\
Return an alist of all imenu entries in current buffer.
This function is used as a value for
`imenu-create-index-function'." nil nil)

(autoload 'magit-imenu--refs-create-index-function "lisp/magit-imenu" "\
Return an alist of all imenu entries in current buffer.
This function is used as a value for
`imenu-create-index-function'." nil nil)

(autoload 'magit-imenu--cherry-create-index-function "lisp/magit-imenu" "\
Return an alist of all imenu entries in current buffer.
This function is used as a value for
`imenu-create-index-function'." nil nil)

(autoload 'magit-imenu--submodule-prev-index-position-function "lisp/magit-imenu" "\
Move point to previous line in magit-submodule-list buffer.
This function is used as a value for
`imenu-prev-index-position-function'." nil nil)

(autoload 'magit-imenu--submodule-extract-index-name-function "lisp/magit-imenu" "\
Return imenu name for line at point.
This function is used as a value for
`imenu-extract-index-name-function'.  Point should be at the
beginning of the line." nil nil)

(autoload 'magit-imenu--repolist-prev-index-position-function "lisp/magit-imenu" "\
Move point to previous line in magit-repolist buffer.
This function is used as a value for
`imenu-prev-index-position-function'." nil nil)

(autoload 'magit-imenu--repolist-extract-index-name-function "lisp/magit-imenu" "\
Return imenu name for line at point.
This function is used as a value for
`imenu-extract-index-name-function'.  Point should be at the
beginning of the line." nil nil)

(autoload 'magit-imenu--process-prev-index-position-function "lisp/magit-imenu" "\
Move point to previous process in magit-process buffer.
This function is used as a value for
`imenu-prev-index-position-function'." nil nil)

(autoload 'magit-imenu--process-extract-index-name-function "lisp/magit-imenu" "\
Return imenu name for line at point.
This function is used as a value for
`imenu-extract-index-name-function'.  Point should be at the
beginning of the line." nil nil)

(autoload 'magit-imenu--rebase-prev-index-position-function "lisp/magit-imenu" "\
Move point to previous commit in git-rebase buffer.
This function is used as a value for
`imenu-prev-index-position-function'." nil nil)

(autoload 'magit-imenu--rebase-extract-index-name-function "lisp/magit-imenu" "\
Return imenu name for line at point.
This function is used as a value for
`imenu-extract-index-name-function'.  Point should be at the
beginning of the line." nil nil)

(register-definition-prefixes "lisp/magit-imenu" '("magit-imenu--index-function"))

;;;***

;;;### (autoloads nil "lisp/magit-libgit" "magit/lisp/magit-libgit.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-libgit.el

(register-definition-prefixes "lisp/magit-libgit" '("magit-libgit-repo"))

;;;***

;;;### (autoloads nil "lisp/magit-log" "magit/lisp/magit-log.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-log.el
 (autoload 'magit-log "magit-log" nil t)
 (autoload 'magit-log-refresh "magit-log" nil t)

(autoload 'magit-log-current "lisp/magit-log" "\
Show log for the current branch.
When `HEAD' is detached or with a prefix argument show log for
one or more revs read from the minibuffer.

\(fn REVS &optional ARGS FILES)" t nil)

(autoload 'magit-log-other "lisp/magit-log" "\
Show log for one or more revs read from the minibuffer.
The user can input any revision or revisions separated by a
space, or even ranges, but only branches and tags, and a
representation of the commit at point, are available as
completion candidates.

\(fn REVS &optional ARGS FILES)" t nil)

(autoload 'magit-log-head "lisp/magit-log" "\
Show log for `HEAD'.

\(fn &optional ARGS FILES)" t nil)

(autoload 'magit-log-branches "lisp/magit-log" "\
Show log for all local branches and `HEAD'.

\(fn &optional ARGS FILES)" t nil)

(autoload 'magit-log-matching-branches "lisp/magit-log" "\
Show log for all branches matching PATTERN and `HEAD'.

\(fn PATTERN &optional ARGS FILES)" t nil)

(autoload 'magit-log-matching-tags "lisp/magit-log" "\
Show log for all tags matching PATTERN and `HEAD'.

\(fn PATTERN &optional ARGS FILES)" t nil)

(autoload 'magit-log-all-branches "lisp/magit-log" "\
Show log for all local and remote branches and `HEAD'.

\(fn &optional ARGS FILES)" t nil)

(autoload 'magit-log-all "lisp/magit-log" "\
Show log for all references and `HEAD'.

\(fn &optional ARGS FILES)" t nil)

(autoload 'magit-log-buffer-file "lisp/magit-log" "\
Show log for the blob or file visited in the current buffer.
With a prefix argument or when `--follow' is an active log
argument, then follow renames.  When the region is active,
restrict the log to the lines that the region touches.

\(fn &optional FOLLOW BEG END)" t nil)

(autoload 'magit-log-trace-definition "lisp/magit-log" "\
Show log for the definition at point.

\(fn FILE FN REV)" t nil)

(autoload 'magit-log-merged "lisp/magit-log" "\
Show log for the merge of COMMIT into BRANCH.

More precisely, find merge commit M that brought COMMIT into
BRANCH, and show the log of the range \"M^1..M\".  If COMMIT is
directly on BRANCH, then show approximately twenty surrounding
commits instead.

This command requires git-when-merged, which is available from
https://github.com/mhagger/git-when-merged.

\(fn COMMIT BRANCH &optional ARGS FILES)" t nil)

(autoload 'magit-log-move-to-parent "lisp/magit-log" "\
Move to the Nth parent of the current commit.

\(fn &optional N)" t nil)
 (autoload 'magit-shortlog "magit-log" nil t)

(autoload 'magit-shortlog-since "lisp/magit-log" "\
Show a history summary for commits since REV.

\(fn REV ARGS)" t nil)

(autoload 'magit-shortlog-range "lisp/magit-log" "\
Show a history summary for commit or range REV-OR-RANGE.

\(fn REV-OR-RANGE ARGS)" t nil)

(autoload 'magit-cherry "lisp/magit-log" "\
Show commits in a branch that are not merged in the upstream branch.

\(fn HEAD UPSTREAM)" t nil)

(register-definition-prefixes "lisp/magit-log" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-margin" "magit/lisp/magit-margin.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-margin.el

(register-definition-prefixes "lisp/magit-margin" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-merge" "magit/lisp/magit-merge.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-merge.el
 (autoload 'magit-merge "magit" nil t)

(autoload 'magit-merge-plain "lisp/magit-merge" "\
Merge commit REV into the current branch; using default message.

Unless there are conflicts or a prefix argument is used create a
merge commit using a generic commit message and without letting
the user inspect the result.  With a prefix argument pretend the
merge failed to give the user the opportunity to inspect the
merge.

\(git merge --no-edit|--no-commit [ARGS] REV)

\(fn REV &optional ARGS NOCOMMIT)" t nil)

(autoload 'magit-merge-editmsg "lisp/magit-merge" "\
Merge commit REV into the current branch; and edit message.
Perform the merge and prepare a commit message but let the user
edit it.

\(git merge --edit --no-ff [ARGS] REV)

\(fn REV &optional ARGS)" t nil)

(autoload 'magit-merge-nocommit "lisp/magit-merge" "\
Merge commit REV into the current branch; pretending it failed.
Pretend the merge failed to give the user the opportunity to
inspect the merge and change the commit message.

\(git merge --no-commit --no-ff [ARGS] REV)

\(fn REV &optional ARGS)" t nil)

(autoload 'magit-merge-into "lisp/magit-merge" "\
Merge the current branch into BRANCH and remove the former.

Before merging, force push the source branch to its push-remote,
provided the respective remote branch already exists, ensuring
that the respective pull-request (if any) won't get stuck on some
obsolete version of the commits that are being merged.  Finally
if `forge-branch-pullreq' was used to create the merged branch,
branch, then also remove the respective remote branch.

\(fn BRANCH &optional ARGS)" t nil)

(autoload 'magit-merge-absorb "lisp/magit-merge" "\
Merge BRANCH into the current branch and remove the former.

Before merging, force push the source branch to its push-remote,
provided the respective remote branch already exists, ensuring
that the respective pull-request (if any) won't get stuck on some
obsolete version of the commits that are being merged.  Finally
if `forge-branch-pullreq' was used to create the merged branch,
then also remove the respective remote branch.

\(fn BRANCH &optional ARGS)" t nil)

(autoload 'magit-merge-squash "lisp/magit-merge" "\
Squash commit REV into the current branch; don't create a commit.

\(git merge --squash REV)

\(fn REV)" t nil)

(autoload 'magit-merge-preview "lisp/magit-merge" "\
Preview result of merging REV into the current branch.

\(fn REV)" t nil)

(autoload 'magit-merge-abort "lisp/magit-merge" "\
Abort the current merge operation.

\(git merge --abort)" t nil)

(register-definition-prefixes "lisp/magit-merge" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-mode" "magit/lisp/magit-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-mode.el

(register-definition-prefixes "lisp/magit-mode" '("disable-magit-save-buffers" "magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-notes" "magit/lisp/magit-notes.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-notes.el
 (autoload 'magit-notes "magit" nil t)

(register-definition-prefixes "lisp/magit-notes" '("magit-notes-"))

;;;***

;;;### (autoloads nil "lisp/magit-obsolete" "magit/lisp/magit-obsolete.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-obsolete.el

(register-definition-prefixes "lisp/magit-obsolete" '("magit--magit-popup-warning"))

;;;***

;;;### (autoloads nil "lisp/magit-patch" "magit/lisp/magit-patch.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-patch.el
 (autoload 'magit-patch "magit-patch" nil t)
 (autoload 'magit-patch-create "magit-patch" nil t)
 (autoload 'magit-patch-apply "magit-patch" nil t)

(autoload 'magit-patch-save "lisp/magit-patch" "\
Write current diff into patch FILE.

What arguments are used to create the patch depends on the value
of `magit-patch-save-arguments' and whether a prefix argument is
used.

If the value is the symbol `buffer', then use the same arguments
as the buffer.  With a prefix argument use no arguments.

If the value is a list beginning with the symbol `exclude', then
use the same arguments as the buffer except for those matched by
entries in the cdr of the list.  The comparison is done using
`string-prefix-p'.  With a prefix argument use the same arguments
as the buffer.

If the value is a list of strings (including the empty list),
then use those arguments.  With a prefix argument use the same
arguments as the buffer.

Of course the arguments that are required to actually show the
same differences as those shown in the buffer are always used.

\(fn FILE &optional ARG)" t nil)

(autoload 'magit-request-pull "lisp/magit-patch" "\
Request upstream to pull from your public repository.

URL is the url of your publicly accessible repository.
START is a commit that already is in the upstream repository.
END is the last commit, usually a branch name, which upstream
is asked to pull.  START has to be reachable from that commit.

\(fn URL START END)" t nil)

(register-definition-prefixes "lisp/magit-patch" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-process" "magit/lisp/magit-process.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-process.el

(register-definition-prefixes "lisp/magit-process" '("magit-" "tramp-sh-handle-"))

;;;***

;;;### (autoloads nil "lisp/magit-pull" "magit/lisp/magit-pull.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-pull.el
 (autoload 'magit-pull "magit-pull" nil t)
 (autoload 'magit-pull-from-pushremote "magit-pull" nil t)
 (autoload 'magit-pull-from-upstream "magit-pull" nil t)

(autoload 'magit-pull-branch "lisp/magit-pull" "\
Pull from a branch read in the minibuffer.

\(fn SOURCE ARGS)" t nil)

(register-definition-prefixes "lisp/magit-pull" '("magit-pull-"))

;;;***

;;;### (autoloads nil "lisp/magit-push" "magit/lisp/magit-push.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-push.el
 (autoload 'magit-push "magit-push" nil t)
 (autoload 'magit-push-current-to-pushremote "magit-push" nil t)
 (autoload 'magit-push-current-to-upstream "magit-push" nil t)

(autoload 'magit-push-current "lisp/magit-push" "\
Push the current branch to a branch read in the minibuffer.

\(fn TARGET ARGS)" t nil)

(autoload 'magit-push-other "lisp/magit-push" "\
Push an arbitrary branch or commit somewhere.
Both the source and the target are read in the minibuffer.

\(fn SOURCE TARGET ARGS)" t nil)

(autoload 'magit-push-refspecs "lisp/magit-push" "\
Push one or multiple REFSPECS to a REMOTE.
Both the REMOTE and the REFSPECS are read in the minibuffer.  To
use multiple REFSPECS, separate them with commas.  Completion is
only available for the part before the colon, or when no colon
is used.

\(fn REMOTE REFSPECS ARGS)" t nil)

(autoload 'magit-push-matching "lisp/magit-push" "\
Push all matching branches to another repository.
If multiple remotes exist, then read one from the user.
If just one exists, use that without requiring confirmation.

\(fn REMOTE &optional ARGS)" t nil)

(autoload 'magit-push-tags "lisp/magit-push" "\
Push all tags to another repository.
If only one remote exists, then push to that.  Otherwise prompt
for a remote, offering the remote configured for the current
branch as default.

\(fn REMOTE &optional ARGS)" t nil)

(autoload 'magit-push-tag "lisp/magit-push" "\
Push a tag to another repository.

\(fn TAG REMOTE &optional ARGS)" t nil)

(autoload 'magit-push-notes-ref "lisp/magit-push" "\
Push a notes ref to another repository.

\(fn REF REMOTE &optional ARGS)" t nil)
 (autoload 'magit-push-implicitly "magit-push" nil t)

(autoload 'magit-push-to-remote "lisp/magit-push" "\
Push to REMOTE without using an explicit refspec.
The REMOTE is read in the minibuffer.

This command simply runs \"git push -v [ARGS] REMOTE\".  ARGS
are the arguments specified in the popup buffer.  No refspec
arguments are used.  Instead the behavior depends on at least
these Git variables: `push.default', `remote.pushDefault',
`branch.<branch>.pushRemote', `branch.<branch>.remote',
`branch.<branch>.merge', and `remote.<remote>.push'.

\(fn REMOTE ARGS)" t nil)

(register-definition-prefixes "lisp/magit-push" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-reflog" "magit/lisp/magit-reflog.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-reflog.el

(autoload 'magit-reflog-current "lisp/magit-reflog" "\
Display the reflog of the current branch.
If `HEAD' is detached, then show the reflog for that instead." t nil)

(autoload 'magit-reflog-other "lisp/magit-reflog" "\
Display the reflog of a branch or another ref.

\(fn REF)" t nil)

(autoload 'magit-reflog-head "lisp/magit-reflog" "\
Display the `HEAD' reflog." t nil)

(register-definition-prefixes "lisp/magit-reflog" '("magit-reflog-"))

;;;***

;;;### (autoloads nil "lisp/magit-refs" "magit/lisp/magit-refs.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-refs.el
 (autoload 'magit-show-refs "magit-refs" nil t)

(autoload 'magit-show-refs-head "lisp/magit-refs" "\
List and compare references in a dedicated buffer.
Compared with `HEAD'.

\(fn &optional ARGS)" t nil)

(autoload 'magit-show-refs-current "lisp/magit-refs" "\
List and compare references in a dedicated buffer.
Compare with the current branch or `HEAD' if it is detached.

\(fn &optional ARGS)" t nil)

(autoload 'magit-show-refs-other "lisp/magit-refs" "\
List and compare references in a dedicated buffer.
Compared with a branch read from the user.

\(fn &optional REF ARGS)" t nil)

(register-definition-prefixes "lisp/magit-refs" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-remote" "magit/lisp/magit-remote.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-remote.el
 (autoload 'magit-remote "magit-remote" nil t)

(autoload 'magit-remote-add "lisp/magit-remote" "\
Add a remote named REMOTE and fetch it.

\(fn REMOTE URL &optional ARGS)" t nil)

(autoload 'magit-remote-rename "lisp/magit-remote" "\
Rename the remote named OLD to NEW.

\(fn OLD NEW)" t nil)

(autoload 'magit-remote-remove "lisp/magit-remote" "\
Delete the remote named REMOTE.

\(fn REMOTE)" t nil)

(autoload 'magit-remote-prune "lisp/magit-remote" "\
Remove stale remote-tracking branches for REMOTE.

\(fn REMOTE)" t nil)

(autoload 'magit-remote-prune-refspecs "lisp/magit-remote" "\
Remove stale refspecs for REMOTE.

A refspec is stale if there no longer exists at least one branch
on the remote that would be fetched due to that refspec.  A stale
refspec is problematic because its existence causes Git to refuse
to fetch according to the remaining non-stale refspecs.

If only stale refspecs remain, then offer to either delete the
remote or to replace the stale refspecs with the default refspec.

Also remove the remote-tracking branches that were created due to
the now stale refspecs.  Other stale branches are not removed.

\(fn REMOTE)" t nil)

(autoload 'magit-remote-set-head "lisp/magit-remote" "\
Set the local representation of REMOTE's default branch.
Query REMOTE and set the symbolic-ref refs/remotes/<remote>/HEAD
accordingly.  With a prefix argument query for the branch to be
used, which allows you to select an incorrect value if you fancy
doing that.

\(fn REMOTE &optional BRANCH)" t nil)

(autoload 'magit-remote-unset-head "lisp/magit-remote" "\
Unset the local representation of REMOTE's default branch.
Delete the symbolic-ref \"refs/remotes/<remote>/HEAD\".

\(fn REMOTE)" t nil)
 (autoload 'magit-remote-configure "magit-remote" nil t)

(register-definition-prefixes "lisp/magit-remote" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-repos" "magit/lisp/magit-repos.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-repos.el

(autoload 'magit-list-repositories "lisp/magit-repos" "\
Display a list of repositories.

Use the options `magit-repository-directories' to control which
repositories are displayed." t nil)

(register-definition-prefixes "lisp/magit-repos" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-reset" "magit/lisp/magit-reset.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-reset.el
 (autoload 'magit-reset "magit" nil t)

(autoload 'magit-reset-mixed "lisp/magit-reset" "\
Reset the `HEAD' and index to COMMIT, but not the working tree.

\(git reset --mixed COMMIT)

\(fn COMMIT)" t nil)

(autoload 'magit-reset-soft "lisp/magit-reset" "\
Reset the `HEAD' to COMMIT, but not the index and working tree.

\(git reset --soft REVISION)

\(fn COMMIT)" t nil)

(autoload 'magit-reset-hard "lisp/magit-reset" "\
Reset the `HEAD', index, and working tree to COMMIT.

\(git reset --hard REVISION)

\(fn COMMIT)" t nil)

(autoload 'magit-reset-keep "lisp/magit-reset" "\
Reset the `HEAD' and index to COMMIT, while keeping uncommitted changes.

\(git reset --keep REVISION)

\(fn COMMIT)" t nil)

(autoload 'magit-reset-index "lisp/magit-reset" "\
Reset the index to COMMIT.
Keep the `HEAD' and working tree as-is, so if COMMIT refers to the
head this effectively unstages all changes.

\(git reset COMMIT .)

\(fn COMMIT)" t nil)

(autoload 'magit-reset-worktree "lisp/magit-reset" "\
Reset the worktree to COMMIT.
Keep the `HEAD' and index as-is.

\(fn COMMIT)" t nil)

(autoload 'magit-reset-quickly "lisp/magit-reset" "\
Reset the `HEAD' and index to COMMIT, and possibly the working tree.
With a prefix argument reset the working tree otherwise don't.

\(git reset --mixed|--hard COMMIT)

\(fn COMMIT &optional HARD)" t nil)

(register-definition-prefixes "lisp/magit-reset" '("magit-reset-"))

;;;***

;;;### (autoloads nil "lisp/magit-section" "magit/lisp/magit-section.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-section.el

(register-definition-prefixes "lisp/magit-section" '("isearch-clean-overlays@magit-mode" "magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-sequence" "magit/lisp/magit-sequence.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-sequence.el

(autoload 'magit-sequencer-continue "lisp/magit-sequence" "\
Resume the current cherry-pick or revert sequence." t nil)

(autoload 'magit-sequencer-skip "lisp/magit-sequence" "\
Skip the stopped at commit during a cherry-pick or revert sequence." t nil)

(autoload 'magit-sequencer-abort "lisp/magit-sequence" "\
Abort the current cherry-pick or revert sequence.
This discards all changes made since the sequence started." t nil)
 (autoload 'magit-cherry-pick "magit-sequence" nil t)

(autoload 'magit-cherry-copy "lisp/magit-sequence" "\
Copy COMMITS from another branch onto the current branch.
Prompt for a commit, defaulting to the commit at point.  If
the region selects multiple commits, then pick all of them,
without prompting.

\(fn COMMITS &optional ARGS)" t nil)

(autoload 'magit-cherry-apply "lisp/magit-sequence" "\
Apply the changes in COMMITS but do not commit them.
Prompt for a commit, defaulting to the commit at point.  If
the region selects multiple commits, then apply all of them,
without prompting.

\(fn COMMITS &optional ARGS)" t nil)

(autoload 'magit-cherry-harvest "lisp/magit-sequence" "\
Move COMMITS from another BRANCH onto the current branch.
Remove the COMMITS from BRANCH and stay on the current branch.
If a conflict occurs, then you have to fix that and finish the
process manually.

\(fn COMMITS BRANCH &optional ARGS)" t nil)

(autoload 'magit-cherry-donate "lisp/magit-sequence" "\
Move COMMITS from the current branch onto another existing BRANCH.
Remove COMMITS from the current branch and stay on that branch.
If a conflict occurs, then you have to fix that and finish the
process manually.

\(fn COMMITS BRANCH &optional ARGS)" t nil)

(autoload 'magit-cherry-spinout "lisp/magit-sequence" "\
Move COMMITS from the current branch onto a new BRANCH.
Remove COMMITS from the current branch and stay on that branch.
If a conflict occurs, then you have to fix that and finish the
process manually.

\(fn COMMITS BRANCH START-POINT &optional ARGS)" t nil)

(autoload 'magit-cherry-spinoff "lisp/magit-sequence" "\
Move COMMITS from the current branch onto a new BRANCH.
Remove COMMITS from the current branch and checkout BRANCH.
If a conflict occurs, then you have to fix that and finish
the process manually.

\(fn COMMITS BRANCH START-POINT &optional ARGS)" t nil)
 (autoload 'magit-revert "magit-sequence" nil t)

(autoload 'magit-revert-and-commit "lisp/magit-sequence" "\
Revert COMMIT by creating a new commit.
Prompt for a commit, defaulting to the commit at point.  If
the region selects multiple commits, then revert all of them,
without prompting.

\(fn COMMIT &optional ARGS)" t nil)

(autoload 'magit-revert-no-commit "lisp/magit-sequence" "\
Revert COMMIT by applying it in reverse to the worktree.
Prompt for a commit, defaulting to the commit at point.  If
the region selects multiple commits, then revert all of them,
without prompting.

\(fn COMMIT &optional ARGS)" t nil)
 (autoload 'magit-am "magit-sequence" nil t)

(autoload 'magit-am-apply-patches "lisp/magit-sequence" "\
Apply the patches FILES.

\(fn &optional FILES ARGS)" t nil)

(autoload 'magit-am-apply-maildir "lisp/magit-sequence" "\
Apply the patches from MAILDIR.

\(fn &optional MAILDIR ARGS)" t nil)

(autoload 'magit-am-continue "lisp/magit-sequence" "\
Resume the current patch applying sequence." t nil)

(autoload 'magit-am-skip "lisp/magit-sequence" "\
Skip the stopped at patch during a patch applying sequence." t nil)

(autoload 'magit-am-abort "lisp/magit-sequence" "\
Abort the current patch applying sequence.
This discards all changes made since the sequence started." t nil)
 (autoload 'magit-rebase "magit-sequence" nil t)
 (autoload 'magit-rebase-onto-pushremote "magit-sequence" nil t)
 (autoload 'magit-rebase-onto-upstream "magit-sequence" nil t)

(autoload 'magit-rebase-branch "lisp/magit-sequence" "\
Rebase the current branch onto a branch read in the minibuffer.
All commits that are reachable from `HEAD' but not from the
selected branch TARGET are being rebased.

\(fn TARGET ARGS)" t nil)

(autoload 'magit-rebase-subset "lisp/magit-sequence" "\
Rebase a subset of the current branch's history onto a new base.
Rebase commits from START to `HEAD' onto NEWBASE.
START has to be selected from a list of recent commits.

\(fn NEWBASE START ARGS)" t nil)

(autoload 'magit-rebase-interactive "lisp/magit-sequence" "\
Start an interactive rebase sequence.

\(fn COMMIT ARGS)" t nil)

(autoload 'magit-rebase-autosquash "lisp/magit-sequence" "\
Combine squash and fixup commits with their intended targets.

\(fn ARGS)" t nil)

(autoload 'magit-rebase-edit-commit "lisp/magit-sequence" "\
Edit a single older commit using rebase.

\(fn COMMIT ARGS)" t nil)

(autoload 'magit-rebase-reword-commit "lisp/magit-sequence" "\
Reword a single older commit using rebase.

\(fn COMMIT ARGS)" t nil)

(autoload 'magit-rebase-remove-commit "lisp/magit-sequence" "\
Remove a single older commit using rebase.

\(fn COMMIT ARGS)" t nil)

(autoload 'magit-rebase-continue "lisp/magit-sequence" "\
Restart the current rebasing operation.
In some cases this pops up a commit message buffer for you do
edit.  With a prefix argument the old message is reused as-is.

\(fn &optional NOEDIT)" t nil)

(autoload 'magit-rebase-skip "lisp/magit-sequence" "\
Skip the current commit and restart the current rebase operation." t nil)

(autoload 'magit-rebase-edit "lisp/magit-sequence" "\
Edit the todo list of the current rebase operation." t nil)

(autoload 'magit-rebase-abort "lisp/magit-sequence" "\
Abort the current rebase operation, restoring the original branch." t nil)

(register-definition-prefixes "lisp/magit-sequence" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-stash" "magit/lisp/magit-stash.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-stash.el
 (autoload 'magit-stash "magit-stash" nil t)

(autoload 'magit-stash-both "lisp/magit-stash" "\
Create a stash of the index and working tree.
Untracked files are included according to infix arguments.
One prefix argument is equivalent to `--include-untracked'
while two prefix arguments are equivalent to `--all'.

\(fn MESSAGE &optional INCLUDE-UNTRACKED)" t nil)

(autoload 'magit-stash-index "lisp/magit-stash" "\
Create a stash of the index only.
Unstaged and untracked changes are not stashed.  The stashed
changes are applied in reverse to both the index and the
worktree.  This command can fail when the worktree is not clean.
Applying the resulting stash has the inverse effect.

\(fn MESSAGE)" t nil)

(autoload 'magit-stash-worktree "lisp/magit-stash" "\
Create a stash of unstaged changes in the working tree.
Untracked files are included according to infix arguments.
One prefix argument is equivalent to `--include-untracked'
while two prefix arguments are equivalent to `--all'.

\(fn MESSAGE &optional INCLUDE-UNTRACKED)" t nil)

(autoload 'magit-stash-keep-index "lisp/magit-stash" "\
Create a stash of the index and working tree, keeping index intact.
Untracked files are included according to infix arguments.
One prefix argument is equivalent to `--include-untracked'
while two prefix arguments are equivalent to `--all'.

\(fn MESSAGE &optional INCLUDE-UNTRACKED)" t nil)

(autoload 'magit-snapshot-both "lisp/magit-stash" "\
Create a snapshot of the index and working tree.
Untracked files are included according to infix arguments.
One prefix argument is equivalent to `--include-untracked'
while two prefix arguments are equivalent to `--all'.

\(fn &optional INCLUDE-UNTRACKED)" t nil)

(autoload 'magit-snapshot-index "lisp/magit-stash" "\
Create a snapshot of the index only.
Unstaged and untracked changes are not stashed." t nil)

(autoload 'magit-snapshot-worktree "lisp/magit-stash" "\
Create a snapshot of unstaged changes in the working tree.
Untracked files are included according to infix arguments.
One prefix argument is equivalent to `--include-untracked'
while two prefix arguments are equivalent to `--all'.

\(fn &optional INCLUDE-UNTRACKED)" t nil)

(autoload 'magit-stash-apply "lisp/magit-stash" "\
Apply a stash to the working tree.
Try to preserve the stash index.  If that fails because there
are staged changes, apply without preserving the stash index.

\(fn STASH)" t nil)

(autoload 'magit-stash-drop "lisp/magit-stash" "\
Remove a stash from the stash list.
When the region is active offer to drop all contained stashes.

\(fn STASH)" t nil)

(autoload 'magit-stash-clear "lisp/magit-stash" "\
Remove all stashes saved in REF's reflog by deleting REF.

\(fn REF)" t nil)

(autoload 'magit-stash-branch "lisp/magit-stash" "\
Create and checkout a new BRANCH from STASH.

\(fn STASH BRANCH)" t nil)

(autoload 'magit-stash-branch-here "lisp/magit-stash" "\
Create and checkout a new BRANCH and apply STASH.
The branch is created using `magit-branch-and-checkout', using the
current branch or `HEAD' as the start-point.

\(fn STASH BRANCH)" t nil)

(autoload 'magit-stash-format-patch "lisp/magit-stash" "\
Create a patch from STASH

\(fn STASH)" t nil)

(autoload 'magit-stash-list "lisp/magit-stash" "\
List all stashes in a buffer." t nil)

(autoload 'magit-stash-show "lisp/magit-stash" "\
Show all diffs of a stash in a buffer.

\(fn STASH &optional ARGS FILES)" t nil)

(register-definition-prefixes "lisp/magit-stash" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-status" "magit/lisp/magit-status.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-status.el

(autoload 'magit-init "lisp/magit-status" "\
Initialize a Git repository, then show its status.

If the directory is below an existing repository, then the user
has to confirm that a new one should be created inside.  If the
directory is the root of the existing repository, then the user
has to confirm that it should be reinitialized.

Non-interactively DIRECTORY is (re-)initialized unconditionally.

\(fn DIRECTORY)" t nil)

(autoload 'magit-status "lisp/magit-status" "\
Show the status of the current Git repository in a buffer.

If the current directory isn't located within a Git repository,
then prompt for an existing repository or an arbitrary directory,
depending on option `magit-repository-directories', and show the
status of the selected repository instead.

* If that option specifies any existing repositories, then offer
  those for completion and show the status buffer for the
  selected one.

* Otherwise read an arbitrary directory using regular file-name
  completion.  If the selected directory is the top-level of an
  existing working tree, then show the status buffer for that.

* Otherwise offer to initialize the selected directory as a new
  repository.  After creating the repository show its status
  buffer.

These fallback behaviors can also be forced using one or more
prefix arguments:

* With two prefix arguments (or more precisely a numeric prefix
  value of 16 or greater) read an arbitrary directory and act on
  it as described above.  The same could be accomplished using
  the command `magit-init'.

* With a single prefix argument read an existing repository, or
  if none can be found based on `magit-repository-directories',
  then fall back to the same behavior as with two prefix
  arguments.

\(fn &optional DIRECTORY CACHE)" t nil)

(defalias 'magit 'magit-status "\
An alias for `magit-status' for better discoverability.

Instead of invoking this alias for `magit-status' using
\"M-x magit RET\", you should bind a key to `magit-status'
and read the info node `(magit)Getting Started', which
also contains other useful hints.")

(autoload 'magit-status-here "lisp/magit-status" "\
Like `magit-status' but with non-nil `magit-status-goto-file-position'." t nil)

(autoload 'magit-status-setup-buffer "lisp/magit-status" "\


\(fn &optional DIRECTORY)" nil nil)

(register-definition-prefixes "lisp/magit-status" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-submodule" "magit/lisp/magit-submodule.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-submodule.el
 (autoload 'magit-submodule "magit-submodule" nil t)
 (autoload 'magit-submodule-add "magit-submodule" nil t)

(autoload 'magit-submodule-read-name-for-path "lisp/magit-submodule" "\


\(fn PATH &optional PREFER-SHORT)" nil nil)
 (autoload 'magit-submodule-register "magit-submodule" nil t)
 (autoload 'magit-submodule-populate "magit-submodule" nil t)
 (autoload 'magit-submodule-update "magit-submodule" nil t)
 (autoload 'magit-submodule-synchronize "magit-submodule" nil t)
 (autoload 'magit-submodule-unpopulate "magit-submodule" nil t)

(autoload 'magit-submodule-remove "lisp/magit-submodule" "\
Unregister MODULES and remove their working directories.

For safety reasons, do not remove the gitdirs and if a module has
uncommitted changes, then do not remove it at all.  If a module's
gitdir is located inside the working directory, then move it into
the gitdir of the superproject first.

With the \"--force\" argument offer to remove dirty working
directories and with a prefix argument offer to delete gitdirs.
Both actions are very dangerous and have to be confirmed.  There
are additional safety precautions in place, so you might be able
to recover from making a mistake here, but don't count on it.

\(fn MODULES ARGS TRASH-GITDIRS)" t nil)

(autoload 'magit-insert-modules "lisp/magit-submodule" "\
Insert submodule sections.
Hook `magit-module-sections-hook' controls which module sections
are inserted, and option `magit-module-sections-nested' controls
whether they are wrapped in an additional section." nil nil)

(autoload 'magit-insert-modules-overview "lisp/magit-submodule" "\
Insert sections for all modules.
For each section insert the path and the output of `git describe --tags',
or, failing that, the abbreviated HEAD commit hash." nil nil)

(autoload 'magit-insert-modules-unpulled-from-upstream "lisp/magit-submodule" "\
Insert sections for modules that haven't been pulled from the upstream.
These sections can be expanded to show the respective commits." nil nil)

(autoload 'magit-insert-modules-unpulled-from-pushremote "lisp/magit-submodule" "\
Insert sections for modules that haven't been pulled from the push-remote.
These sections can be expanded to show the respective commits." nil nil)

(autoload 'magit-insert-modules-unpushed-to-upstream "lisp/magit-submodule" "\
Insert sections for modules that haven't been pushed to the upstream.
These sections can be expanded to show the respective commits." nil nil)

(autoload 'magit-insert-modules-unpushed-to-pushremote "lisp/magit-submodule" "\
Insert sections for modules that haven't been pushed to the push-remote.
These sections can be expanded to show the respective commits." nil nil)

(autoload 'magit-list-submodules "lisp/magit-submodule" "\
Display a list of the current repository's submodules." t nil)

(register-definition-prefixes "lisp/magit-submodule" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-subtree" "magit/lisp/magit-subtree.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-subtree.el
 (autoload 'magit-subtree "magit-subtree" nil t)
 (autoload 'magit-subtree-import "magit-subtree" nil t)
 (autoload 'magit-subtree-export "magit-subtree" nil t)

(autoload 'magit-subtree-add "lisp/magit-subtree" "\
Add REF from REPOSITORY as a new subtree at PREFIX.

\(fn PREFIX REPOSITORY REF ARGS)" t nil)

(autoload 'magit-subtree-add-commit "lisp/magit-subtree" "\
Add COMMIT as a new subtree at PREFIX.

\(fn PREFIX COMMIT ARGS)" t nil)

(autoload 'magit-subtree-merge "lisp/magit-subtree" "\
Merge COMMIT into the PREFIX subtree.

\(fn PREFIX COMMIT ARGS)" t nil)

(autoload 'magit-subtree-pull "lisp/magit-subtree" "\
Pull REF from REPOSITORY into the PREFIX subtree.

\(fn PREFIX REPOSITORY REF ARGS)" t nil)

(autoload 'magit-subtree-push "lisp/magit-subtree" "\
Extract the history of the subtree PREFIX and push it to REF on REPOSITORY.

\(fn PREFIX REPOSITORY REF ARGS)" t nil)

(autoload 'magit-subtree-split "lisp/magit-subtree" "\
Extract the history of the subtree PREFIX.

\(fn PREFIX COMMIT ARGS)" t nil)

(register-definition-prefixes "lisp/magit-subtree" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-tag" "magit/lisp/magit-tag.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-tag.el
 (autoload 'magit-tag "magit" nil t)

(autoload 'magit-tag-create "lisp/magit-tag" "\
Create a new tag with the given NAME at REV.
With a prefix argument annotate the tag.

\(git tag [--annotate] NAME REV)

\(fn NAME REV &optional ARGS)" t nil)

(autoload 'magit-tag-delete "lisp/magit-tag" "\
Delete one or more tags.
If the region marks multiple tags (and nothing else), then offer
to delete those, otherwise prompt for a single tag to be deleted,
defaulting to the tag at point.

\(git tag -d TAGS)

\(fn TAGS)" t nil)

(autoload 'magit-tag-prune "lisp/magit-tag" "\
Offer to delete tags missing locally from REMOTE, and vice versa.

\(fn TAGS REMOTE-TAGS REMOTE)" t nil)

(autoload 'magit-tag-release "lisp/magit-tag" "\
Create a release tag.

Assume that release tags match `magit-release-tag-regexp'.

First prompt for the name of the new tag using the highest
existing tag as initial input and leaving it to the user to
increment the desired part of the version string.

If `--annotate' is enabled, then prompt for the message of the
new tag.  Base the proposed tag message on the message of the
highest tag, provided that that contains the corresponding
version string and substituting the new version string for that.
Otherwise propose something like \"Foo-Bar 1.2.3\", given, for
example, a TAG \"v1.2.3\" and a repository located at something
like \"/path/to/foo-bar\".

\(fn TAG MSG &optional ARGS)" t nil)

(register-definition-prefixes "lisp/magit-tag" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-transient" "magit/lisp/magit-transient.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-transient.el

(register-definition-prefixes "lisp/magit-transient" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-utils" "magit/lisp/magit-utils.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-utils.el

(autoload 'magit-emacs-Q-command "lisp/magit-utils" "\
Show a shell command that runs an uncustomized Emacs with only Magit loaded.
See info node `(magit)Debugging Tools' for more information." t nil)

(autoload 'Info-follow-nearest-node--magit-gitman "lisp/magit-utils" "\


\(fn FN &optional FORK)" nil nil)

(advice-add 'Info-follow-nearest-node :around 'Info-follow-nearest-node--magit-gitman)

(autoload 'org-man-export--magit-gitman "lisp/magit-utils" "\


\(fn FN LINK DESCRIPTION FORMAT)" nil nil)

(advice-add 'org-man-export :around 'org-man-export--magit-gitman)

(register-definition-prefixes "lisp/magit-utils" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-wip" "magit/lisp/magit-wip.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-wip.el

(defvar magit-wip-mode nil "\
Non-nil if Magit-Wip mode is enabled.
See the `magit-wip-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `magit-wip-mode'.")

(custom-autoload 'magit-wip-mode "lisp/magit-wip" nil)

(autoload 'magit-wip-mode "lisp/magit-wip" "\
Save uncommitted changes to work-in-progress refs.

If called interactively, toggle `Magit-Wip mode'.  If the prefix
argument is positive, enable the mode, and if it is zero or
negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

Whenever appropriate (i.e. when dataloss would be a possibility
otherwise) this mode causes uncommitted changes to be committed
to dedicated work-in-progress refs.

For historic reasons this mode is implemented on top of four
other `magit-wip-*' modes, which can also be used individually,
if you want finer control over when the wip refs are updated;
but that is discouraged.

\(fn &optional ARG)" t nil)

(put 'magit-wip-after-save-mode 'globalized-minor-mode t)

(defvar magit-wip-after-save-mode nil "\
Non-nil if Magit-Wip-After-Save mode is enabled.
See the `magit-wip-after-save-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `magit-wip-after-save-mode'.")

(custom-autoload 'magit-wip-after-save-mode "lisp/magit-wip" nil)

(autoload 'magit-wip-after-save-mode "lisp/magit-wip" "\
Toggle Magit-Wip-After-Save-Local mode in all buffers.
With prefix ARG, enable Magit-Wip-After-Save mode if ARG is
positive; otherwise, disable it.  If called from Lisp, enable the mode if ARG
is omitted or nil.

Magit-Wip-After-Save-Local mode is enabled in all buffers where
`magit-wip-after-save-local-mode-turn-on' would do it.

See `magit-wip-after-save-local-mode' for more information on
Magit-Wip-After-Save-Local mode.

\(fn &optional ARG)" t nil)

(defvar magit-wip-after-apply-mode nil "\
Non-nil if Magit-Wip-After-Apply mode is enabled.
See the `magit-wip-after-apply-mode' command
for a description of this minor mode.")

(custom-autoload 'magit-wip-after-apply-mode "lisp/magit-wip" nil)

(autoload 'magit-wip-after-apply-mode "lisp/magit-wip" "\
Commit to work-in-progress refs.

If called interactively, toggle `Magit-Wip-After-Apply mode'.  If
the prefix argument is positive, enable the mode, and if it is
zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

After applying a change using any \"apply variant\"
command (apply, stage, unstage, discard, and reverse) commit the
affected files to the current wip refs.  For each branch there
may be two wip refs; one contains snapshots of the files as found
in the worktree and the other contains snapshots of the entries
in the index.

\(fn &optional ARG)" t nil)

(defvar magit-wip-before-change-mode nil "\
Non-nil if Magit-Wip-Before-Change mode is enabled.
See the `magit-wip-before-change-mode' command
for a description of this minor mode.")

(custom-autoload 'magit-wip-before-change-mode "lisp/magit-wip" nil)

(autoload 'magit-wip-before-change-mode "lisp/magit-wip" "\
Commit to work-in-progress refs before certain destructive changes.

If called interactively, toggle `Magit-Wip-Before-Change mode'.
If the prefix argument is positive, enable the mode, and if it is
zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

Before invoking a revert command or an \"apply variant\"
command (apply, stage, unstage, discard, and reverse) commit the
affected tracked files to the current wip refs.  For each branch
there may be two wip refs; one contains snapshots of the files
as found in the worktree and the other contains snapshots of the
entries in the index.

Only changes to files which could potentially be affected by the
command which is about to be called are committed.

\(fn &optional ARG)" t nil)

(autoload 'magit-wip-commit-initial-backup "lisp/magit-wip" "\
Before saving, commit current file to a worktree wip ref.

The user has to add this function to `before-save-hook'.

Commit the current state of the visited file before saving the
current buffer to that file.  This backs up the same version of
the file as `backup-buffer' would, but stores the backup in the
worktree wip ref, which is also used by the various Magit Wip
modes, instead of in a backup file as `backup-buffer' would.

This function ignores the variables that affect `backup-buffer'
and can be used along-side that function, which is recommended
because this function only backs up files that are tracked in
a Git repository." nil nil)

(register-definition-prefixes "lisp/magit-wip" '("magit-"))

;;;***

;;;### (autoloads nil "lisp/magit-worktree" "magit/lisp/magit-worktree.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-worktree.el
 (autoload 'magit-worktree "magit-worktree" nil t)

(autoload 'magit-worktree-checkout "lisp/magit-worktree" "\
Checkout BRANCH in a new worktree at PATH.

\(fn PATH BRANCH)" t nil)

(autoload 'magit-worktree-branch "lisp/magit-worktree" "\
Create a new BRANCH and check it out in a new worktree at PATH.

\(fn PATH BRANCH START-POINT &optional FORCE)" t nil)

(autoload 'magit-worktree-move "lisp/magit-worktree" "\
Move WORKTREE to PATH.

\(fn WORKTREE PATH)" t nil)

(register-definition-prefixes "lisp/magit-worktree" '("magit-"))

;;;***

;;;### (autoloads nil "lua-mode" "lua-mode/lua-mode.el" (0 0 0 0))
;;; Generated autoloads from lua-mode/lua-mode.el

(autoload 'lua-mode "lua-mode" "\
Major mode for editing Lua code.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-mode))

(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(defalias 'run-lua #'lua-start-process)

(autoload 'lua-start-process "lua-mode" "\
Start a Lua process named NAME, running PROGRAM.
PROGRAM defaults to NAME, which defaults to `lua-default-application'.
When called interactively, switch to the process buffer.

\(fn &optional NAME PROGRAM STARTFILE &rest SWITCHES)" t nil)

(register-definition-prefixes "lua-mode" '("lua-"))

;;;***

;;;### (autoloads nil "markdown-mode" "markdown-mode/markdown-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from markdown-mode/markdown-mode.el

(autoload 'markdown-mode "markdown-mode" "\
Major mode for editing Markdown files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\)\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode" "\
Major mode for editing GitHub Flavored Markdown files.

\(fn)" t nil)

(autoload 'markdown-view-mode "markdown-mode" "\
Major mode for viewing Markdown content.

\(fn)" t nil)

(autoload 'gfm-view-mode "markdown-mode" "\
Major mode for viewing GitHub Flavored Markdown content.

\(fn)" t nil)

(autoload 'markdown-live-preview-mode "markdown-mode" "\
Toggle native previewing on save for a specific markdown file.

If called interactively, toggle `Markdown-Live-Preview mode'.  If
the prefix argument is positive, enable the mode, and if it is
zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "markdown-mode" '("defun-markdown-" "gfm-" "markdown"))

;;;***

;;;### (autoloads nil "mine" "mine/mine.el" (0 0 0 0))
;;; Generated autoloads from mine/mine.el

(register-definition-prefixes "mine" '("eos" "flow/send-files" "insert-time-stamp" "occur-at-point" "show-date"))

;;;***

;;;### (autoloads nil "ob-verb" "verb/ob-verb.el" (0 0 0 0))
;;; Generated autoloads from verb/ob-verb.el

(autoload 'ob-verb-response-mode "ob-verb" "\
Major mode for displaying HTTP responses with Babel.

\(fn)" t nil)

(register-definition-prefixes "ob-verb" '("ob-verb--" "org-babel-execute:verb"))

;;;***

;;;### (autoloads nil "projectile" "projectile/projectile.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from projectile/projectile.el

(autoload 'projectile-version "projectile" "\
Get the Projectile version as string.

If called interactively or if SHOW-VERSION is non-nil, show the
version in the echo area and the messages buffer.

The returned string includes both, the version from package.el
and the library version, if both a present and different.

If the version number could not be determined, signal an error,
if called interactively, or if SHOW-VERSION is non-nil, otherwise
just return nil.

\(fn &optional SHOW-VERSION)" t nil)

(autoload 'projectile-invalidate-cache "projectile" "\
Remove the current project's files from `projectile-projects-cache'.

With a prefix argument PROMPT prompts for the name of the project whose cache
to invalidate.

\(fn PROMPT)" t nil)

(autoload 'projectile-purge-file-from-cache "projectile" "\
Purge FILE from the cache of the current project.

\(fn FILE)" t nil)

(autoload 'projectile-purge-dir-from-cache "projectile" "\
Purge DIR from the cache of the current project.

\(fn DIR)" t nil)

(autoload 'projectile-cache-current-file "projectile" "\
Add the currently visited file to the cache." t nil)

(autoload 'projectile-discover-projects-in-directory "projectile" "\
Discover any projects in DIRECTORY and add them to the projectile cache.
This function is not recursive and only adds projects with roots
at the top level of DIRECTORY.

\(fn DIRECTORY)" t nil)

(autoload 'projectile-discover-projects-in-search-path "projectile" "\
Discover projects in `projectile-project-search-path'.
Invoked automatically when `projectile-mode' is enabled." t nil)

(autoload 'projectile-switch-to-buffer "projectile" "\
Switch to a project buffer." t nil)

(autoload 'projectile-switch-to-buffer-other-window "projectile" "\
Switch to a project buffer and show it in another window." t nil)

(autoload 'projectile-switch-to-buffer-other-frame "projectile" "\
Switch to a project buffer and show it in another frame." t nil)

(autoload 'projectile-display-buffer "projectile" "\
Display a project buffer in another window without selecting it." t nil)

(autoload 'projectile-project-buffers-other-buffer "projectile" "\
Switch to the most recently selected buffer project buffer.
Only buffers not visible in windows are returned." t nil)

(autoload 'projectile-multi-occur "projectile" "\
Do a `multi-occur' in the project's buffers.
With a prefix argument, show NLINES of context.

\(fn &optional NLINES)" t nil)

(autoload 'projectile-find-other-file "projectile" "\
Switch between files with the same name but different extensions.
With FLEX-MATCHING, match any file that contains the base name of current file.
Other file extensions can be customized with the variable `projectile-other-file-alist'.

\(fn &optional FLEX-MATCHING)" t nil)

(autoload 'projectile-find-other-file-other-window "projectile" "\
Switch between files with the same name but different extensions in other window.
With FLEX-MATCHING, match any file that contains the base name of current file.
Other file extensions can be customized with the variable `projectile-other-file-alist'.

\(fn &optional FLEX-MATCHING)" t nil)

(autoload 'projectile-find-other-file-other-frame "projectile" "\
Switch between files with the same name but different extensions in other frame.
With FLEX-MATCHING, match any file that contains the base name of current file.
Other file extensions can be customized with the variable `projectile-other-file-alist'.

\(fn &optional FLEX-MATCHING)" t nil)

(autoload 'projectile-find-file-dwim "projectile" "\
Jump to a project's files using completion based on context.

With a prefix arg INVALIDATE-CACHE invalidates the cache first.

If point is on a filename, Projectile first tries to search for that
file in project:

- If it finds just a file, it switches to that file instantly.  This works even
if the filename is incomplete, but there's only a single file in the current project
that matches the filename at point.  For example, if there's only a single file named
\"projectile/projectile.el\" but the current filename is \"projectile/proj\" (incomplete),
`projectile-find-file-dwim' still switches to \"projectile/projectile.el\" immediately
 because this is the only filename that matches.

- If it finds a list of files, the list is displayed for selecting.  A list of
files is displayed when a filename appears more than one in the project or the
filename at point is a prefix of more than two files in a project.  For example,
if `projectile-find-file-dwim' is executed on a filepath like \"projectile/\", it lists
the content of that directory.  If it is executed on a partial filename like
 \"projectile/a\", a list of files with character 'a' in that directory is presented.

- If it finds nothing, display a list of all files in project for selecting.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-find-file-dwim-other-window "projectile" "\
Jump to a project's files using completion based on context in other window.

With a prefix arg INVALIDATE-CACHE invalidates the cache first.

If point is on a filename, Projectile first tries to search for that
file in project:

- If it finds just a file, it switches to that file instantly.  This works even
if the filename is incomplete, but there's only a single file in the current project
that matches the filename at point.  For example, if there's only a single file named
\"projectile/projectile.el\" but the current filename is \"projectile/proj\" (incomplete),
`projectile-find-file-dwim-other-window' still switches to \"projectile/projectile.el\"
immediately because this is the only filename that matches.

- If it finds a list of files, the list is displayed for selecting.  A list of
files is displayed when a filename appears more than one in the project or the
filename at point is a prefix of more than two files in a project.  For example,
if `projectile-find-file-dwim-other-window' is executed on a filepath like \"projectile/\", it lists
the content of that directory.  If it is executed on a partial filename
like \"projectile/a\", a list of files with character 'a' in that directory
is presented.

- If it finds nothing, display a list of all files in project for selecting.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-find-file-dwim-other-frame "projectile" "\
Jump to a project's files using completion based on context in other frame.

With a prefix arg INVALIDATE-CACHE invalidates the cache first.

If point is on a filename, Projectile first tries to search for that
file in project:

- If it finds just a file, it switches to that file instantly.  This works even
if the filename is incomplete, but there's only a single file in the current project
that matches the filename at point.  For example, if there's only a single file named
\"projectile/projectile.el\" but the current filename is \"projectile/proj\" (incomplete),
`projectile-find-file-dwim-other-frame' still switches to \"projectile/projectile.el\"
immediately because this is the only filename that matches.

- If it finds a list of files, the list is displayed for selecting.  A list of
files is displayed when a filename appears more than one in the project or the
filename at point is a prefix of more than two files in a project.  For example,
if `projectile-find-file-dwim-other-frame' is executed on a filepath like \"projectile/\", it lists
the content of that directory.  If it is executed on a partial filename
like \"projectile/a\", a list of files with character 'a' in that directory
is presented.

- If it finds nothing, display a list of all files in project for selecting.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-find-file "projectile" "\
Jump to a project's file using completion.
With a prefix arg INVALIDATE-CACHE invalidates the cache first.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-find-file-other-window "projectile" "\
Jump to a project's file using completion and show it in another window.

With a prefix arg INVALIDATE-CACHE invalidates the cache first.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-find-file-other-frame "projectile" "\
Jump to a project's file using completion and show it in another frame.

With a prefix arg INVALIDATE-CACHE invalidates the cache first.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-toggle-project-read-only "projectile" "\
Toggle project read only." t nil)

(autoload 'projectile-find-dir "projectile" "\
Jump to a project's directory using completion.

With a prefix arg INVALIDATE-CACHE invalidates the cache first.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-find-dir-other-window "projectile" "\
Jump to a project's directory in other window using completion.

With a prefix arg INVALIDATE-CACHE invalidates the cache first.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-find-dir-other-frame "projectile" "\
Jump to a project's directory in other frame using completion.

With a prefix arg INVALIDATE-CACHE invalidates the cache first.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-find-test-file "projectile" "\
Jump to a project's test file using completion.

With a prefix arg INVALIDATE-CACHE invalidates the cache first.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-find-related-file-other-window "projectile" "\
Open related file in other window." t nil)

(autoload 'projectile-find-related-file-other-frame "projectile" "\
Open related file in other frame." t nil)

(autoload 'projectile-find-related-file "projectile" "\
Open related file." t nil)

(autoload 'projectile-related-files-fn-groups "projectile" "\
Generate a related-files-fn which relates as KIND for files in each of GROUPS.

\(fn KIND GROUPS)" nil nil)

(autoload 'projectile-related-files-fn-extensions "projectile" "\
Generate a related-files-fn which relates as KIND for files having EXTENSIONS.

\(fn KIND EXTENSIONS)" nil nil)

(autoload 'projectile-related-files-fn-test-with-prefix "projectile" "\
Generate a related-files-fn which relates tests and impl for files with EXTENSION based on TEST-PREFIX.

\(fn EXTENSION TEST-PREFIX)" nil nil)

(autoload 'projectile-related-files-fn-test-with-suffix "projectile" "\
Generate a related-files-fn which relates tests and impl for files with EXTENSION based on TEST-SUFFIX.

\(fn EXTENSION TEST-SUFFIX)" nil nil)

(autoload 'projectile-project-info "projectile" "\
Display info for current project." t nil)

(autoload 'projectile-find-implementation-or-test-other-window "projectile" "\
Open matching implementation or test file in other window." t nil)

(autoload 'projectile-find-implementation-or-test-other-frame "projectile" "\
Open matching implementation or test file in other frame." t nil)

(autoload 'projectile-toggle-between-implementation-and-test "projectile" "\
Toggle between an implementation file and its test file." t nil)

(autoload 'projectile-grep "projectile" "\
Perform rgrep in the project.

With a prefix ARG asks for files (globbing-aware) which to grep in.
With prefix ARG of `-' (such as `M--'), default the files (without prompt),
to `projectile-grep-default-files'.

With REGEXP given, don't query the user for a regexp.

\(fn &optional REGEXP ARG)" t nil)

(autoload 'projectile-ag "projectile" "\
Run an ag search with SEARCH-TERM in the project.

With an optional prefix argument ARG SEARCH-TERM is interpreted as a
regular expression.

\(fn SEARCH-TERM &optional ARG)" t nil)

(autoload 'projectile-ripgrep "projectile" "\
Run a Ripgrep search with `SEARCH-TERM' at current project root.

With an optional prefix argument ARG SEARCH-TERM is interpreted as a
regular expression.

\(fn SEARCH-TERM &optional ARG)" t nil)

(autoload 'projectile-regenerate-tags "projectile" "\
Regenerate the project's [e|g]tags." t nil)

(autoload 'projectile-find-tag "projectile" "\
Find tag in project." t nil)

(autoload 'projectile-run-command-in-root "projectile" "\
Invoke `execute-extended-command' in the project's root." t nil)

(autoload 'projectile-run-shell-command-in-root "projectile" "\
Invoke `shell-command' in the project's root." t nil)

(autoload 'projectile-run-async-shell-command-in-root "projectile" "\
Invoke `async-shell-command' in the project's root." t nil)

(autoload 'projectile-run-gdb "projectile" "\
Invoke `gdb' in the project's root." t nil)

(autoload 'projectile-run-shell "projectile" "\
Invoke `shell' in the project's root.

Switch to the project specific shell buffer if it already exists.

Use a prefix argument ARG to indicate creation of a new process instead.

\(fn &optional ARG)" t nil)

(autoload 'projectile-run-eshell "projectile" "\
Invoke `eshell' in the project's root.

Switch to the project specific eshell buffer if it already exists.

Use a prefix argument ARG to indicate creation of a new process instead.

\(fn &optional ARG)" t nil)

(autoload 'projectile-run-ielm "projectile" "\
Invoke `ielm' in the project's root.

Switch to the project specific ielm buffer if it already exists.

Use a prefix argument ARG to indicate creation of a new process instead.

\(fn &optional ARG)" t nil)

(autoload 'projectile-run-term "projectile" "\
Invoke `term' in the project's root.

Switch to the project specific term buffer if it already exists.

Use a prefix argument ARG to indicate creation of a new process instead.

\(fn &optional ARG)" t nil)

(autoload 'projectile-run-vterm "projectile" "\
Invoke `vterm' in the project's root.

Switch to the project specific term buffer if it already exists.

Use a prefix argument ARG to indicate creation of a new process instead.

\(fn &optional ARG)" t nil)

(autoload 'projectile-replace "projectile" "\
Replace literal string in project using non-regexp `tags-query-replace'.

With a prefix argument ARG prompts you for a directory on which
to run the replacement.

\(fn &optional ARG)" t nil)

(autoload 'projectile-replace-regexp "projectile" "\
Replace a regexp in the project using `tags-query-replace'.

With a prefix argument ARG prompts you for a directory on which
to run the replacement.

\(fn &optional ARG)" t nil)

(autoload 'projectile-kill-buffers "projectile" "\
Kill project buffers.

The buffer are killed according to the value of
`projectile-kill-buffers-filter'." t nil)

(autoload 'projectile-save-project-buffers "projectile" "\
Save all project buffers." t nil)

(autoload 'projectile-dired "projectile" "\
Open `dired' at the root of the project." t nil)

(autoload 'projectile-dired-other-window "projectile" "\
Open `dired'  at the root of the project in another window." t nil)

(autoload 'projectile-dired-other-frame "projectile" "\
Open `dired' at the root of the project in another frame." t nil)

(autoload 'projectile-vc "projectile" "\
Open `vc-dir' at the root of the project.

For git projects `magit-status-internal' is used if available.
For hg projects `monky-status' is used if available.

If PROJECT-ROOT is given, it is opened instead of the project
root directory of the current buffer file.  If interactively
called with a prefix argument, the user is prompted for a project
directory to open.

\(fn &optional PROJECT-ROOT)" t nil)

(autoload 'projectile-recentf "projectile" "\
Show a list of recently visited files in a project." t nil)

(autoload 'projectile-configure-project "projectile" "\
Run project configure command.

Normally you'll be prompted for a compilation command, unless
variable `compilation-read-command'.  You can force the prompt
with a prefix ARG.

\(fn ARG)" t nil)

(autoload 'projectile-compile-project "projectile" "\
Run project compilation command.

Normally you'll be prompted for a compilation command, unless
variable `compilation-read-command'.  You can force the prompt
with a prefix ARG.

\(fn ARG)" t nil)

(autoload 'projectile-test-project "projectile" "\
Run project test command.

Normally you'll be prompted for a compilation command, unless
variable `compilation-read-command'.  You can force the prompt
with a prefix ARG.

\(fn ARG)" t nil)

(autoload 'projectile-install-project "projectile" "\
Run project install command.

Normally you'll be prompted for a compilation command, unless
variable `compilation-read-command'.  You can force the prompt
with a prefix ARG.

\(fn ARG)" t nil)

(autoload 'projectile-package-project "projectile" "\
Run project package command.

Normally you'll be prompted for a compilation command, unless
variable `compilation-read-command'.  You can force the prompt
with a prefix ARG.

\(fn ARG)" t nil)

(autoload 'projectile-run-project "projectile" "\
Run project run command.

Normally you'll be prompted for a compilation command, unless
variable `compilation-read-command'.  You can force the prompt
with a prefix ARG.

\(fn ARG)" t nil)

(autoload 'projectile-repeat-last-command "projectile" "\
Run last projectile external command.

External commands are: `projectile-configure-project',
`projectile-compile-project', `projectile-test-project',
`projectile-install-project', `projectile-package-project',
and `projectile-run-project'.

If the prefix argument SHOW_PROMPT is non nil, the command can be edited.

\(fn SHOW-PROMPT)" t nil)

(autoload 'projectile-switch-project "projectile" "\
Switch to a project we have visited before.
Invokes the command referenced by `projectile-switch-project-action' on switch.
With a prefix ARG invokes `projectile-commander' instead of
`projectile-switch-project-action.'

\(fn &optional ARG)" t nil)

(autoload 'projectile-switch-open-project "projectile" "\
Switch to a project we have currently opened.
Invokes the command referenced by `projectile-switch-project-action' on switch.
With a prefix ARG invokes `projectile-commander' instead of
`projectile-switch-project-action.'

\(fn &optional ARG)" t nil)

(autoload 'projectile-find-file-in-directory "projectile" "\
Jump to a file in a (maybe regular) DIRECTORY.

This command will first prompt for the directory the file is in.

\(fn &optional DIRECTORY)" t nil)

(autoload 'projectile-find-file-in-known-projects "projectile" "\
Jump to a file in any of the known projects." t nil)

(autoload 'projectile-cleanup-known-projects "projectile" "\
Remove known projects that don't exist anymore." t nil)

(autoload 'projectile-clear-known-projects "projectile" "\
Clear both `projectile-known-projects' and `projectile-known-projects-file'." t nil)

(autoload 'projectile-remove-known-project "projectile" "\
Remove PROJECT from the list of known projects.

\(fn &optional PROJECT)" t nil)

(autoload 'projectile-remove-current-project-from-known-projects "projectile" "\
Remove the current project from the list of known projects." t nil)

(autoload 'projectile-add-known-project "projectile" "\
Add PROJECT-ROOT to the list of known projects.

\(fn PROJECT-ROOT)" t nil)

(autoload 'projectile-ibuffer "projectile" "\
Open an IBuffer window showing all buffers in the current project.

Let user choose another project when PROMPT-FOR-PROJECT is supplied.

\(fn PROMPT-FOR-PROJECT)" t nil)

(autoload 'projectile-commander "projectile" "\
Execute a Projectile command with a single letter.
The user is prompted for a single character indicating the action to invoke.
The `?' character describes then
available actions.

See `def-projectile-commander-method' for defining new methods." t nil)

(autoload 'projectile-browse-dirty-projects "projectile" "\
Browse dirty version controlled projects.

With a prefix argument, or if CACHED is non-nil, try to use the cached
dirty project list.

\(fn &optional CACHED)" t nil)

(autoload 'projectile-edit-dir-locals "projectile" "\
Edit or create a .dir-locals.el file of the project." t nil)

(defvar projectile-mode nil "\
Non-nil if Projectile mode is enabled.
See the `projectile-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `projectile-mode'.")

(custom-autoload 'projectile-mode "projectile" nil)

(autoload 'projectile-mode "projectile" "\
Minor mode to assist project management and navigation.

When called interactively, toggle `projectile-mode'.  With prefix
ARG, enable `projectile-mode' if ARG is positive, otherwise disable
it.

When called from Lisp, enable `projectile-mode' if ARG is omitted,
nil or positive.  If ARG is `toggle', toggle `projectile-mode'.
Otherwise behave as if called interactively.

\\{projectile-mode-map}

\(fn &optional ARG)" t nil)

(define-obsolete-function-alias 'projectile-global-mode 'projectile-mode "1.0")

(register-definition-prefixes "projectile" '("??" "compilation-find-file-projectile-find-compilation-buffer" "def-projectile-commander-method" "delete-file-projectile-remove-from-cache" "projectile-"))

;;;***

;;;### (autoloads nil "queue" "queue/queue.el" (0 0 0 0))
;;; Generated autoloads from queue/queue.el

(defalias 'make-queue 'queue-create "\
Create an empty queue data structure.")

(register-definition-prefixes "queue" '("queue"))

;;;***

;;;### (autoloads nil "rfc-docs" "rfc-docs/rfc-docs.el" (0 0 0 0))
;;; Generated autoloads from rfc-docs/rfc-docs.el

(register-definition-prefixes "rfc-docs" '("rfc-docs-"))

;;;***

;;;### (autoloads nil "rmsbolt" "rmsbolt/rmsbolt.el" (0 0 0 0))
;;; Generated autoloads from rmsbolt/rmsbolt.el

(autoload 'rmsbolt-starter "rmsbolt" "\
Setup new file based on the sample STARTER-FILE-NAME.

\(fn LANG-NAME)" t nil)

(autoload 'rmsbolt-mode "rmsbolt" "\
Toggle rmsbolt-mode.

If called interactively, toggle `Rmsbolt mode'.  If the prefix
argument is positive, enable the mode, and if it is zero or
negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

This mode is enabled both in modes to be compiled and output buffers.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "rmsbolt" '("rmsbolt-"))

;;;***

;;;### (autoloads nil "rmsbolt-java" "rmsbolt/rmsbolt-java.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from rmsbolt/rmsbolt-java.el

(register-definition-prefixes "rmsbolt-java" '("rmsbolt-java-"))

;;;***

;;;### (autoloads nil "rmsbolt-split" "rmsbolt/rmsbolt-split.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from rmsbolt/rmsbolt-split.el

(register-definition-prefixes "rmsbolt-split" '("rmsbolt-split-"))

;;;***

;;;### (autoloads nil "rsync" "rsync.el/rsync.el" (0 0 0 0))
;;; Generated autoloads from rsync.el/rsync.el

(autoload 'rsync-push "rsync" "\
The rsync push operation.

HOST Remote host identifier.
The host name can be a alises defined in ~/.ssh/config or /etc/hosts,
auth-sources interface will be provided soon.

SRC  Source directory.
DEST Destination directory.

&OPTIONAL:

USER     User identifier.
SENTINEL Function to handle process events (callback).

\(fn HOST SRC DEST &optional USER SENTINEL)" t nil)

(autoload 'rsync-pull "rsync" "\
The rsync pull operation.

HOST Remote host identifier.
The host name can be a alises defined in ~/.ssh/config or /etc/hosts,
auth-sources interface will be provided soon.

SRC  Source directory.
DEST Destination directory.

&OPTIONAL:

USER     User identifier.
SENTINEL Function to handle process events.

\(fn HOST SRC DEST &optional USER SENTINEL)" t nil)

(register-definition-prefixes "rsync" '("rsync-"))

;;;***

;;;### (autoloads nil "s" "s/s.el" (0 0 0 0))
;;; Generated autoloads from s/s.el

(register-definition-prefixes "s" '("s-"))

;;;***

;;;### (autoloads nil "slime" "slime/slime.el" (0 0 0 0))
;;; Generated autoloads from slime/slime.el

(register-definition-prefixes "slime" '("??" "?c" "?d" "?e" "?i" "?l" "?n" "?p" "?q" "?t" "?v" "def-slime-selector-method" "define-sl" "defslimefun" "inferior-lisp-program" "make-slime-" "sldb-" "slime"))

;;;***

;;;### (autoloads nil "slime-autoloads" "slime/slime-autoloads.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from slime/slime-autoloads.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "slime-autoloads" '("slime-contribs")))

;;;***

;;;### (autoloads nil "slime-tests" "slime/slime-tests.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from slime/slime-tests.el

(register-definition-prefixes "slime-tests" '("arglist" "async-eval-debugging" "break" "comp" "def-slime-test" "dis" "end-of-file" "find-definition" "flow-control" "indentation" "inspector" "inter" "locally-bound-debugger-hook" "loop-interrupt-" "macroexpand" "narrowing" "read" "report-condition-with-circular-list" "sbcl-world-lock" "sexp-at-point.1" "symbol-at-point." "traditional-recipe" "unwind-to-previous-sldb-level" "utf-8-source"))

;;;***

;;;### (autoloads nil "smtpmail-async" "emacs-async/smtpmail-async.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emacs-async/smtpmail-async.el

(register-definition-prefixes "smtpmail-async" '("async-smtpmail-"))

;;;***

;;;### (autoloads nil "transset" "mine/transset.el" (0 0 0 0))
;;; Generated autoloads from mine/transset.el

(register-definition-prefixes "transset" '("set-transparency-to-pointed-window" "transparency-bin"))

;;;***

;;;### (autoloads nil "treepy" "treepy/treepy.el" (0 0 0 0))
;;; Generated autoloads from treepy/treepy.el

(register-definition-prefixes "treepy" '("treepy-"))

;;;***

;;;### (autoloads nil "undo-tree" "undo-tree/undo-tree.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from undo-tree/undo-tree.el

(autoload 'undo-tree-mode "undo-tree" "\
Toggle undo-tree mode.
With no argument, this command toggles the mode.
A positive prefix argument turns the mode on.
A negative prefix argument turns it off.

If called interactively, toggle `Undo-Tree mode'.  If the prefix
argument is positive, enable the mode, and if it is zero or
negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

Undo-tree-mode replaces Emacs' standard undo feature with a more
powerful yet easier to use version, that treats the undo history
as what it is: a tree.

The following keys are available in `undo-tree-mode':

  \\{undo-tree-map}

Within the undo-tree visualizer, the following keys are available:

  \\{undo-tree-visualizer-mode-map}

\(fn &optional ARG)" t nil)

(put 'global-undo-tree-mode 'globalized-minor-mode t)

(defvar global-undo-tree-mode nil "\
Non-nil if Global Undo-Tree mode is enabled.
See the `global-undo-tree-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-undo-tree-mode'.")

(custom-autoload 'global-undo-tree-mode "undo-tree" nil)

(autoload 'global-undo-tree-mode "undo-tree" "\
Toggle Undo-Tree mode in all buffers.
With prefix ARG, enable Global Undo-Tree mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if ARG is
omitted or nil.

Undo-Tree mode is enabled in all buffers where
`turn-on-undo-tree-mode' would do it.

See `undo-tree-mode' for more information on Undo-Tree mode.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "undo-tree" '("*undo-tree-id-counter*" "buffer-undo-tree" "turn-on-undo-tree-mode" "undo-"))

;;;***

;;;### (autoloads nil "verb" "verb/verb.el" (0 0 0 0))
;;; Generated autoloads from verb/verb.el

(defvar verb-command-map (let ((map (make-sparse-keymap))) (define-key map (kbd "C-s") #'verb-send-request-on-point-other-window) (define-key map (kbd "C-r") #'verb-send-request-on-point-other-window-stay) (define-key map (kbd "C-m") #'verb-send-request-on-point-no-window) (define-key map (kbd "C-f") #'verb-send-request-on-point) (define-key map (kbd "C-k") #'verb-kill-all-response-buffers) (define-key map (kbd "C-e") #'verb-export-request-on-point) (define-key map (kbd "C-u") #'verb-export-request-on-point-curl) (define-key map (kbd "C-b") #'verb-export-request-on-point-verb) (define-key map (kbd "C-w") #'verb-export-request-on-point-eww) (define-key map (kbd "C-v") #'verb-set-var) map) "\
Keymap for `verb-mode' commands.
Bind this to an easy-to-reach key in Org mode in order to use Verb
comfortably.  All commands listed in this keymap automatically enable
`verb-mode' in the current buffer when used.")

(autoload 'verb-mode "verb" "\
Minor mode for organizing and making HTTP requests from Emacs.
This mode acts as an extension to Org mode.  Make sure you enable it
on buffers using Org as their major mode.

If called interactively, toggle `Verb mode'.  If the prefix
argument is positive, enable the mode, and if it is zero or
negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

See the documentation in URL `https://github.com/federicotdn/verb' for
more details on how to use it.

\(fn &optional ARG)" t nil)

(autoload 'verb-send-request-on-point-other-window "verb" "\
Send the request specified by the selected heading's text contents.
Show the results on another window and switch to it, using
`verb-send-request-on-point'.  See that function's documentation for a
description of prefix argument ARG.

\(fn &optional ARG)" t nil)

(autoload 'verb-send-request-on-point-other-window-stay "verb" "\
Send the request specified by the selected heading's text contents.
Show the results on another window but don't switch to it, using
`verb-send-request-on-point'.  See that function's documentation for a
description of prefix argument ARG.

\(fn &optional ARG)" t nil)

(autoload 'verb-send-request-on-point-no-window "verb" "\
Send the request specified by the selected heading's text contents.
Do this using `verb-send-request-on-point', but do not show the
results on any window.  See that function's documentation for a
description of prefix argument ARG.

This command is useful for cases where the request is only being sent
for its side effects.

\(fn &optional ARG)" t nil)

(autoload 'verb-send-request-on-point "verb" "\
Send the request specified by the selected heading's text contents.
After the request has been sent, return the response buffer (the
buffer where the response will be loaded into).

Note that the contents of all parent headings are considered as well;
see `verb--request-spec-from-hierarchy' to see how this is done.

The buffer containing the response is shown (or not shown) in
different ways, depending on the value of WHERE:

- `other-window': Show the response buffer on another window and
  select it.
- `stay-window': Show the response buffer on another window, but
  keep the current one selected.
- `this-window': Show the response buffer in the current window.
- `minibuffer': Show the response status on the minibuffer, but don't
  show the response buffer anywhere.
- nil: Send the request but do not show the response buffer nor the
  response status anywhere.

The response buffer won't have any contents until the HTTP response
has been received.  For all valid values of WHERE except nil, the
response status will be shown on the minibuffer when the response is
received.

If prefix argument ARG is non-nil, allow the user to quickly edit the
request before it is sent.  The changes made will not affect the
contents of the current buffer and will be discarded after the request
is sent.

The `verb-post-response-hook' hook is called after a response has been
received.

\(fn WHERE &optional ARG)" t nil)

(autoload 'verb-kill-all-response-buffers "verb" "\
Kill all response buffers, and delete their windows.
If KEEP-WINDOWS is non-nil, do not delete their respective windows.

\(fn &optional KEEP-WINDOWS)" t nil)

(autoload 'verb-export-request-on-point "verb" "\
Export the request specification on point.
Interactively, prompt the user for an export function, and call that
function with the request specification object.  See the
`verb-export-functions' variable for more details.  If called from
Lisp, use the export function under NAME.  If NAME is nil, prompt the
user anyways.

No HTTP request is sent, unless the export function does this
explicitly.  Lisp code tags are evaluated when exporting.

\(fn &optional NAME)" t nil)

(autoload 'verb-export-request-on-point-verb "verb" "\
Export request on point to verb format.
See `verb--export-to-verb' for more information." t nil)

(autoload 'verb-export-request-on-point-curl "verb" "\
Export request on point to curl format.
See `verb--export-to-curl' for more information." t nil)

(autoload 'verb-export-request-on-point-eww "verb" "\
Export request on point to EWW.
See `verb--export-to-eww' for more information." t nil)

(register-definition-prefixes "verb" '("verb-"))

;;;***

;;;### (autoloads nil "wall" "wall-el/wall.el" (0 0 0 0))
;;; Generated autoloads from wall-el/wall.el

(defvar wall-mode nil "\
Non-nil if Wall mode is enabled.
See the `wall-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `wall-mode'.")

(custom-autoload 'wall-mode "wall" nil)

(autoload 'wall-mode "wall" "\
Define a new minor mode `wall-mode'.

If called interactively, toggle `Wall mode'.  If the prefix
argument is positive, enable the mode, and if it is zero or
negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

This defines the toggle command `wall-mode' and (by default)
a control variable `wall-mode'.

Interactively with no prefix argument, it toggles the mode.
A prefix argument enables the mode if the argument is positive,
and disables it otherwise.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-wall-mode "wall" "\
Turn the minor-mode on." t nil)

(register-definition-prefixes "wall" '("turn-off-wall-mode" "wall-"))

;;;***

;;;### (autoloads nil "web-mode" "web-mode/web-mode.el" (0 0 0 0))
;;; Generated autoloads from web-mode/web-mode.el

(autoload 'web-mode "web-mode" "\
Major mode for editing web templates.

\(fn)" t nil)

(register-definition-prefixes "web-mode" '("web-mode-"))

;;;***

;;;### (autoloads nil "with-editor" "with-editor/with-editor.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from with-editor/with-editor.el

(autoload 'with-editor-export-editor "with-editor" "\
Teach subsequent commands to use current Emacs instance as editor.

Set and export the environment variable ENVVAR, by default
\"EDITOR\".  The value is automatically generated to teach
commands to use the current Emacs instance as \"the editor\".

This works in `shell-mode', `term-mode', `eshell-mode' and
`vterm'.

\(fn &optional (ENVVAR \"EDITOR\"))" t nil)

(autoload 'with-editor-export-git-editor "with-editor" "\
Like `with-editor-export-editor' but always set `$GIT_EDITOR'." t nil)

(autoload 'with-editor-export-hg-editor "with-editor" "\
Like `with-editor-export-editor' but always set `$HG_EDITOR'." t nil)

(defvar shell-command-with-editor-mode nil "\
Non-nil if Shell-Command-With-Editor mode is enabled.
See the `shell-command-with-editor-mode' command
for a description of this minor mode.")

(custom-autoload 'shell-command-with-editor-mode "with-editor" nil)

(autoload 'shell-command-with-editor-mode "with-editor" "\
Teach `shell-command' to use current Emacs instance as editor.

If called interactively, toggle `Shell-Command-With-Editor mode'.
If the prefix argument is positive, enable the mode, and if it is
zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

Teach `shell-command', and all commands that ultimately call that
command, to use the current Emacs instance as editor by executing
\"EDITOR=CLIENT COMMAND&\" instead of just \"COMMAND&\".

CLIENT is automatically generated; EDITOR=CLIENT instructs
COMMAND to use to the current Emacs instance as \"the editor\",
assuming no other variable overrides the effect of \"$EDITOR\".
CLIENT may be the path to an appropriate emacsclient executable
with arguments, or a script which also works over Tramp.

Alternatively you can use the `with-editor-async-shell-command',
which also allows the use of another variable instead of
\"EDITOR\".

\(fn &optional ARG)" t nil)

(autoload 'with-editor-async-shell-command "with-editor" "\
Like `async-shell-command' but with `$EDITOR' set.

Execute string \"ENVVAR=CLIENT COMMAND\" in an inferior shell;
display output, if any.  With a prefix argument prompt for an
environment variable, otherwise the default \"EDITOR\" variable
is used.  With a negative prefix argument additionally insert
the COMMAND's output at point.

CLIENT is automatically generated; ENVVAR=CLIENT instructs
COMMAND to use to the current Emacs instance as \"the editor\",
assuming it respects ENVVAR as an \"EDITOR\"-like variable.
CLIENT may be the path to an appropriate emacsclient executable
with arguments, or a script which also works over Tramp.

Also see `async-shell-command' and `shell-command'.

\(fn COMMAND &optional OUTPUT-BUFFER ERROR-BUFFER ENVVAR)" t nil)

(autoload 'with-editor-shell-command "with-editor" "\
Like `shell-command' or `with-editor-async-shell-command'.
If COMMAND ends with \"&\" behave like the latter,
else like the former.

\(fn COMMAND &optional OUTPUT-BUFFER ERROR-BUFFER ENVVAR)" t nil)

(register-definition-prefixes "with-editor" '("server-" "shell-command--shell-command-with-editor-mode" "start-file-process--with-editor-process-filter" "with-editor"))

;;;***

;;;### (autoloads nil "xcb" "xelb/xcb.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb" '("xcb:")))

;;;***

;;;### (autoloads nil "xcb-bigreq" "xelb/xcb-bigreq.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-bigreq.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-bigreq" '("xcb:bigreq:")))

;;;***

;;;### (autoloads nil "xcb-composite" "xelb/xcb-composite.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from xelb/xcb-composite.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-composite" '("xcb:composite:")))

;;;***

;;;### (autoloads nil "xcb-cursor" "xelb/xcb-cursor.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-cursor.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-cursor" '("xcb:cursor:-")))

;;;***

;;;### (autoloads nil "xcb-damage" "xelb/xcb-damage.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-damage.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-damage" '("xcb:damage:")))

;;;***

;;;### (autoloads nil "xcb-debug" "xelb/xcb-debug.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-debug.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-debug" '("xcb-debug:")))

;;;***

;;;### (autoloads nil "xcb-dpms" "xelb/xcb-dpms.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-dpms.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-dpms" '("xcb:dpms:")))

;;;***

;;;### (autoloads nil "xcb-dri2" "xelb/xcb-dri2.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-dri2.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-dri2" '("xcb:dri2:")))

;;;***

;;;### (autoloads nil "xcb-dri3" "xelb/xcb-dri3.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-dri3.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-dri3" '("xcb:dri3:")))

;;;***

;;;### (autoloads nil "xcb-ewmh" "xelb/xcb-ewmh.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-ewmh.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-ewmh" '("xcb:ewmh:")))

;;;***

;;;### (autoloads nil "xcb-ge" "xelb/xcb-ge.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-ge.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-ge" '("xcb:ge:")))

;;;***

;;;### (autoloads nil "xcb-glx" "xelb/xcb-glx.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-glx.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-glx" '("xcb:glx:")))

;;;***

;;;### (autoloads nil "xcb-icccm" "xelb/xcb-icccm.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-icccm.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-icccm" '("xcb:icccm:")))

;;;***

;;;### (autoloads nil "xcb-keysyms" "xelb/xcb-keysyms.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from xelb/xcb-keysyms.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-keysyms" '("xcb:keysyms:")))

;;;***

;;;### (autoloads nil "xcb-present" "xelb/xcb-present.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from xelb/xcb-present.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-present" '("xcb:present:")))

;;;***

;;;### (autoloads nil "xcb-randr" "xelb/xcb-randr.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-randr.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-randr" '("xcb:randr:")))

;;;***

;;;### (autoloads nil "xcb-record" "xelb/xcb-record.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-record.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-record" '("xcb:record:")))

;;;***

;;;### (autoloads nil "xcb-render" "xelb/xcb-render.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-render.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-render" '("xcb:render:")))

;;;***

;;;### (autoloads nil "xcb-renderutil" "xelb/xcb-renderutil.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from xelb/xcb-renderutil.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-renderutil" '("xcb:renderutil:")))

;;;***

;;;### (autoloads nil "xcb-res" "xelb/xcb-res.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-res.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-res" '("xcb:res:")))

;;;***

;;;### (autoloads nil "xcb-screensaver" "xelb/xcb-screensaver.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from xelb/xcb-screensaver.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-screensaver" '("xcb:screensaver:")))

;;;***

;;;### (autoloads nil "xcb-shape" "xelb/xcb-shape.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-shape.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-shape" '("xcb:shape:")))

;;;***

;;;### (autoloads nil "xcb-shm" "xelb/xcb-shm.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-shm.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-shm" '("xcb:shm:")))

;;;***

;;;### (autoloads nil "xcb-sync" "xelb/xcb-sync.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-sync.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-sync" '("xcb:sync:")))

;;;***

;;;### (autoloads nil "xcb-systemtray" "xelb/xcb-systemtray.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from xelb/xcb-systemtray.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-systemtray" '("xcb:")))

;;;***

;;;### (autoloads nil "xcb-types" "xelb/xcb-types.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-types.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-types" '("xcb:")))

;;;***

;;;### (autoloads nil "xcb-xc_misc" "xelb/xcb-xc_misc.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from xelb/xcb-xc_misc.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-xc_misc" '("xcb:xc_misc:")))

;;;***

;;;### (autoloads nil "xcb-xembed" "xelb/xcb-xembed.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-xembed.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-xembed" '("xcb:xembed:")))

;;;***

;;;### (autoloads nil "xcb-xevie" "xelb/xcb-xevie.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-xevie.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-xevie" '("xcb:xevie:")))

;;;***

;;;### (autoloads nil "xcb-xf86dri" "xelb/xcb-xf86dri.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from xelb/xcb-xf86dri.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-xf86dri" '("xcb:xf86dri:")))

;;;***

;;;### (autoloads nil "xcb-xf86vidmode" "xelb/xcb-xf86vidmode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from xelb/xcb-xf86vidmode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-xf86vidmode" '("xcb:xf86vidmode:")))

;;;***

;;;### (autoloads nil "xcb-xfixes" "xelb/xcb-xfixes.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-xfixes.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-xfixes" '("xcb:xfixes:")))

;;;***

;;;### (autoloads nil "xcb-xim" "xelb/xcb-xim.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-xim.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-xim" '("xim:")))

;;;***

;;;### (autoloads nil "xcb-xinerama" "xelb/xcb-xinerama.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from xelb/xcb-xinerama.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-xinerama" '("xcb:xinerama:")))

;;;***

;;;### (autoloads nil "xcb-xinput" "xelb/xcb-xinput.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-xinput.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-xinput" '("xcb:xinput:")))

;;;***

;;;### (autoloads nil "xcb-xkb" "xelb/xcb-xkb.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-xkb.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-xkb" '("xcb:xkb:")))

;;;***

;;;### (autoloads nil "xcb-xlib" "xelb/xcb-xlib.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-xlib.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-xlib" '("xlib:X")))

;;;***

;;;### (autoloads nil "xcb-xprint" "xelb/xcb-xprint.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-xprint.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-xprint" '("xcb:xprint:")))

;;;***

;;;### (autoloads nil "xcb-xproto" "xelb/xcb-xproto.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-xproto.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-xproto" '("xcb:")))

;;;***

;;;### (autoloads nil "xcb-xselinux" "xelb/xcb-xselinux.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from xelb/xcb-xselinux.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-xselinux" '("xcb:xselinux:")))

;;;***

;;;### (autoloads nil "xcb-xtest" "xelb/xcb-xtest.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-xtest.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-xtest" '("xcb:xtest:")))

;;;***

;;;### (autoloads nil "xcb-xv" "xelb/xcb-xv.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-xv.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-xv" '("xcb:xv:")))

;;;***

;;;### (autoloads nil "xcb-xvmc" "xelb/xcb-xvmc.el" (0 0 0 0))
;;; Generated autoloads from xelb/xcb-xvmc.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xcb-xvmc" '("xcb:xvmc:")))

;;;***

;;;### (autoloads nil "yaml-mode" "yaml-mode/yaml-mode.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from yaml-mode/yaml-mode.el

(register-definition-prefixes "yaml-mode" '("yaml-"))

;;;***

;;;### (autoloads nil "yasnippet" "yasnippet/yasnippet.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from yasnippet/yasnippet.el

(autoload 'yas-minor-mode "yasnippet" "\
Toggle YASnippet mode.

If called interactively, toggle `Yas minor mode'.  If the prefix
argument is positive, enable the mode, and if it is zero or
negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

When YASnippet mode is enabled, `yas-expand', normally bound to
the TAB key, expands snippets of code depending on the major
mode.

With no argument, this command toggles the mode.
positive prefix argument turns on the mode.
Negative prefix argument turns off the mode.

Key bindings:
\\{yas-minor-mode-map}

\(fn &optional ARG)" t nil)

(put 'yas-global-mode 'globalized-minor-mode t)

(defvar yas-global-mode nil "\
Non-nil if Yas-Global mode is enabled.
See the `yas-global-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `yas-global-mode'.")

(custom-autoload 'yas-global-mode "yasnippet" nil)

(autoload 'yas-global-mode "yasnippet" "\
Toggle Yas minor mode in all buffers.
With prefix ARG, enable Yas-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if ARG is omitted
or nil.

Yas minor mode is enabled in all buffers where `yas-minor-mode-on'
would do it.

See `yas-minor-mode' for more information on Yas minor mode.

\(fn &optional ARG)" t nil)
(autoload 'snippet-mode "yasnippet" "A mode for editing yasnippets" t nil)

(register-definition-prefixes "yasnippet" '("help-snippet-def" "snippet-mode-map" "yas"))

;;;***

;;;### (autoloads nil "yasnippet-debug" "yasnippet/yasnippet-debug.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from yasnippet/yasnippet-debug.el

(register-definition-prefixes "yasnippet-debug" '("yas-"))

;;;***

;;;### (autoloads nil "yasnippet-tests" "yasnippet/yasnippet-tests.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from yasnippet/yasnippet-tests.el

(register-definition-prefixes "yasnippet-tests" '("do-yas-org-native-tab-in-source-block" "yas-"))

;;;***

;;;### (autoloads nil nil ("all-the-icons/all-the-icons-faces.el"
;;;;;;  "cmake-mode-20190710.1319/cmake-mode-autoloads.el" "cmake-mode-20190710.1319/cmake-mode-pkg.el"
;;;;;;  "dash.el/dash-functional.el" "dictionary-el/dictionary-init.el"
;;;;;;  "dictionary-el/lpath.el" "emacs-async/async-pkg.el" "emms/emms-maint.el"
;;;;;;  "emms/emms-stream-info.el" "forge/forge-pkg.el" "ghub/ghub-pkg.el"
;;;;;;  "mine/battery.el" "queue/queue-autoloads.el" "queue/queue-pkg.el"
;;;;;;  "xelb/xelb.el") (0 0 0 0))

;;;***

(provide 'lisp-loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; lisp-loaddefs.el ends here
