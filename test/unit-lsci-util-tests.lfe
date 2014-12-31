(defmodule unit-lsci-util-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest placeholder
  (is-equal
    1 1))
