(defmodule lsci-np
  (export all))

(include-lib "lsci/include/np.lfe")

(defun version ()
  (py:const 'numpy.version 'version))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Array Attributes
;;;

;; Memory layout
;;
(defun flags (array)
  (py:attr array 'flags))

(defun shape (array)
  (py:attr array 'shape))

(defun strides (array)
  (py:attr array 'strides))

(defun ndim (array)
  (py:attr array 'ndim))

(defun data (array)
  (py:attr array 'data))

(defun size (array)
  (py:attr array 'size))

(defun itemsize (array)
  (py:attr array 'itemsize))

(defun nbytes (array)
  (py:attr array 'nbytes))

(defun base (array)
  (py:attr array 'base))

;; Data type
;;
(defun dtype (array)
  (py:attr array 'dtype))

;; Other attributes
;;
(defun real (array)
  (py:attr array 'real))

(defun imag (array)
  (py:attr array 'imag))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Array Methods
;;;

;; LFE-only
;;
(defun get (array key)
  "This provides LFE support for the Python syntax `array[key]`."
  (py:method array '__getitem__ `(,key)))

(defun ->float (np-float)
  (py:func 'builtins 'float `(,np-float) '()))

(defun ->int (np-int)
  (py:func 'builtins 'int `(,np-int) '()))

(defun norm1d (array)
  (py:func 'lsci.numpysupl 'norm1d `(,array) '()))

(defun scale1d (array)
  (py:func 'lsci.numpysupl 'scale1d `(,array) '()))

(defun scale1d (array kwargs)
  (py:func 'lsci.numpysupl 'scale1d `(,array) kwargs))

(defun poly-linear-model (xs ys degree)
  (py:init
    'lsci.numpysupl
    'PolynomialLinearModel
    `(,xs ,ys ,degree)))

;; Array conversion
;;
(defun item (array args)
  (py:method array 'item args))

(defun tolist (array)
  (py:method array 'tolist))

(defun ->list (array)
  (py:method array 'tolist))

(defun tostring (array)
  (tobytes array))

(defun tostring (array order)
  "order may be either the string C or F."
  (tobytes array order))

(defun ->str (array)
  (tobytes array))

(defun ->str (array order)
  (tobytes array order))

(defun tobytes (array)
  (py:method array 'tobytes))

(defun tobytes (array order)
  "order may be either the string C or F."
  (py:method
    array
    'tostring
    '()
    `(#(order ,(list_to_binary order)))))

(defun ->bytes (array)
  (py:method array 'tobytes))

(defun ->bytes (array order)
  (py:method
    array
    'tostring
    '()
    `(#(order ,(list_to_binary order)))))

(defun dump (array filename)
  (py:method array 'dump `(,(list_to_binary filename)))
  'ok)

(defun dumps (array)
  (py:method array 'dumps))

(defun getfield (array dtype)
  (py:method array 'getfield `(,(list_to_binary dtype))))

(defun getfield (array dtype offset)
  (py:method
    array
    'tostring
    `(,(list_to_binary dtype))
    `(#(offset , offset))))

;; Shape manipulation
;;
(defun reshape (array shape)
  (py:method array 'reshape `(,shape)))

(defun reshape (array shape kwargs)
  (py:method array 'reshape `(,shape) kwargs))

(defun resize (array shape)
  (py:method array 'resize `(,shape)))

(defun resize (array shape kwargs)
  (py:method array 'resize `(,shape) kwargs))

(defun transpose (array)
  (py:method array 'transpose))

(defun transpose (array axes)
  (py:method array 'transpose axes))

(defun swapaxes (array axis-1 axis-2)
  (py:method array 'swapaxes `(,axis-1 ,axis-2)))

(defun flatten (array kwargs)
  (py:method array 'flatten '() kwargs))

(defun ravel (array order)
  (py:method array 'ravel `(,order)))

(defun squeeze (array kwargs)
  (py:method array 'squeeze '() kwargs))

;; Item selection and manipulation
;;
;; TBD

;; Calculation
;;
(defun max (array)
  (py:method array 'max))

(defun max (array kwargs)
  (py:method array 'max '() kwargs))

(defun argmax (array)
  (py:method array 'argmax))

(defun argmax (array kwargs)
  (py:method array 'argmax '() kwargs))

(defun min (array)
  (py:method array 'min))

(defun min (array kwargs)
  (py:method array 'min '() kwargs))

(defun argmin (array)
  (py:method array 'argmin))

(defun argmin (array kwargs)
  (py:method array 'argmin '() kwargs))

(defun ptp (array)
  (py:method array 'ptp))

(defun ptp (array kwargs)
  (py:method array 'ptp '() kwargs))

(defun clip (array min max)
  (py:method array 'clip `(,min ,max)))

(defun clip (array min max kwargs)
  (py:method array 'clip `(,min ,max) kwargs))

(defun conj (array)
  (py:method array 'conj))

(defun round (array)
  (py:method array 'round))

(defun round (array kwargs)
  (py:method array 'round '() kwargs))

(defun trace (array)
  (py:method array 'trace))

(defun trace (array kwargs)
  (py:method array 'trace '() kwargs))

(defun sum (array)
  (py:method array 'sum))

(defun sum (array kwargs)
  (py:method array 'sum '() kwargs))

(defun cumsum (array)
  (py:method array 'cumsum))

(defun cumsum (array kwargs)
  (py:method array 'cumsum '() kwargs))

(defun prod (array)
  (py:method array 'prod))

(defun prod (array kwargs)
  (py:method array 'prod '() kwargs))

(defun cumprod (array)
  (py:method array 'cumprod))

(defun cumprod (array kwargs)
  (py:method array 'cumprod '() kwargs))

(defun dot (array other-array)
  (py:method array 'dot `(,other-array)))

(defun dot (array other-array kwargs)
  (py:method array 'dot `(,other-array) kwargs))

(defun mean (array)
  (py:method array 'mean))

(defun mean (array kwargs)
  (py:method array 'mean '() kwargs))

(defun var (array)
  (py:method array 'var))

(defun var (array kwargs)
  (py:method array 'var '() kwargs))

(defun std (array)
  (py:method array 'std))

(defun std (array kwargs)
  (py:method array 'std '() kwargs))

(defun all (array)
  (py:method array 'all))

(defun all (array kwargs)
  (py:method array 'all '() kwargs))

(defun any (array)
  (py:method array 'any))

(defun any (array kwargs)
  (py:method array 'any '() kwargs))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Wrappers - the following functions couldn't be simply wrapped with the
;;;            same macros that wrap most of the other NumPy functions due to
;;;            the fact that these needed some sort of special handling.
;;;

;; Numerical ranges
;;
(defun linspace (start stop kwargs)
  (py:func 'numpy 'linspace `(,start ,stop) kwargs))

;; XXX these two look like they could be done with the macros ... double check
(defun meshgrid (coords)
  (py:func 'numpy 'meshgrid coords))

(defun meshgrid (coords kwargs)
  (py:func 'numpy 'meshgrid coords kwargs))

;; Mathematical functions
;;
(defun + (a b)
  (add a b))

(defun * (a b)
  (multiply a b))

(defun / (a b)
  (divide a b))

(defun ** (a b)
  (power a b))

(defun ^ (a b)
  (power a b))

(defun - (a b)
  (subtract a b))

(defun % (a b)
  (mod a b))

;; I/O
;;
(defun genfromtxt (filename)
  (genfromtxt filename '()))

(defun genfromtxt (filename kwargs)
  (py:func 'numpy 'genfromtxt `(,(list_to_binary filename)) kwargs))

;; Polynomials
;;
(defun polyfit (x y degree kwargs)
  (py:func 'numpy 'polyfit `(,x ,y ,degree) kwargs))

(defun poly1d (c-or-r kwargs)
  (py:func 'numpy 'poly1d `(,c-or-r) kwargs))
