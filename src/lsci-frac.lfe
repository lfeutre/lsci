(defmodule lsci-frac
  (export all))

(include-lib "lsci/include/frac.lfe")
(include-lib "lutil/include/predicates.lfe")

(defun version ()
  (py-util:get-python-version))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Wrappers - the following functions couldn't be simply wrapped with the
;;;            same macros that wrap most of the other SciPy functions due to
;;;            the fact that these needed some sort of special handling.
;;;

;; Instantiation
;;
(defun new
  (((= `(#(numerator ,num) #(denominator ,den)) kwargs))
    (py:init 'fractions 'Fraction '() kwargs))
  (((= `(,num ,den) args))
    (py:init 'fractions 'Fraction args '()))
  ((value)
    (if (string? value)
      (py:init 'fractions 'Fraction `(,(list_to_binary value)))
      (py:init 'fractions 'Fraction `(,value)))))

(defun new (num den)
  (py:init 'fractions 'Fraction `(,num ,den) '()))

(defun from-float (float)
  (py:func 'fractions.Fraction 'from_float `(,float)))

;; XXX Once decimal support has landed in lsci, uncomment this line.
;; XXX See ticket #28
;;(defun from-decimal (dec)
;;  (py:func 'fractions.Fraction 'from_decimal `(,dec)))

;;(defun from-dec (dec)
;;  (from-decimal dec))

;; Attributes
;;
(defun numerator (fraction)
  (py:attr fraction 'numerator))

(defun num (f)
  (numerator f))

(defun denominator (fraction)
  (py:attr fraction 'denominator))

(defun den (f)
  (denominator f))

;; Methods
;;
(defun limit-denominator (fraction)
  (py:method fraction 'limit_denominator))

(defun limit-denominator (fraction max_denominator)
  (py:method fraction 'limit_denominator `(,max_denominator)))

(defun limit-den (f)
  (limit-denominator f))

(defun limit-den (f max)
  (limit-denominator f max))

(defun floor (fraction)
  (lsci-math:floor fraction))

(defun ceil (fraction)
  (lsci-math:ceil fraction))

(defun round (fraction)
  (lsci-math:round fraction))

(defun round (fraction precision)
  (lsci-math:round fraction precision))

;; Functions
;;
(defun ->float (fraction)
  (py:float fraction))
