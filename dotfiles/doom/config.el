(map! :leader "SPC" #'execute-extended-command)
(map! :leader :desc "open todo" "ot" (lambda () (interactive) (find-file "~/org/todo.org")))
(map! :leader :desc "open management" "om" (lambda () (interactive) (find-file "~/org/management.org")))
(map! :leader :desc "open potential index" "opi" (lambda () (interactive) (find-file "~/vimwiki/potential_index.org")))
(map! :leader :desc "open personal personal" "opp" (lambda () (interactive) (find-file "~/org/personal.org")))
(map! :leader :desc "search dir" "/" #'counsel-ag)
(map! :leader :desc "narrow toggle" "on" #'org-toggle-narrow-to-subtree)
(map! :leader :desc "set timer" "tt" #'org-timer-set-timer)
(map! :leader :desc "open all links" "oal" #'link-hint-open-all-links)
(map! :leader :desc "open all links" "ol" #'org-agenda-open-link)

(map! :leader :desc "capture finalize" "mcc" #'org-capture-finalize)
(map! :leader :desc "capture refile" "mcr" #'org-capture-refile)
(map! :leader :desc "capture kill" "mck" #'org-capture-kill)

(map! :leader :desc "todoist open" "to" #'todoist)
(map! :leader :desc "todoist close" "tc" #'todoist-close-task)

(map! :leader :desc "agenda day" "ad" #'org-agenda-day-view)
(map! :leader :desc "agenda week" "aw" #'org-agenda-week-view)

(map! :leader :desc "exe elfeed update" "eeu" #'elfeed-update)
(map! :leader :desc "exe elfeed start" "ees" #'elfeed)

(map! :leader :desc "exe profiler start" "eps" #'profiler-start)
(map! :leader :desc "exe profiler stop" "epS" #'profiler-stop)
(map! :leader :desc "exe profiler report" "epr" #'profiler-report)

(global-set-key (kbd "M-c") 'shell)
(global-set-key (kbd "M-n") 'evil-mc-make-and-goto-next-match)
(global-set-key (kbd "M-N") 'evil-mc-make-cursor-in-visual-selection-beg)

(setq confirm-kill-emacs nil)

(setq display-line-numbers-type nil)

(setq-default explicit-shell-file-name "C:\\Program Files\\Git\\bin\\bash")

(setq calendar-latitude 51.7)
(setq calendar-longitude 14.6)

(defun save-all ()
    (interactive)
    (save-some-buffers t))

(add-hook 'focus-out-hook 'save-all)

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Riccardo Varenna"
      user-mail-address "riccardovarenna@gmail.com")

(setq doom-font (font-spec :family "Iosevka" :size 14)
      doom-big-font (font-spec :family "Iosevka" :size 20)
      doom-variable-pitch-font (font-spec :family "Iosevka Etoile" :size 12)
      doom-font-increment 1)

(setq doom-theme 'doom-nebula
      fancy-splash-image (concat doom-private-dir "themes/nebula.png"))

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

(after! server
  (when (not (server-running-p))
    (server-start)))

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

(after! elfeed
    (setq elfeed-enclosure-default-dir "D:\\play\\")

    (setq elfeed-feeds '(("https://feeds.redcircle.com/f3395a08-b5f5-4c1a-96db-87c99341f8a0" podcast)
        ("https://feeds.megaphone.fm/sofia-with-an-f" podcast)
        ("https://feeds.simplecast.com/wgl4xEgL" podcast)
        ("https://blog.jetbrains.com" news)
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCsXVk37bltHxD1rDPwtNM8Q" youtube)
        ("https://www.youtube.com/playlist?list=UUxkMDXQ5qzYOgXPRnOBrp1w" youtube)
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCiSC9gerE3Ql5Xt-Z51OD2w" youtube)
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UC-9C9d1qDDzA2jdH53vSIuA" youtube)
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCMsNS10PzxzEayT7UHS4p6g" youtube)
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UC8THb_fnOptyVgpi3xuCd-A" youtube)
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA" youtube)
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCkjsXZlc-5PyW5xAPlUmw3w" youtube)
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UC4rZq6S7sV6gljt_4vjdXIw" youtube)
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCtXuWXsd7TYXwX2ZNLXfojg" youtube)
        ("https://www.reddit.com/r/emacs/.rss" news)
        ("https://www.reddit.com/r/orgmode/.rss" news)
        ("https://www.techmeme.com/feed.xml" news)
        ("https://hnrss.org/frontpage" news)
        ("http://feeds.wnyc.org/moreperfect" podcast)
        ("http://feeds.feedburner.com/JupiterBroadcasting" podcast)
        ("http://feeds.feedburner.com/DarknetDiaries" podcast)
        ("http://ubuntupodcast.org/feed/podcast" podcast)
        ("http://podcast.theschmidtshow.com/rss" podcast)
        ("https://feeds.megaphone.fm/KM4602122913" podcast)
        ("http://www.jupiterbroadcasting.com/feeds/unfilterMP3.xml" podcast)
        ("https://feeds.hackablepodcast.com/hackable" podcast)
        ("https://pinecast.com/feed/emacscast" podcast)
        ("http://feeds.wnyc.org/radiolab" podcast)
        ("http://freecodecamp.libsyn.com/rss" podcast)
        ("https://thenew.show/feed/podcast" podcast)
        ("http://criticalrolepodcast.geekandsundry.com/feed.xml" podcast)
        ("http://feeds.soundcloud.com/users/soundcloud:users:265435079/sounds.rss" podcast)
        ("http://feeds.nightvalepresents.com/welcometonightvalepodcast" podcast)
        ("http://feed.nashownotes.com/rss.xml" podcast)
        ("http://feeds.podtrac.com/tBPkjrcL0_m0" podcast)
        ("http://latenightlinux.com/feed/mp3" podcast)
        ("http://feeds.feedburner.com/80000HoursPodcast" podcast)
        ("https://feeds.pacific-content.com/commandlineheroes" podcast)
        ("http://feeds.podtrac.com/q8s8ba9YtM6r" podcast)
        ("http://feeds.feedburner.com/dancarlin/history?format=xml" podcast)
        ("http://feeds.megaphone.fm/PNP1207584390" podcast)
        ("https://feeds.megaphone.fm/futureperfect" podcast)
        ("http://rss.acast.com/intelligencesquared" podcast)
        ("http://feeds.feedburner.com/ProgrammingThrowdown" podcast)
        ("https://www.reddit.com/r/worldnews/.rss" news)))

    (defvar elfeed-default-filter "@2-week-old +unread ")
    (setq-default elfeed-search-filter elfeed-default-filter)

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
)

;; (defun my-elfeed-tag-sort (a b)
;;         (let* ((a-tags (format "%s" (elfeed-entry-tags a)))
;;                 (b-tags (format "%s" (elfeed-entry-tags b))))
;;         (if (string= a-tags b-tags)
;;                 (< (elfeed-entry-date b) (elfeed-entry-date a)))
;;         (string< a-tags b-tags)))

;; (setq elfeed-search-sort-function #'my-elfeed-tag-sort)

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

(after! org
  ;; If you use `org' and don't want your org files in the default location below,
  ;; change `org-directory'. It must be set before org loads!
  (setq org-directory "~/org/")

  ;(setq org-archive-location "%s_archive.org::")

  (setq org-show-notification-timeout 30)

  (add-to-list 'org-modules 'org-checklist 'org-habit)

  (setq org-capture-templates
        '(
          ("n" "note" entry
           (file+headline +org-capture-todo-file "inbox")
           "* %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
          ("c" "check with everyone" entry
           (file+headline +org-capture-todo-file "check with everyone")
           "* TODO %? [/]\n- [ ] Adan\n- [ ] Axel\n- [ ] Ben\n- [ ] Brian\n- [ ] Igor\n- [ ] Jakob\n- [ ] Konrad\n- [ ] Leon\n- [ ] Nikita\n- [ ] Oskar\n- [ ] Rasmus\n- [ ] Rowan\n- [ ] Sebastian\n- [ ] Xan")
          ("j" "journal entry" entry
           (file+olp+datetree +org-capture-journal-file)
           "* %U\n%?" :prepend t)
          ("p" "journal plan" entry
           (file+olp+datetree +org-capture-journal-file)
           "* %U\n** plan [/]\n- [ ] %?" :prepend t)
          ("t" "todo" entry
           (file+headline +org-capture-todo-file "inbox")
           "* TODO [#C] %?\n:PROPERTIES:\n:CREATED:  %U\n:END:")
          ("r" "read" table-line (id "ID-TBL-PAGES-READ") "|%?||" :prepend t :unnarrowed t)
          ("w" "wpm" table-line (id "ID-TBL-WPM") "|%?||" :prepend t :unnarrowed t)
          )
        )

  (setq org-todo-keywords
        '((sequence
           "TODO(t!)"       ; A task that needs doing & is ready to do
           "WAIT(w!)"       ; Something external is holding up this task
           "FOUP(f!)"      ; Needs follow up, already checked once
           "HOLD(h!)"       ; This task is paused/on hold because of me
           "OUTS(o!)"       ; outsource this task
           "|"
           "DONE(d!)"       ; Task successfully completed
           "CANCELLED(c@)")) ; Task was cancelled, aborted or is no longer applicable
        org-todo-keyword-faces
        '(("[-]"  . +org-todo-active)
          ("[?]"  . +org-todo-onhold)
          ("HOLD" . +org-todo-onhold)
          ("FOUP" . +org-todo-onhold)
          ("WAIT" . +org-todo-onhold)))
  (setq org-tag-alist
        '(("check_with_people" . ?c) ("review_evening" . ?e) ("family" . ?f) ("health" . ?h) ("programming" . ?p) ("review_morning" . ?m)))
  (setq org-log-into-drawer t)
  (setq org-agenda-show-future-repeats nil)
  (setq org-deadline-warning-days 7)
  ;(setq org-ellipsis "↣")
  ;(setq org-superstar-headline-bullets-list '("Ⅰ" "Ⅱ" "Ⅲ" "Ⅳ" "Ⅴ" "Ⅵ" "Ⅶ" "Ⅷ" "Ⅸ" "Ⅹ"))
  ;; (setq org-agenda-window-setup 'other-window)
  ;; (set-popup-rule! "^\\*Org Agenda" :side 'right)  ; tweak me
)

(after! org-superstar
  (defadvice org-superstar-mode
    (around
    my-org-superstar-mode-advice
    activate)
    (let ((gc-cons-threshold (* 1024 1024 1024)))
    ad-do-it))
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
;;
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

(after! org
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

    (setq org-roam-directory "~/org/roam")
)

(map! :map org-super-agenda-header-map
        "j" #'org-agenda-next-line
        "k" #'org-agenda-previous-line
        :map org-agenda-keymap
        "k" #'org-agenda-previous-line
        "j" #'org-agenda-next-line
)

(after! org
  (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕"))
  (setq org-agenda-sticky t)
)

(use-package! org-super-agenda
        :after org-agenda
        :config
        (setq org-super-agenda-groups '(
                                ;;(:auto-tags t)
                                (:name "deadlines"
                                 :order 0
                                 :deadline t)
                                (:name "habits"
                                 :order 1
                                 :tag "habit")
                                 ;;:habit t)
                                (:name "family"
                                 :order 2
                                 :tag "family")
                                (:name "review morning"
                                 :order 3
                                 :tag "review_morning")
                                (:name "health"
                                 :order 4
                                 :tag "health")
                                (:name "todo"
                                 :order 5
                                 :file-path "todo.org")
                                (:name "eta"
                                 :order 6
                                 :tag "eta")
                                (:name "check with people"
                                 :order 7
                                 :tag "check_with_people")
                                (:name "review evening"
                                 :order 8
                                 :tag "review_evening")
                                (:name "programming"
                                 :order 9
                                 :tag "programming")
                                )
        )
        (setq org-agenda-scheduled-leaders '("" "Sched.%2dx: "))
        (setq org-agenda-hide-tags-regexp ".*")
        (setq org-habit-show-habits t)
        (setq org-super-agenda-header-map nil)
        (org-super-agenda-mode)
        (setq org-agenda-prefix-format
              '((agenda . " %t %s")
                (todo . " %?-8t %-25b %s")
                (tags . " %?-8t %-25b %s")
                (search . " %?-8t %-25b %s"))
        )
)

(setq ispell-program-name "aspell")

(setq ispell-personal-dictionary "c:/Users/Riccardo/.aspell.en.pws")

(defun my-save-word ()
        (interactive)
        (let ((current-location (point))
        (word (flyspell-get-word)))
        (when (consp word)
        (flyspell-do-correct 'save nil (car word) current-location (cadr word) (caddr word) current-location))))


(map! :leader :desc "save-word" "sw" #'my-save-word)
(map! :i "C-i" #'flyspell-auto-correct-word)
