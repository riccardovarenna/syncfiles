;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(map! :leader "SPC" #'execute-extended-command)
(map! :leader :desc "open todo" "ot" (lambda () (interactive) (find-file "~/org/todo.org")))
(map! :leader :desc "open potential_index" "op" (lambda () (interactive) (find-file "~/vimwiki/potential_index.org")))
(map! :leader :desc "search dir" "/" #'counsel-ag)
(map! :leader :desc "narrow toggle" "on" #'org-toggle-narrow-to-subtree)
(map! :leader :desc "set timer" "tt" #'org-timer-set-timer)
(map! :leader :desc "open all links" "oal" #'link-hint-open-all-links)
(map! :leader :desc "open all links" "ol" #'org-agenda-open-link)

(setq confirm-kill-emacs nil)

(global-set-key (kbd "M-c") 'shell)
(setq-default explicit-shell-file-name "C:\\Program Files\\Git\\bin\\bash")

(defun yt-dl-it (url)
  "Downloads the URL in an async shell"
  (let ((default-directory "~/Downloads"))
    (async-shell-command (format "youtube-dl %s" url))))

(defun elfeed-youtube-dl (&optional use-generic-p)
  "Youtube-DL link"
  (interactive "P")
  (let ((entries (elfeed-search-selected)))
    (cl-loop for entry in entries
             do (elfeed-untag entry 'unread)
             when (elfeed-entry-link entry)
             do (yt-dl-it it))
    (mapc #'elfeed-search-update-entry entries)
    (unless (use-region-p) (forward-line))))

(map! :leader :desc "save-media" "sM" #'elfeed-youtube-dl)


(global-set-key (kbd "M-n") 'evil-mc-make-and-goto-next-match)
(global-set-key (kbd "M-N") 'evil-mc-make-cursor-in-visual-selection-beg)

(add-to-list 'org-modules 'org-checklist)

(after! elfeed
  (setq elfeed-enclosure-default-dir "~\\Downloads\\")
)

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
           "* TODO %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
          ("c" "check with everyone" entry
           (file+headline +org-capture-todo-file "check with everyone")
           "* TODO %? [/]\n- [ ] Adan\n- [ ] Axel\n- [ ] Ben\n- [ ] Brian\n- [ ] Igor\n- [ ] Jakob\n- [ ] Konrad\n- [ ] Leon\n- [ ] Nikita\n- [ ] Oskar\n- [ ] Rasmus\n- [ ] Rowan\n- [ ] Sebastian\n- [ ] Xan")
          )
        )

  (setq org-roam-capture-templates
        '(("d" "default" plain (function org-roam--capture-get-point)
                "%?"
                :file-name "${title}" ;old default "%<%Y%m%d%H%M%S>-${slug}"
                :head "#+title: ${title}\n"
                :unnarrowed t)
          ("b" "book" plain (function org-roam--capture-get-point)
                :file-name "books/${title}"
                :head "#+title: ${title}\n* Author\n%?\n* Rating\n* The book in 3 sentences\n1."
                :unnarrowed t)
          ("g" "goal" plain (function org-roam--capture-get-point)
                :file-name "goal/${title}"
                :head "#+title: ${title}\n* Dream\n%?\n* Why\n* Smart Goal\n* What is the habit to achieve this\n* How surprised would I be if I fail\n* Top 3 Reasons for failure\n1.\n* Who can help\n* How can I stack the deck to succeed\n* action [/]\n- [ ] "
                :unnarrowed t)
          ("o" "OKRs" plain (function org-roam--capture-get-point)
                :file-name "okrs/${title}"
                :head "#+title: ${title}\n* Objective\n%?\n* Key Results\n1."
                :unnarrowed t)
        )
  )

  (setq org-todo-keywords
        '((sequence
           "TODO(t!)"       ; A task that needs doing & is ready to do
           "WAIT(w!)"       ; Something external is holding up this task
           "HOLD(h!)"       ; This task is paused/on hold because of me
           "OUTS(o!)"       ; outsource this task
           "|"
           "DONE(d!)"       ; Task successfully completed
           "CANCELLED(c@)")) ; Task was cancelled, aborted or is no longer applicable
        org-todo-keyword-faces
        '(("[-]"  . +org-todo-active)
          ("[?]"  . +org-todo-onhold)
          ("HOLD" . +org-todo-onhold)
          ("WAIT" . +org-todo-onhold)))
  (setq org-tag-alist
        '(("check_with_people" . ?c) ("review_evening" . ?e) ("family" . ?f) ("health" . ?h) ("programming" . ?p) ("review_morning" . ?m)))
  (setq org-log-into-drawer t)
  (setq org-agenda-show-future-repeats nil)
  ;(setq org-superstar-headline-bullets-list '("Ⅰ" "Ⅱ" "Ⅲ" "Ⅳ" "Ⅴ" "Ⅵ" "Ⅶ" "Ⅷ" "Ⅸ" "Ⅹ"))
)

;; (defun my/org-refile (file headline &optional arg)
;;     "Refile to a specific heading in a file."
;;     (let ((pos (save-excursion
;;                  (find-file file)
;;                  (org-find-exact-headline-in-buffer headline))))
;;       (org-refile arg nil (list headline file nil pos)))
;;     (switch-to-buffer (current-buffer)))

;; (defun my/move-auto-tasks-to-inbox ()
;;     "Refiles all late auto scheduled tasks to the Inbox."
;;     (let ((scope (list "~/org/todo.org")))
;;       (org-map-entries (lambda ()
;;                          (when (my/org-missed-auto-p)
;;                            (my/org-refile "~/org/todo.org" "Inbox"))
;;                          ) nil scope)
;;       (find-file-noselect "~/org/todo.org")
;;       (save-buffer)))

;;https://github.com/alphapapa/org-super-agenda
;;https://github.com/alphapapa/org-super-agenda/blob/master/examples.org

;; (after! evil-org-agenda-mode-map
;;   (setq org-super-agenda-header-map (copy-keymap evil-org-agenda-mode-map)) ;;use evil map in super agenda
;; )
(map! :map org-super-agenda-header-map
        "j" #'org-agenda-next-line
        "k" #'org-agenda-previous-line
        :map org-agenda-keymap
        "k" #'org-agenda-previous-line
        "j" #'org-agenda-next-line
)

(use-package! org-super-agenda
        :after org-agenda
        :config
        (setq org-super-agenda-groups '(
                                ;;(:auto-tags t)
                                (:name "deadlines"
                                 :order 0
                                 :deadline t)
                                (:name "family"
                                 :order 1
                                 :tag "family")
                                (:name "review morning"
                                 :order 2
                                 :tag "review_morning")
                                (:name "health"
                                 :order 3
                                 :tag "health")
                                (:name "check with people"
                                 :order 4
                                 :tag "check_with_people")
                                (:name "review evening"
                                 :order 5
                                 :tag "review_evening")
                                (:name "programming"
                                 :order 6
                                 :tag "programming")
                                )
        )
        (setq org-agenda-scheduled-leaders '("" "Sched.%2dx: "))
        (setq org-agenda-hide-tags-regexp ".*")
        (setq org-agenda-prefix-format "  %t %s")
        (org-super-agenda-mode)
)

(setq org-roam-directory "~/org/roam")


(setq calendar-latitude 51.7)
(setq calendar-longitude 14.6)

(map! :i "C-i" #'flyspell-auto-correct-word)

(defun save-all ()
    (interactive)
    (save-some-buffers t))

(add-hook 'focus-out-hook 'save-all)

(setq ispell-program-name "aspell")

(setq ispell-personal-dictionary "C:\\Users\\Riccardo\\.aspell.en.pws")

(defun my-save-word ()
        (interactive)
        (let ((current-location (point))
        (word (flyspell-get-word)))
        (when (consp word)
        (flyspell-do-correct 'save nil (car word) current-location (cadr word) (caddr word) current-location))))

(map! :leader :desc "save-word" "sw" #'my-save-word)

(defun team/regex-builder-with-region ()
  "Copy region into a temp file and start regex builder there"
  (interactive)
  (let ((str (region-str)))
    (find-file (team-create-temp-file-on-region))
    (delete-other-windows)
    (regexp-builder)
    (with-current-buffer
        (get-buffer reb-buffer)
      (insert str))))


;;archive into subtree
;;(defadvice org-archive-subtree (around my-org-archive-subtree activate)
;;  (let ((org-archive-location
;;         (if (save-excursion (org-back-to-heading)
;;                             (> (org-outline-level) 1))
;;             (concat (car (split-string org-archive-location "::"))
;;                     "::* "
;;                     (car (org-get-outline-path)))
;;           org-archive-location)))
;;    ad-do-it))

;;makes magit faster, but removes some of the info
;; (use-package magit
;;   :ensure t
;;   :bind ("C-c g" . magit-status)
;;   :custom
;;   (magit-git-executable "C:\\Program Files\\Git\\bin\\git")
;;   :init
;;   (use-package with-editor :ensure t)
;;   :config
;;   (remove-hook 'magit-status-sections-hook 'magit-insert-tags-header)
;;   (remove-hook 'magit-status-sections-hook 'magit-insert-status-headers)
;;   (remove-hook 'magit-status-sections-hook 'magit-insert-unpushed-to-pushremote)
;;   (remove-hook 'magit-status-sections-hook 'magit-insert-unpulled-from-pushremote)
;;   (remove-hook 'magit-status-sections-hook 'magit-insert-unpulled-from-upstream)
;;   (remove-hook 'magit-status-sections-hook 'magit-insert-unpushed-to-upstream-or-recent))

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
(setq doom-font (font-spec :family "Iosevka" :size 14)
      doom-big-font (font-spec :family "Iosevka" :size 20)
      doom-variable-pitch-font (font-spec :family "Iosevka Etoile" :size 12)
      doom-font-increment 1)

(setq doom-theme 'doom-nebula
      fancy-splash-image (concat doom-private-dir "themes/nebula.png"))
;;(setq doom-font (font-spec :family "Fira Code" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

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

(setq elfeed-feeds
   '("https://feeds.simplecast.com/wgl4xEgL"
     "https://blog.jetbrains.com"
     "https://www.youtube.com/feeds/videos.xml?channel_id=UCsXVk37bltHxD1rDPwtNM8Q"
     "https://www.youtube.com/playlist?list=UUxkMDXQ5qzYOgXPRnOBrp1w"
     "https://www.youtube.com/feeds/videos.xml?channel_id=UCiSC9gerE3Ql5Xt-Z51OD2w"
     "https://www.youtube.com/feeds/videos.xml?channel_id=UC-9C9d1qDDzA2jdH53vSIuA"
     "https://www.youtube.com/feeds/videos.xml?channel_id=UCMsNS10PzxzEayT7UHS4p6g"
     "https://www.youtube.com/feeds/videos.xml?channel_id=UC8THb_fnOptyVgpi3xuCd-A"
     "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA"
     "https://www.youtube.com/feeds/videos.xml?channel_id=UCkjsXZlc-5PyW5xAPlUmw3w"
     "https://www.youtube.com/feeds/videos.xml?channel_id=UC4rZq6S7sV6gljt_4vjdXIw"
     "https://www.youtube.com/feeds/videos.xml?channel_id=UCtXuWXsd7TYXwX2ZNLXfojg"
     "https://www.reddit.com/r/emacs/.rss"
     "https://www.reddit.com/r/orgmode/.rss"
     "https://www.techmeme.com/feed.xml"
     "https://hnrss.org/frontpage"
     "http://feeds.wnyc.org/moreperfect"
     "http://feeds.feedburner.com/JupiterBroadcasting"
     "http://feeds.feedburner.com/DarknetDiaries"
     "http://ubuntupodcast.org/feed/podcast"
     "http://podcast.theschmidtshow.com/rss"
     "https://feeds.megaphone.fm/KM4602122913"
     "http://www.jupiterbroadcasting.com/feeds/unfilterMP3.xml"
     "https://feeds.hackablepodcast.com/hackable"
     "https://pinecast.com/feed/emacscast"
     "http://feeds.wnyc.org/radiolab"
     "http://freecodecamp.libsyn.com/rss"
     "https://thenew.show/feed/podcast"
     "http://criticalrolepodcast.geekandsundry.com/feed.xml"
     "http://feeds.soundcloud.com/users/soundcloud:users:265435079/sounds.rss"
     "http://feeds.nightvalepresents.com/welcometonightvalepodcast"
     "http://feed.nashownotes.com/rss.xml"
     "http://feeds.podtrac.com/tBPkjrcL0_m0"
     "http://latenightlinux.com/feed/mp3"
     "http://feeds.feedburner.com/80000HoursPodcast"
     "https://feeds.pacific-content.com/commandlineheroes"
     "http://feeds.podtrac.com/q8s8ba9YtM6r"
     "http://feeds.feedburner.com/dancarlin/history?format=xml"
     "http://feeds.megaphone.fm/PNP1207584390"
     "https://feeds.megaphone.fm/futureperfect"
     "http://rss.acast.com/intelligencesquared"
     "http://feeds.feedburner.com/ProgrammingThrowdown"
     "https://www.reddit.com/r/worldnews/.rss"))

;; (after! elfeed
;;         (defun my-elfeed-tag-sort (a b)
;;                 (let* ((a-tags (format "%s" (elfeed-entry-tags a)))
;;                         (b-tags (format "%s" (elfeed-entry-tags b))))
;;                 (if (string= a-tags b-tags)
;;                         (< (elfeed-entry-date b) (elfeed-entry-date a)))
;;                 (string< a-tags b-tags)))

;;         (setq elfeed-search-sort-function #'my-elfeed-tag-sort)
;; )

(defvar elfeed-default-filter "@2-week-old +unread ")
(setq-default elfeed-search-filter elfeed-default-filter)

(setq ispell-personal-dictionary "c:/Users/Riccardo/.aspell.en.pws")
(setq org-show-notification-timeout 30)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
