(defmodule lsci-dec
  (export all))

(include-lib "lsci/include/dec.lfe")

(defun version ()
  (py-util:get-python-version))
