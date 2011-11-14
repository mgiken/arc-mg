(require "re.arc")

(def escshargs args
  (map [when _ (string " '" (re-replace "'" string._ "'\\\\''") "'")] flat.args))
