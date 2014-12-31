(defmodule lsci-py
  (export all))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Application functions
;;;
(defun start ()
  (application:load 'py)
  (application:load 'lsci)
  (lsci-util:override-py-env)
  (py:start))

(defun on-startworker (proc-name)
  "Initialize the Python components, but don't use the scheduler
  to get the pid, since the supervisor hasn't finished yet."
  (python:call (erlang:whereis proc-name) 'lsci 'init.setup '()))

(defun stop ()
  (py:stop))

(defun get-sup-pid ()
  (py-sup:get-pid))

(defun get-python-pids ()
  (py-sup:get-child-pids))
