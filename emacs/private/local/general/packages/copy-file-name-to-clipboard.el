;; copy-file-name-to-clipboard
(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  :defer t
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))
