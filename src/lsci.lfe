(defmodule lsci
  (export all))

(defun start ()
  (start '(#(with-ncurses true))))

(defun start (options)
  (let ((with-ncurses (proplists:get_value 'with-ncurses options 'false)))
    (if with-ncurses
      (progn
        (application:load 'encurses)
        (encurses:initscr))
      'ok)
    (lsci-py:start)
    (application:start 'lsci)
    '#(ok started)))

(defun stop ()
  (application:unload 'encurses)
  (lsci-py:stop)
  (application:stop 'lsci)
  '#(ok stopped))

(defun restart ()
  (stop)
  (start)
  '#(ok restarted))
