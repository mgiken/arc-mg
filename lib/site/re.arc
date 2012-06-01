(def pregexp (pat)
  (if (isa pat 're)
      pat
      (scheme.pregexp string.pat)))

(def re-match-pat (pat str)
  (ac-niltree (scheme.regexp-match (pregexp pat) str)))

(def re-match (pat str)
  (only.cdr (re-match-pat pat str)))

(def re-split (delim str)
  (scheme.regexp-split (pregexp delim) str))

(def re-replace (pat text replacement)
  (scheme.regexp-replace* (pregexp pat) text replacement))

(extend type (x) (scheme:pregexp? x)
  're)

;(def parse-re-items (port)
;  (pregexp:accum a
;    (whiler s (readc port) #\/
;      (a s)
;      (when (is s #\\)
;        (a (readc port))))))
;
;(extend-readtable #\/ parse-re-items 'dispatch-macro)
;
;(extend ac-literal (x) (errsafe:isa x 're)
;  scheme-t)
