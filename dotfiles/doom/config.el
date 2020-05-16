;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(map! :leader "SPC" #'execute-extended-command)
(map! :leader :desc "open todo" "ot" (lambda () (interactive) (find-file "~/org/todo.org")))
(map! :leader :desc "search dir" "/" #'counsel-ag)
(map! :leader :desc "narrow toggle" "on" #'org-toggle-narrow-to-subtree)
;;(map! :localleader :desc "sort" "s" #'org-sort)

(global-set-key (kbd "M-c") 'shell)

(global-set-key (kbd "M-n") 'evil-mc-make-and-goto-next-match)
(global-set-key (kbd "C-L") 'evil-mc-make-all-cursors)

(add-to-list 'org-modules 'org-checklist)

(after! org
  (setq org-capture-templates
        '(("p" "journal plan" entry
           (file+olp+datetree +org-capture-journal-file)
           "* %U\n** plan [/]\n- [ ] %?" :prepend t)
          ("j" "journal entry" entry
           (file+olp+datetree +org-capture-journal-file)
           "* %U\n%?" :prepend t)
          ("t" "todo" entry
           (file+headline +org-capture-todo-file "inbox")
           "* TODO %?")
          ("c" "check with everyone" entry
           (file+headline +org-capture-todo-file "check with everyone")
           "* TODO %? [/]\n- [ ] Adan\n- [ ] Axel\n- [ ] Ben\n- [ ] Brian\n- [ ] Igor\n- [ ] Jakob\n- [ ] Konrad\n- [ ] Leon\n- [ ] Nikita\n- [ ] Oskar\n- [ ] Rasmus\n- [ ] Rowan\n- [ ] Sebastian\n- [ ] Xan")
          )
        )
  (setq org-todo-keywords
        '((sequence
           "TODO(t)"       ; A task that needs doing & is ready to do
           "HOLD(h)"       ; This task is paused/on hold because of me
           "OUTS(o)"       ; outsource this task
           "WAIT(w)"       ; Something external is holding up this task
           "|"
           "DONE(d)"       ; Task successfully completed
           "CANCELLED(c)") ; Task was cancelled, aborted or is no longer applicable
          (sequence
           "[ ](T)"        ; A task that needs doing
           "[-](S)"        ; Task is in progress
           "[?](W)"        ; Task is being held up or paused
           "|"
           "[X](D)"))      ; Task was completed
        org-todo-keyword-faces
        '(("[-]"  . +org-todo-active)
          ("[?]"  . +org-todo-onhold)
          ("HOLD" . +org-todo-onhold)
          ("WAIT" . +org-todo-onhold)))
  (setq org-tag-alist
        '(("emacs" . ?e) ("bachir" . ?b) ("jan" . ?j) ("cedric" . ?c) ("nolan" . ?n)))
  (setq org-log-into-drawer t)
)

(setq calendar-latitude 51.7)
(setq calendar-longitude 14.6)

(defun save-all ()
    (interactive)
    (save-some-buffers t))

(add-hook 'focus-out-hook 'save-all)

(setq ispell-program-name "aspell")

(defun my-save-word ()
  (interactive)
  (let ((current-location (point))
         (word (flyspell-get-word)))
    (when (consp word)
      (flyspell-do-correct 'save nil (car word) current-location (cadr word) (caddr word) current-location))))

(map! :leader :desc "save-word" "sw" #'my-save-word)

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Riccardo Varenna"
      user-mail-address "riccardovarenna@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "consolas" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
