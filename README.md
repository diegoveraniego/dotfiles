## Preview (Dark & Light)

| | |
| :---: | :---: |
| <img src="https://github.com/user-attachments/assets/7f9c7fd4-6e10-4af0-b387-9c0e5a3c23cb" width="100%" /> | <img src="https://github.com/user-attachments/assets/0cc02378-f44d-4426-a026-ebb993bd8a2d" width="100%" /> |

---

Personal Doom Emacs configuration for GNU/Linux (CachyOS).
Optimized for Music Pedagogy academic research, personal note-taking and software development./>

## 0x01: Technical Stack
- **Framework:** Doom Emacs
- **OS:** CachyOS (Arch-based)
- **Shell:** Fish Shell
- **Fonts:** - `JetBrains Mono`: Primary fixed-pitch font for programming (Python, WebDev, CS50x).
  - `iA Writer Duo S`: Variable-pitch font for academic writing and music pedagogy research.

## 0x02: Modules & Personalization
- **Org-Mode:** Configured with `org-modern` and `org-appear` for a clean, distraction-free markup experience.
- **Zen-Writing:** Custom `writeroom-mode` hook with a 0.1s timer to ensure line numbers are persistently disabled during deep-work sessions.
- **UI Architecture:** Dynamic theme switching between `doom-material` (dark) and `doom-one-light` (light). Includes automated splash image synchronization and real-time modeline refresh.

## 0x03: Keybindings
| Binding | Function |
| :--- | :--- |
| `SPC t t` | Toggle Theme (System-wide Dark/Light) |
| `SPC n n` | Org-narrow (Focus on specific subtree/chapter) |
| `SPC n w` | Org-widen (Return to full document view) |

## 0x04: Deployment Notes
Ensure the following assets are present in `~/.doom.d/splash_imgs/`:
- `emacs.png`: Dark mode splash asset.
- `emacs_light.png`: Light mode splash asset.

---

*Diego — Music Pedagogy Student & Open Source Enthusiast*
