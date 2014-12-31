(defmodule lsci-util
  (export all))

(defun get-py-version ()
  (lutil:get-app-src-version "deps/py/ebin/py.app"))

(defun get-lsci-version ()
  (lutil:get-app-src-version "src/lsci.app.src"))

(defun get-versions ()
  (++ (lutil:get-version)
      `(#(erlport ,(py-util:get-erlport-version))
        #(py ,(get-py-version))
        #(lsci ,(get-lsci-version))
        #(python ,(py-util:get-python-version))
        #(numpy ,(lsci-np:version))
        #(scipy ,(lsci-sp:version)))))
