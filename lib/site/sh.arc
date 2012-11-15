(require "re.arc")

(def escshargs args
  (map [when _ (string " '" (re-replace "'" string._ "'\\\\''") "'")] flat.args))

(mac exec args
  `(trim:tostring:system:string ,@args))

(mac exec-quiet args
  `(exec ,@args " >/dev/null 2>&1"))
