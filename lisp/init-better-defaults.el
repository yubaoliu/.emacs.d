(setq ring-bell-function 'ignore)

;show line number
(global-linum-mode t)

(global-auto-revert-mode t)

;;abbrev mode
(abbrev-mode t)
;;press "space" or "RET" to autocomplete
(define-abbrev-table 'global-abbrev-table '(
					    ;;signature
					    ("yubao" "YubaoLiu")
					    ("8ms" "Microsoft")
					    ))
;;add delete selection mode
(delete-selection-mode t)

;;disable auto save
(setq auto-save-default nil)
;disable auto backup file
(setq make-backup-files nil)


(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)

;;lisp config
(add-hook 'emacs-lisp-mode 'show-paren-mode)

;;; auto-complete
;Enable  auto-complete
(require 'auto-complete-config)
(ac-config-default)
(require 'auto-complete)
(global-auto-complete-mode t)


;;start yasnippet
(require 'yasnippet)
(yas-global-mode 1)


;;let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
(add-to-list 'achead:includedirectories "/usr/lib/gcc/x86_64-linux-gnu/6/include"))

;;now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)


;; start flymake-google-init()
;; let's define a function for flymake initialization
;;cpplint is required
;;> sudo pip search cpplint
;;>sudo pip install cpplint
(defun my:flymake-google-init ()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
  (flymake-google-cpplint-load)
  )

;;turn on semantic
(semantic-mode 1)
;;let's deinfe a function which adds semantics as a suggestion backend to auto complete and hook this funciton to c-mode-common-hook
(defun my:add-semantic-to-autocomplete ()
  (add-to-list 'ac-sources 'ac-source-semantic)
  )
(add-hook 'c-mode-hook 'my:add-semantic-to-autocomplete)

;;turn on ede mode
(global-ede-mode 1)
;;you can use system-include-path for setting up the system header file locations, turn on automatic reparsing of open buffers in semantic
(global-semantic-idle-scheduler-mode 1)

;;start eide
;(eide-start)


;;config hungry-delete mode
(require 'hungry-delete)
(global-hungry-delete-mode)


(provide 'init-better-defaults)