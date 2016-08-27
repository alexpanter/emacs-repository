(provide 'setup-convenience)

;; GROUP: Convenience -> Revert


;; update any change made on file to the current buffer
(global-auto-revert-mode)


;; GROUP: Convenience -> Hippe Expand
;; hippe-expand is a better version of dabbrev-expand.
;; While dabbrev-expand searches for words you already typed in current
;; buffer and other buffers, hippe-expand includes for sources,
;; such as filenames, kill ring...
(global-set-key (kbd "M-/") 'hippe-expand) ;; replace dabbrev-expand
(setq
 hippe-expand-try-functions-list
 '(try-expand-dabbrev ;; Try to expand word "dynamically", searching the current buffer
   try-expand-dabbrev-all-buffers ;; Try to expand word "dynamically", searching all other buffers.
   try-expand-dabbrev-from-kill ;; Try to expand word "dynamically", searching the kill ring.
   try-complete-file-name-partially ;; Try to complete text as a file name, as many characters as unique.
   try-complete-file-name ;; Try to complete text as a file name.
   try-expand-all-abbrevs ;; Try to expand word before point according to all abbrev tables.
   try-expand-list ;; Try to complete the current line to an entire line in the buffer
   try-expand-line ;; Try to complete the current line to an entire line in the buffer.
   try-complete-lisp-symbol-partially ;; Try to complete as an Emacs Lisp symbol, as many characters as unique.
   try-complete-lisp-symbol ;; Try to complete word as an Emacs Lisp symbol.
   ))


;; GROUP: Convenience -> HL Line
(global-hl-line-mode) ;; toggle line highlighting in all buffers


;; GROUP: Convenience -> Ibuffer
(setq ibuffer-use-other-window t) ;; always display ibuffer in another window


;; GROUP: Convenience -> Linum
;; enable only in programming modes
(add-hook 'prog-mode 'linum-mode
          (setq-default linum-format "%d "))


;; GROUP: Convenience -> Whitespace
;; whenever you create useless whitespace, the whitespace is highlighted
(add-hook 'prog-mode-hook
          (lambda ()
            (interactive)
            (setq show-trailing-whitespace 1)))

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)


;; GROUP: Convenience -> windmove
;; easier window navigation
;; press S-{left,right,up,down} to switch window
(windmove-default-keybindings)  ; causes problems with shift used to mark text



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: workgroups2               ;;
;;                                    ;;
;; GROUP: Convenience -> Workgroups   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'workgroups2)
(workgroups-mode 1)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: company              ;;
;;                               ;;
;; GROUP: Convenience -> Company ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'after-init-hook 'global-company-mode)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package: expand-region                       ;;
;;                                              ;;
;; GROUP: Convenience -> Abbreviation -> Expand ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'expand-region)
(global-set-key (kbd "M-m") 'er/expand-region)


;; ibuffer-vc - package to show version control system status
;; in the ibuffer.
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))

(setq ibuffer-formats
      '((mark modified read-only vc-status-mini " "
              (name 18 18 :left :elide)
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " "
              (vc-status 16 16 :left)
              " "
              filename-and-process)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGES: projectile              ;;
;;                                   ;;
;; GROUP: Convenience -> Projectile  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; project interaction library for Emacs.
;; git-projects are considered projectile projects by default.
;; a project can be marked as projectile-project by adding an
;; empty .projectile file in the projects root folder.
;; see "https://github.com/bbatsov/projectile" for more info.
(projectile-global-mode)




