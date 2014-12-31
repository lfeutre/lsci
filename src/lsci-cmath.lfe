(defmodule lsci-cmath
  (export all))

(include-lib "lsci/include/cmath.lfe")

(defun version ()
  (py-util:get-python-version))

(defun pi ()
  (py:const 'cmath 'pi 'float))

(defun e ()
  (py:const 'cmath 'e 'float))

(defun real (complex-number)
  (py:attr complex-number 'real))

(defun imag (complex-number)
  (py:attr complex-number 'imag))

(defun conjugate (complex-number)
  (py:method complex-number 'conjugate))

(defun conj (complex-number)
  (conjugate complex-number))

(defun ->str (complex-number)
  (py:method complex-number '__str__))
