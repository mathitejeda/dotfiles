;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 13))
;       doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; tabs instead of spaces
(setq-default indent-tabs-mode t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/notes/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;config for templ
(setq treesit-language-source-alist
      '((bash       . ("https://github.com/tree-sitter/tree-sitter-bash"))
        (c          . ("https://github.com/tree-sitter/tree-sitter-c"))
        (cpp        . ("https://github.com/tree-sitter/tree-sitter-cpp"))
        (css        . ("https://github.com/tree-sitter/tree-sitter-css"))
        (elisp      . ("https://github.com/Wilfred/tree-sitter-elisp"))
        (go         . ("https://github.com/tree-sitter/tree-sitter-go"))
        (gomod      . ("https://github.com/camdencheek/tree-sitter-go-mod"))
        (html       . ("https://github.com/tree-sitter/tree-sitter-html"))
        (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))
        (json       . ("https://github.com/tree-sitter/tree-sitter-json"))
        (lua        . ("https://github.com/Azganoth/tree-sitter-lua"))
        (make       . ("https://github.com/alemuller/tree-sitter-make"))
        (markdown   . ("https://github.com/ikatyang/tree-sitter-markdown"))
        (python     . ("https://github.com/tree-sitter/tree-sitter-python"))
        (rust       . ("https://github.com/tree-sitter/tree-sitter-rust"))
        (templ      . ("https://github.com/vrischmann/tree-sitter-templ.git"))
        (toml       . ("https://github.com/tree-sitter/tree-sitter-toml"))
        (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src"))
        (yaml       . ("https://github.com/ikatyang/tree-sitter-yaml"))))


(use-package templ-ts-mode
  :ensure t
  :mode ("\\.templ\\'" . templ-ts-mode))

;; Org-mode visual tweaks
(after! org
  (setq org-hide-emphasis-markers t
        org-startup-indented t
        org-startup-folded 'overview
        org-ellipsis " ▾"
        org-hide-leading-stars t)

  (add-hook 'org-mode-hook #'org-modern-mode)
  (add-hook 'org-mode-hook #'visual-line-mode)
  (add-hook 'org-mode-hook #'variable-pitch-mode)
  (add-hook 'org-mode-hook #'org-appear-mode)

  ;; Mostrar/ocultar énfasis y links solo en modo insert
  (defun my/org-appear-activate ()
    (when (derived-mode-p 'org-mode)
      (org-appear--set-elements-visible t)))

  (defun my/org-appear-deactivate ()
    (when (derived-mode-p 'org-mode)
      (org-appear--set-elements-visible nil)))

  (add-hook 'evil-insert-state-entry-hook #'my/org-appear-activate)
  (add-hook 'evil-insert-state-exit-hook  #'my/org-appear-deactivate))

;; Config de org-appear
(use-package! org-appear
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-appear-autoemphasis t
        org-appear-autolinks t
        org-appear-autosubmarkers t))

;; Usa org-modern para íconos más lindos y bullets bonitos
(use-package! org-modern
  :config
  (setq org-modern-hide-stars nil
        org-modern-star ["◉" "○" "✸" "✿"]
        org-modern-list '((43 . "•") (45 . "–") (42 . "◦")))) ; +, -, *

;; Desactivar números en org, pero mantenerlos relativos en programación
(add-hook! org-mode (setq display-line-numbers nil))
(add-hook! prog-mode (setq display-line-numbers 'relative))
(set-face-attribute 'org-table nil  :inherit 'fixed-pitch)

;; Opcional: fuente proporcional para texto org (más estético)
(set-face-attribute 'variable-pitch nil :family "Cantarell" :height 160)
(set-face-attribute 'fixed-pitch nil :family "FiraCode Nerd Font" :height 140)
