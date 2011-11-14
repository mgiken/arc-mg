(require "re.arc")

(def escsharg args
  (map [string " '" (re-replace "'" _ "'\\\\''") "'"] args))
