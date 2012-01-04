; based on https://github.com/nex3/arc/blob/master/lib/files.arc

(def mv (src dst)
  " Moves the file or directory `src' to `dst'. "
  (scheme.rename-file-or-directory src dst)
  nil)

(def cp (src dst)
  " Copies the file `src' to `dst'. "
  (scheme.copy-file src dst)
  nil)

(def mtime (path)
  " Returns the modification time of the file or directory `path' in
    seconds since the epoch. "
  (scheme.file-or-directory-modify-seconds path))

(def file-perms (path)
  " Returns a list of the effective file permssions of `path'. "
  (scheme.file-or-directory-permissions path))

(def file-size (path)
  " Returns the size, in bytes, of a file `path'. "
  (scheme.file-size path))

(def cd (path)
  " Changes the current directory. "
  (scheme.current-directory path)
  (pwd))

(def pwd ()
  " Returns the current directory. "
  (scheme (path->string (current-directory))))

; This could be defined in pure Arc, but we don't really have a good way of
; testing whether or not we should use Windows path separators,
; so we'll leave it up to Scheme.
(def file-join parts
  " Joins `parts' into a path string. "
  (scheme.path->string (apply scheme.build-path parts)))

(def qualified-path (path)
  " Returns the fully-qualified path of a possibly relative `path'. "
  (scheme (path->string (simplify-path (path->complete-path path)))))

(mac w/dir (n p d . body)
  `(each ,n (dir ,d)
     (let ,p (qualified-path ,n)
       ,@body)))
