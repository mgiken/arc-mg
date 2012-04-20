(require "load/generic.arc")
(require "load/scheme.arc")

(scheme:namespace-undefine-variable! '_iso)
; Could take n args, but have never once needed that.
(defgeneric iso(x y)
  (is x y))

(defmethod iso(x y) cons
  (and (acons x)
       (acons y)
       (iso car.x car.y)
       (iso cdr.x cdr.y)))

(defmethod iso(x y) table
  (and (isa x 'table)
       (isa y 'table)
       (is (len keys.x) (len keys.y))
       (all
         (fn((k v))
           (iso y.k v))
         tablist.x)))


