;;;; This inlcude wraps functions provided by the Python statistics module:
;;;;   https://docs.python.org/3/library/statistics.html
(eval-when-compile

  (defun get-dec-funcs ()
    '(;; Number-theoretic and representation functions
      (mean 1)
      (median 1)
      (median_low 1)
      (median_high 1)
      (median_grouped 1) (median_grouped 2)
      (mode 1)
      (pstdev 1) (pstdev 2)
      (pvariance 1) (pvariance 2)
      (stdev 1) (stdev 2)
      (variance 1) (variance 2))))

(defmacro generate-dec-api ()
  `(progn ,@(py-util:make-funcs (get-dec-funcs) 'statistics)))

(generate-dec-api)

(defun loaded-dec ()
  "This is just a dummy function for display purposes when including from the
  REPL (the last function loaded has its name printed in stdout).
  This function needs to be the last one in this include."
  'ok)
