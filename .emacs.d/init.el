;;; package --- Summary

;;; Commentary:
;; Join the Free Software Foundation: https://www.fsf.org/
;; GNU Operating System: https://www.gnu.org/

;;; Code:
(package-initialize)

;; [GARBAGE COLLECTION]

(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

;; restore after startup
(add-hook 'after-init-hook #'(lambda ()
                               (setq gc-cons-threshold 16777216
                                     gc-cons-percentage 0.1)))

;; [UI]
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq vc-follow-symlinks t) ;; don't ask for confirmation when opening symlinked file

;;  [REPOSITORIES]

(setq network-security-level 'high
      package-check-signature nil
      package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

;;  [USE-PACKAGE]

(require 'package)

(unless (package-installed-p 'use-package)
  (package-refresh-contents) ; update packages archive
  (package-install 'use-package)) ; and install the most recent version of use-package

(setq use-package-verbose t ;; indicate this loading activity in the *Messages* buffer
      use-package-always-ensure t ;; ensure t as default
      )

(eval-when-compile
  (require 'use-package))

;; always comnnpile packages, and use the newest version available.
(use-package auto-compile
  :diminish auto-compile-mode
  :config
  (auto-compile-on-load-mode)
  (setq load-prefer-newer t))

;; ORG and main configurations

(use-package org
  :ensure org-plus-contrib
  :pin org)

(org-babel-load-file (concat user-emacs-directory "README.org"))


;; [CUSTOM]

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;;; init.el ends here
