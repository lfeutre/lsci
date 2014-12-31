(defmodule lsci-stats
  (export all))

(include-lib "lsci/include/stats.lfe")

(defun version ()
  (py-util:get-python-version))
