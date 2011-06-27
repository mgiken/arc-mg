; based on https://github.com/nex3/arc/blob/arc2.master/ffi.scm

(module ffi mzscheme

(provide (all-defined))
(require (file "../ac.scm"))
(require (lib "foreign.ss"))
(require (only '#%foreign ffi-callback _fpointer))
(unsafe!)

(xdef ffi-lib ffi-lib)
(xdef get-ffi-obj get-ffi-obj)

(xdef cbyte _byte)
(xdef cshort _short)
(xdef cushort _ushort)
(xdef cint _int)
(xdef cuint _uint)
(xdef clong _long)
(xdef culong _ulong)

(xdef cfloat _float)
(xdef cdouble _double)

(xdef cbytes _bytes)
(xdef cvec _cvector)
(xdef cstring _string)

(xdef cvoid _void)
(xdef cfn _cprocedure)
(xdef csizeof ctype-sizeof)

(xdef cptr _pointer)
(xdef cpref ptr-ref)
(xdef cpset ptr-set!)
(xdef cmalloc malloc)
(xdef cfree free)
(xdef cfinalize register-finalizer)
(xdef gc collect-garbage)

;; needed to convert from arc's lists (nil terminated) and proper scheme lists
(define (to-prop l)
  (if (eq?  l 'nil) '() (cons (car l) (to-prop (cdr l)))))
(xdef to-prop to-prop)

(define (l->cvec l type) (list->cvector (to-prop l) type))
(xdef l->cvec l->cvec)
(xdef acptr cpointer?)

(xdef ffi-callback ffi-callback)
(xdef cfptr _fpointer)

)
