;; config.el --- Configuración de diegoveraniego ---

;; --- 1. IDENTIFICACIÓN y UI ---
(setq user-full-name "Diego"
      display-line-numbers-type 'relative)

(setq doom-theme 'doom-material)
(setq fancy-splash-image (expand-file-name "splash_imgs/emacs_dark.png" doom-private-dir))
(setq +doom-dashboard-banner-file fancy-splash-image)

;; --- 2. FUENTES ---
(setq doom-font (font-spec :family "JetBrains Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "iA Writer Duo S" :size 14))

;; --- 3. ORG MODE ---
(after! org
  (setq org-directory "~/org/"
        org-hide-emphasis-markers t)

  (add-hook 'org-mode-hook #'org-modern-mode)
  (add-hook 'org-mode-hook #'org-appear-mode))

(defun diego/apply-org-styles ()
  "Asegura que bloques, citas y niveles se vean correctamente en cualquier tema."
  (custom-set-faces
   '(org-block ((t (:inherit default :background nil :extend t))))
   '(org-block-begin-line ((t (:inherit org-meta-line :slant italic :background nil))))
   '(org-block-end-line ((t (:inherit org-block-begin-line :background nil))))
   '(org-quote ((t (:inherit default :background nil :slant italic :extend t))))
   '(org-level-1 ((t (:foreground "#ff69b4" :height 1.3 :weight bold))))
   '(org-level-2 ((t (:height 1.1 :weight semi-bold))))
   '(org-table ((t (:inherit fixed-pitch :family "JetBrains Mono"))))))

(add-hook 'doom-load-theme-hook #'diego/apply-org-styles)

;; --- 4. PAQUETES EXTRAS (Nyan Cat) ---
(use-package! nyan-mode
  :config
  (setq nyan-bar-length 10)
  (nyan-mode +1))

;; --- 5. MODO ESCRITURA (Zen) ---
(after! writeroom
  (setq writeroom-width 90
        writeroom-center-fixed-width t)
  (add-hook 'writeroom-mode-hook
            (lambda ()
              (run-with-timer 0.1 nil
                             (lambda () (display-line-numbers-mode -1))))))

;; --- 6. TOGGLE THEME (Light/Dark) ---
(defun diego/toggle-theme ()
  "Alterna entre doom-material y doom-one-light de forma limpia."
  (interactive)
  (if (eq doom-theme 'doom-material)
      (setq doom-theme 'doom-one-light
            fancy-splash-image (expand-file-name "splash_imgs/emacs_light.png" doom-private-dir))
    (setq doom-theme 'doom-material)
    (setq fancy-splash-image (expand-file-name "splash_imgs/emacs_dark.png" doom-private-dir)))

  (load-theme doom-theme t)
  ;; Esta es la única función que Doom necesita oficialmente para refrescarse
  (doom/reload-theme)

  (setq +doom-dashboard-banner-file fancy-splash-image)
  (when (get-buffer "+doom-dashboard")
    (with-current-buffer "+doom-dashboard"
      (+doom-dashboard-reload t)))
  (message "Cargado: %s" doom-theme))

(map! :leader
      :desc "Toggle dark/light theme"
      "t t" #'diego/toggle-theme)
