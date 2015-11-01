(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; beginning of er's custom emacs installation file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)


;;;;;;;;;;;;;;;;;;;;;;;;;
;; display of buffer
;;;;;;;;;;;;;;;;;;;;;;;;;
(line-number-mode t)
(column-number-mode t)
(package-initialize)
(require 'btc-ticker)
(btc-ticker-mode 1)
;;set the theme for emacs
(load-theme 'deeper-blue t)
(show-paren-mode t)
;;(set-default 'truncate-lines t)

;;tiny graphical system monitor
;;(require 'symon)
;;(symon-mode)
;;(setq 'symon-linux-network-rx-monitor 0)

;;Stock Ticker
;(add-to-list 'load-path "~/.emacs.d/elpa/stock-ticker-20150204.252/stock-ticker.el")
;(require 'stock-ticker)
;(add-to-list 'stock-ticker-symbols "hdp")
;(stock-ticker-global-mode +1) 


;;;;;;;;;;;;;;;;;;;;;;;;;
;; behaviour of emacs
;;;;;;;;;;;;;;;;;;;;;;;;;
(delete-selection-mode 1)
;;emacs interactive mode
(require 'ido)
(ido-mode t)
(windmove-default-keybindings 'meta)
;; turn beep off
(setq visible-bell nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(setq visible-bell t); Flashes on error

;;Transposing frame
(require 'transpose-frame)


;;;;;;;;;;;;;;;;;;;;;;;;;
;; r
;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;
;; python
;;;;;;;;;;;;;;;;;;;;;;;;;
;;from emacs wiki set ipython as the default interpreter
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args "--pylab"
 python-shell-prompt-regexp "in \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from ipython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().completer.all_completions('''%s'''))\n")
;; if you work with python scripts using ipython
(add-hook 'isend-mode-hook 'isend-default-ipython-setup)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; latex
;;;;;;;;;;;;;;;;;;;;;;;;;
;;add latex imenu for tex documents
(require 'tex)
(add-hook 'LaTeX-load-hook 'imenu-add-menubar-index)
(add-hook 'LaTeX-mode-hook 'imenu-add-menubar-index)
(setq TeX-PDF-mode t); PDF mode (rather than DVI-mode)

;;(add-hook 'TeX-mode-hook 'flyspell-mode); Enable Flyspell mode for TeX modes such as AUCTeX. Highlights all misspelled words.


;;latex preview pane
(add-hook 'LaTeX-mode-hook 'latex-preview-pane-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; ess
;;;;;;;;;;;;;;;;;;;;;;;;;
;;this code points to the julia install file in order to work with ess
;;(setq inferior-julia-program-name "/home/eroche/julia/usr/bin/julia-basic")
					;stop ess toggling underscore which is really annoying in r
(require 'ess-site)
(ess-toggle-underscore nil)
(setq ess-ask-for-ess-directory nil)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; other
;;;;;;;;;;;;;;;;;;;;;;;;;
;;spell checking
;;you need to install the british dictionary on the os
;;or else the spell checking wont work as it refers to the local
;;and a file does not exist for ireland
(setq ispell-dictionary "british")

;;(shell)

;;Add hook that creates a directory if it does not exist when trying to save a file
(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (and (not (file-exists-p dir))
                           (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
                 (when (y-or-n-p (format "Create directory?: %s " dir)) (make-directory dir t)))))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; old code not used
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; sample simple set key
;;(global-set-key "\c-xw" 'what-line)
;;useful package installation/management code
;;(require 'package)
;;(package-initialize)
;; add the original emacs lisp package archive
;;(add-to-list 'package-archives
;;     '("elpa" . "http://tromey.com/elpa/"))
;;(add-to-list 'package-archives
;;   '("melpa" . "http://melpa.milkbox.net/packages/"))
;; add the user-contributed repository
;;(add-to-list 'package-archives
;;             '("marmalade" . "http://marmalade-repo.org/packages/"))
;;(package-refresh-contents)
;;(defun install-if-needed (package)
;;  (unless (package-installed-p package)
;;    (package-install package)))

;; make more packages available with the package installer
;;(setq to-install
;;      '(python-mode magit yasnippet jedi auto-complete autopair find-file-in-repository))
;;(mapc 'install-if-needed to-install)





;;(require 'ido-vertical-mode)
;;(ido-mode 1)
;;(ido-vertical-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;
;customise the calendar
;;;;;;;;;;;;;;;;;;;;;;;
;set location for calendar
;; (setq calendar-latitude 53.3478)
;; (setq calendar-longitude -6.2597)
;; (setq calendar-location-name "dublin, ireland")

;; (setq  holiday-ireland-holidays 
;;        '((holiday-float 5 1 1 "may day")
;; 	 (holiday-fixed 3 17  "st patricks day")
;;          (holiday-float 6 1 1 "june bank holiday")
;;          (holiday-float 8 1 1 "august bank holiday")
;;          (holiday-float 10 1 -1 "october bank holiday")
;;          (holiday-fixed 12 26 "st. stephen's day")))

;;     (add-hook 'calendar-load-hook
;;               (lambda ()
;;                 (calendar-set-date-style 'european)))

;; ;;(setq mark-diary-entries-in-calendar t)


;; ;;only show holidays in the calendar as defined as holiday-ireland-holidays, we could add more holiday lists to this list.
;; (setq calendar-holidays
;;       (append holiday-ireland-holidays))

;; (setq calendar-holidays
;;       (append holiday-ireland-holidays
;; 	      holiday-other-holidays))


;; (setq holiday-ireland-holidays t) 
;; (setq holiday-hebrew-holidays nil) 
;; (setq holiday-other-holidays nil) 
;; (setq holiday-islamic-holidays nil) 
;(setq holiday-bahá'í-holidays nil) 

;;(add-hook 'calendar-today-visible-hook 'calendar-mark-today)

;; this displays both the calendar and diary windows whenever you start emacs. 
;;(setq view-diary-entries-initially t)
;;(calendar)

;;(display-time)
;; (add-hook 'diary-hook 'appt-make-list)
;; (diary 0)


;; ;julia and r use ess as to interact with the interpreter



;;disable theme
;;(disable-theme 'wombat)

;; -------------------- extra nice things for emacs --------------------
;; use shift to move around windows
					;(windmove-default-keybindings 'shift)
;; use ctrl key to switch between open emacs windows









;;to do get this working ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(defun my-ess-start-r ()
;;  (interactive)
;;   (if (not (member "*r*" (mapcar (function buffer-name) (buffer-list))))
;;       (progn
;;         (delete-other-windows)
;;         (setq w1 (selected-window))
;;         (setq w1name (buffer-name))
;;         (setq w2 (split-window-horizontally w1 nil t))
;;         (r)
;;         (set-window-buffer w2 "*r*")
;;         (set-window-buffer w1 w1name)))
;; )


;;set up python as an ide

;;load andrea crottis custom config file to turn emacs into a python ide
;;(load-file "~/.emacs.d/pythonconfig.er.el")




;; if you work with shell scripts
;;(add-hook 'isend-mode-hook 'isend-default-shell-setup)

;; if you work with python scripts using the default python interpreter
;;(add-hook 'isend-mode-hook 'isend-default-python-setup)




;get ram stats
;; (add-to-list 'load-path "./.emacs.d/mode-line-stats-master/")

;; (require 'mode-line-stats)
;; (mode-line-stats-mode)

;; ;;(setq mls-modules '(battery cpu disk memory))

;; (setq mls-cpu-settings
;;       '((:formats
;; 	 ((:primary "&a{c}")
;; 	  (:secondary "cpu[%c0{%%},%c1{%%}]")
;; 	  (:monitor "&a")))
;; 	(:levels
;; 	 (("%a" ((90.0 "crit")
;; 		 (50.0 "warn")
;; 		 (0.0 "norm")))
;; 	  ("%c0" ((90.0 "crit")
;; 		  (50.0 "warn")
;; 		  (0.0 "norm")))
;; 	  ("%c1" ((90.0 "crit")
;; 		  (50.0 "warn")
;; 		  (0.0 "norm")))))))



;;(require 'mls-cpu)
;(setq cpu-usage-update-interval 1)
;(setq cpu-usage-format "average: %a cpu0: %c0 cpu1: %c1")
;(cpu-usage-start)


