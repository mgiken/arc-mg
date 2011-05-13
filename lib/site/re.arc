(def re-match-pat (pat str)
  (ac-niltree (scheme.regexp-match (scheme.pregexp pat) str)))

(def re-match (pat str)
  (only.cdr (re-match-pat pat str)))

(def re-split (delim str)
  (scheme.regexp-split (scheme.pregexp delim) str))

(def re-replace (pat text replacement)
  (scheme.regexp-replace* (scheme.pregexp pat) text replacement))
