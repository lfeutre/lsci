(defmodule lsci-math
  (export all))

(include-lib "lsci/include/math.lfe")

(defun pi ()
  (py:const 'math 'pi))

(defun e ()
  (py:const 'math 'e))

(defun phi (x)
  "Cumulative distribution function for the standard normal distribution."
  (/ (+ (erf (/ x (sqrt 2.0)))
        1.0)
     2.0))

(defun div (a b)
  (truediv a b))

(defun mult (a b)
  (mul a b))

(defun minus (a b)
  (sub a b))

(defun plus (a b)
  (add a b))
