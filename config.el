;;; config.el:

;; --- 1. IDENTIFICACIÓN y UI ---
(setq user-full-name "diego"
      display-line-numbers-type 'relative)

(setq doom-theme 'doom-material)
(setq fancy-splash-image "~/.config/doom/pianissimo.svg")
;; Temas Dark/Light con auto-dark
(use-package! auto-dark
  :hook (after-init . auto-dark-mode)
  :config
  (setq auto-dark-themes '((doom-material) (doom-one-light)))
  (setq auto-dark-polling-interval 600))

;; --- 2. FUENTES ---
(setq doom-font (font-spec :family "Aporetic Sans Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "Noto Serif" :size 14))

;; --- 3. ORG MODE ---
(after! org
  (setq org-directory "~/org/"
        org-hide-emphasis-markers t)

  (add-to-list 'org-modules 'org-habit)
  (add-hook 'org-mode-hook #'org-appear-mode)

  ;; --- Soporte para LilyPond en bloques de código ---
  (org-babel-do-load-languages
   'org-babel-load-languages
   (append org-babel-load-languages
           '((lilypond . t)))))

;; --- 5. MODO ESCRITURA (Zen) ---
(after! writeroom
  (setq writeroom-width 90
        writeroom-center-fixed-width t)
(add-hook 'writeroom-mode-hook #'doom-disable-line-numbers-h))

