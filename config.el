;;; config.el --- Configuración de diegoveraniego ---

;; --- 1. IDENTIFICACIÓN y UI ---
(setq user-full-name "Diego"
      display-line-numbers-type 'relative)

(setq doom-theme 'doom-material)
(setq fancy-splash-image (expand-file-name "splash_imgs/emacs.png" doom-private-dir))

;; --- 2. FUENTES ---
(setq doom-font (font-spec :family "JetBrains Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "iA Writer Duo S" :size 14))

;; --- 3. ORG MODE ---
(after! org
  (setq org-directory "~/org/"
        org-hide-emphasis-markers t)

  (add-hook 'org-mode-hook #'org-modern-mode)
  (add-hook 'org-mode-hook #'org-appear-mode)

  (custom-set-faces
   '(org-block ((t (:inherit default :background nil :extend t))))
   '(org-block-begin-line ((t (:inherit org-meta-line :slant italic :background nil))))
   '(org-block-end-line ((t (:inherit org-block-begin-line :background nil))))
   '(org-level-1 ((t (:foreground "#ff69b4" :height 1.3 :weight bold))))
   '(org-level-2 ((t (:height 1.1 :weight semi-bold))))))

;; --- 4. PAQUETES EXTRAS (Nyan Cat) ---
(use-package! nyan-mode
  :config
  (setq nyan-bar-length 10)
  (nyan-mode +1))

;; --- 5. MODO ESCRITURA (Zen) ---
(after! writeroom
  (setq writeroom-width 90
        writeroom-center-fixed-width t))

;; --- 6. TOGGLE THEME (Light/Dark) ---
(defun diego/toggle-theme ()
  "Alterna entre doom-material y doom-one-light, actualizando imagen y UI."
  (interactive)
  (if (eq doom-theme 'doom-material)
      (progn
        (setq doom-theme 'doom-one-light)
        (setq fancy-splash-image (expand-file-name "splash_imgs/emacs_light.png" doom-private-dir)))
    (progn
      (setq doom-theme 'doom-material)
      (setq fancy-splash-image (expand-file-name "splash_imgs/emacs_dark.png" doom-private-dir))))

  (load-theme doom-theme t)
  (doom/reload-theme)
  (when (get-buffer "+doom-dashboard")
    (with-current-buffer "+doom-dashboard"
      (+doom-dashboard-reload))))

(map! :leader
      :desc "Toggle dark/light theme"
      "t t" #'diego/toggle-theme)
