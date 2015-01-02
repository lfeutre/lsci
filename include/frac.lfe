;;;; The functions wrapped in this inlcude are from the following source:
;;;;
;;;;  * https://docs.python.org/3.4/library/fractions.html
;;;;
(eval-when-compile

  (defun get-frac-funcs ()
    '(;;
      (gcd 2))))

(defmacro generate-frac-api ()
  `(progn ,@(py-util:make-funcs (get-frac-funcs) 'fractions)))

(generate-frac-api)

(defun loaded-frac ()
  "This is just a dummy function for display purposes when including from the
  REPL (the last function loaded has its name printed in stdout).
  This function needs to be the last one in this include."
  'ok)
