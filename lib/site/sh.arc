(require "re.arc")

(def escshargs args
  (map [string " '" (re-replace "'" _ "'\\\\''") "'"] args))
