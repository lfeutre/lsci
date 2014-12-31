(defmodule lsci
  (export all))

(defun start ()
  (application:load 'encurses)
  (encurses:initscr)
  (lsci-py:start)
  (application:start 'lsci)
  '#(ok started))

(defun stop ()
  (application:unload 'encurses)
  (lsci-py:stop)
  (application:stop 'lsci)
  '#(ok stopped))

(defun restart ()
  (stop)
  (start)
  '#(ok restarted))
