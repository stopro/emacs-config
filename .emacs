;; Set the frame title
;; %b is the name of the buffer
;; %+ indicates the state of the buffer (*-modified; %-readonly)
;; %f is the file name
(setq frame-title-format (concat invocation-name "@" system-name ": %b %+%+ %f"))

;; -*- mode: lisp-interaction; coding: utf-8; -*-
(set-default-font "Courier New:pixelsize=14")
(set-fontset-font (frame-parameter nil 'font)
		  'han (font-spec :family "SimSun" :size 20))
(set-fontset-font (frame-parameter nil 'font)
		  'symbol (font-spec :family "SimSun" :size 20))
(set-fontset-font (frame-parameter nil 'font)
		  'cjk-misc (font-spec :family "SimSun" :size 20))
(set-fontset-font (frame-parameter nil 'font)
		  'bopomofo (font-spec :family "SimSun" :size 20))
;; scroll smooth
(setq scroll-conservatively 10)
(setq scroll-margin 7)

;; show line number at left margin
(global-linum-mode 1)
;; show column number
(column-number-mode 1)

;; hot keys definition
(global-set-key "\C-l" 'goto-line)

;; auto fill column width
(setq-default fill-column 120)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; auto save and backupt to C:/temp/
(setq backup-directory-alist
      `((".*" . "C:/temp")))
(setq auto-save-file-name-transforms
      `((".*" "c:/temp" t)))

(defalias 'yes-or-no-p 'y-or-n-p)

;;
;; set windows environment
;;

(when (string-equal system-type "windows-nt")
  (progn
    (setenv "PATH"
	    (concat
	     "C:/cygwin/bin/" ";"
	     "C:/Python33" ";"
	     "C:/Python33/Lib" ";"
	     "C:/WINDOWS/system32" ";"
	     "C:/WINDOWS" ";"
	     "D:/workspace/devt/apache-ant-1.7.1/bin" ";"
	     "C:/myProgramFiles/Java/jdk1.6.0_17/bin" ";"
	     "C:/Program Files/TortoiseSVN/bin" ";"
	     "D:/workspace/devt/apache-maven-2.2.1/bin" ";"
	     "C:/myProgramFiles/MySQL/MySQL Server 5.1/bin" ";"
	     "E:/workspace/dev/google/gwt-2.0.3" ";"
	     "C:/Program Files/Subversion/bin" ";"
	     "C:/Program Files/CVSNT/" ";"
	     "C:/myProgramFiles/Google/google_appengine/" ";"
	     "C:/Program Files/Aspell/bin" ";"
	     "C:/myProgramFiles/global/bin"
	     )
	    )
    (setq exec-path
	  '(
	    "C:/cygwin/bin/" ";"
	    "C:/Python33/" ";"
	    "C:/myProgramFiles/Java/jdk1.6.0_17/bin" ";"
	    "C:/myProgramFiles/global/bin" ";"
	    "C:/Program Files/Aspell/bin"
	    )
	  )
    )
  )

;;
;; ================ GLOBAL ================
;;
(autoload 'gtags-mode "gtags" "" t)
(setq c-mode-hook
      '(lambda ()
	 (gtags-mode 1)))
;; set hot keys for gtags
(global-set-key (kbd "C-c C-v g") 'gtags-find-tag)
(global-set-key (kbd "C-c C-v r") 'gtags-find-rtag)
(global-set-key (kbd "C-c C-v s") 'gtags-find-symbol)
(global-set-key (kbd "C-c C-x C-f") 'gtags-find-file)

;; 
;; =================== Program Modes ================
;;

;; 
(add-to-list 'load-path "~/.emacs.d/site-lisp/miscellaneous/")

;;
;; ActionScript mode
(add-to-list 'auto-mode-alist '("\\.as[123]?$" . actionscript-mode)) 


;; XML mode
(add-to-list 'auto-mode-alist '("\\.xml\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.wsdl\\'" . nxml-mode))


;; 
;; ================ ELIB ================
;; 
(add-to-list 'load-path "~/.emacs.d/site-lisp/elib-1.0/")


;; 
;; ================ CEDET ================
;; 
(add-to-list 'load-path "~/.emacs.d/site-lisp/cedet-1.1/eieio")
(add-to-list 'load-path "~/.emacs.d/site-lisp/cedet-1.1/semantic/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/cedet-1.1/speedbar/")
(load-file "~/.emacs.d/site-lisp/cedet-1.1/common/cedet.el")
(global-ede-mode 1)			;enable project management system
(semantic-load-enable-code-helpers)	;enable prototype help and smart completion
(global-srecode-minor-mode 1)		;enable template insertion menu

;; (add-to-list 'load-path "~/.emacs.d/site-lisp/cedet-1.1/common/")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/cedet-1.1/contrib/")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/cedet-1.1/eieio/")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/cedet-1.1/semantic/")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/cedet-1.1/speedbar/")


(add-to-list 'load-path "~/.emacs.d/site-lisp/jdee-2.4.1/lisp/")
(setq jde-help-remote-file-exists-function '("beanshell"))
(autoload 'jde-mode "jde" "JDE mode" t)
(setq auto-mode-alist
      (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))
(setq jde-web-browser "firefox")
;; (setq jde-doc-dir "")


;;
;; ================ ECB ================
;;
(add-to-list 'load-path "~/.emacs.d/site-lisp/ecb-2.40/")
(require 'ecb)
(require 'ecb-autoloads)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(ecb-options-version "2.40"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;
;; Web Mode
(add-to-list 'load-path "~/.emacs.d/site-lisp/nxhtml/")
(load "autostart.el")

;; Workaround the annoying warnings:
;; Warning (mumamo-per-buffer-local-vars):
;; Already 'permanent-local t: buffer-file-name
(when
    (and
     (>= emacs-major-version 24)
     (>= emacs-minor-version 2))
  (eval-after-load "mumamo"
    '(setq mumamo-per-buffer-local-vars
       (delq 'buffer-file-name mumamo-per-buffer-local-vars))))
;;
;; ================ Python ================
;;
;;(add-to-list 'load-path "~/.emacs.d/site-lisp/python-mode/")
;;(autoload 'python-mode "python-mode" "Python Mode." t)
;;(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;;(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(setq pdb-path ' C:/Python33/Lib/pdb.py
      gud-pdb-command-name (symbol-name pdb-path))

;; http://lists.gnu.org/archive/html/help-gnu-emacs/2003-10/msg00577.html
(defadvice pdb (before gud-query-cmdline activate)
  "Provide a better default command line when called interactively."
  (interactive
   (list (gud-query-cmdline pdb-path
			    (file-name-nondirectory buffer-file-name)))))
;;
;; ================ Groovy ================
;;
;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(add-to-list 'load-path "~/.emacs.d/site-lisp/groovy/")
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))

;;
;; ================ Puppet ================
(autoload 'puppet-mode "puppet-mode.el" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))



;;
;; ================ Miscellenous ================
;; 
(setq-default ispell-program-name "aspell")
