;;; -*- lexical-binding: t; -*-

(defun nix/nix-update-path (process)
  (with-current-buffer (process-buffer process)
    (let* ((nix-env (seq-keep (lambda (s)
                                (let* ((pos (string-match "=" s)))
                                  (when pos
                                    (list (substring s 0 pos)
                                          (substring s (+ 1 pos))))))
                              (split-string (buffer-substring-no-properties (point-min)
                                                                            (point-max))
                                            "\0"
                                            t))))
      (mapc (lambda (xs) (apply #'setenv xs)) nix-env)
      (setq exec-path (parse-colon-path (getenv "PATH")))))
  (kill-buffer (process-buffer process)))

(defun nix/nix-command (nix-proc-buffer cmd)
  (make-process :name "nix-shell-load"
                :buffer nix-proc-buffer
                :command cmd
                :stderr nil))

(defun nix/nix-process-sentinel (type)
  (lambda (process event)
    (when (and (eq (process-status process) 'exit)
               (= (process-exit-status process) 0))
      (nix/nix-update-path process))
    (message "%s: %s" type (string-trim event))))

(defun nix-develop ()
  "Wrap emacs running instance in a nix development shell"
  (interactive)
  (let* ((default-directory (read-directory-name "Flake directory: "))
         (nix-proc-buffer "*nix-develop-load-buffer*")
         (nix-cmd '("nix" "develop" "--command" "env" "-0"))
         (nix-proc (nix/nix-command nix-proc-buffer nix-cmd)))
    (set-process-sentinel nix-proc (nix/nix-process-sentinel "nix-develop"))))

(defun nix-shell ()
  "Wrap emacs within a nix shell instance that includes a given package"
  (interactive)
  (let* ((nix-package-name (read-string "Package name: ")) 
         (nix-proc-buffer "*nix-shell-load-buffer*")
         (nix-cmd (list "nix" "shell" (concat "nixpkgs#" nix-package-name) "--command" "env" "-0"))
         (nix-proc (nix/nix-command nix-proc-buffer nix-cmd)))
    (set-process-sentinel nix-proc (nix/nix-process-sentinel "nix-shell"))))

(provide 'nix-develop)
