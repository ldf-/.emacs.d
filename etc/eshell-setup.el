;;; eshell-setup.el --- email

;;; Code:


;; Clearing eshell terminal
;; This function better simulates the behaviour of the classical C-l (`clear`) command
;; It does not yet fix the malfunctioning `clear` command...
;; http://stackoverflow.com/questions/7733668/command-to-clear-shell-while-using-emacs-shell

(defun eshell-clear-buffer ()
  "Clear eshell terminal"
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))
(add-hook 'eshell-mode-hook
      '(lambda()
          (local-set-key (kbd "C-l") 'eshell-clear-buffer)))

(provide 'eshell-setup)
