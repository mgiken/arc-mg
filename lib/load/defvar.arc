(require "load/redef.arc")
(require "load/scheme.arc")

(= defined-variables* (table))

(redef ac-defined-var? (name)
  (if defined-variables*.name scheme-t scheme-f))

(mac defvar (name getter setter)
  `(do (ac-set-global ',name (fn args (if args (,setter (car args)) (,getter))))
       (set (defined-variables* ',name))
       nil))

(mac defvar-impl (name)
  (let gname (ac-global-name name)
    `(scheme ,gname)))

(mac undefvar (name)
  `(do (wipe (defined-variables* ',name))
       (ac-set-global ',name nil)))
