# lsci

*Scientific Computing on the Erlang VM - An LFE Wrapper Library for SciPy, NumPy, and matplotlib*

<img src="resources/images/lsci-logo-1.png"/>


## Table of Contents

* [Introduction](#introduction-)
* [Requirements](#requirements-)
* [Installation](#installation-)
* [Usage](#usage-)
  * [From LFE](#from-lfe-)
  * [From Erlang](#from-erlang-)
  * [Wrapped Library Docs](#wrapped-library-docs-)
* [Development](#development-)


## Introduction [&#x219F;](#table-of-contents)

This project has the lofty goal of making numerical processing an efficient and
easy thing to do in LFE/Erlang. The engine behind this work is
[ErlPort](http://erlport.org/docs/python.html).

Here is a list of the Python packages lsci aims to wrap, annotated with
the current development status:

 * [math](https://docs.python.org/3/library/math.html) -
   <strong>complete</strong>
 * [cmath](https://docs.python.org/3/library/cmath.html) -
   <strong>complete</strong>
 * [statistics](https://docs.python.org/3/library/statistics.html) -
   <strong>complete</strong>
 * [fractions](https://docs.python.org/3/library/fractions.html) -
   <strong>complete</strong>
 * [decimal](https://docs.python.org/3/library/decimal.html) -
   <strong>in progress</strong>
 * [NumPy](http://www.numpy.org/) -
   <strong>in progress</strong>
 * [SciPy](http://www.scipy.org/scipylib/index.html) -
   <strong>in progress</strong>
 * [Pandas](http://pandas.pydata.org/) -
   <em>not started</em>
 * [matplotlib](http://matplotlib.org/) -
   <em>not started</em>
 * [SymPy](http://www.sympy.org/en/index.html) -
   <em>not started</em>

Quick sample:

```cl
> (set array (lsci-np:array '((1 2 3) (4 5 6) (7 8 9))))
#($erlport.opaque python
  #B(128 2 99 110 117 109 112 121 46 99 111 114 101 46 109 117 108 ...))
> (lsci-np:size array)
9
> (lsci-np:shape array)
#(3 3)
```

And it's pronounced "Elsie".


## Requirements [&#x219F;](#table-of-contents)

To use lsci, you need the following:

* [lfetool](http://docs.lfe.io/quick-start/1.html)
* [Python 3](https://www.python.org/downloads/)


## Installation [&#x219F;](#table-of-contents)

For now, just run it from a git clone:

```bash
$ git clone git@github.com:lfex/lsci.git
$ cd lsci
$ make
```


## Usage [&#x219F;](#table-of-contents)

Activate your Python virtualenv and then start up the LFE REPL:

```bash
$ . ./python/.venv/bin/activate
$ make repl-no-deps
```

Note that the ``repl`` and ``repl-no-deps`` targets automatically start up
the lsci (and thus ErlPort) Erlang Python server. If you run the REPL without
these ``make`` targets, you'll need to manually start things:

```bash
$ lfetool repl lfe -s lsci
```

Below we show some basic usage of lsci from both LFE and Erlang. In a
separate section a list of docs are linked showing detailed usage of wrapped
libraries.


### From LFE [&#x219F;](#table-of-contents)

Start up the LFE REPL:

```cl
Erlang/OTP 17 [erts-6.3] [source] [64-bit] [smp:4:4] [async-threads:10] ...

LFE Shell V6.3 (abort with ^G)
>
```

First things first: let's make sure that you have the appropriate versions
of things -- in particular, let's confirm that you're running Python 3:

```cl
> (lsci-util:get-versions)
(#(erlang "17")
 #(emulator "6.2")
 #(driver-version "3.1")
 #(lfe "0.9.0")
 #(erlport "0.9.8")
 #(py "0.0.2")
 #(lsci "0.0.1")
 #(python
   ("3.4.2 (v3.4.2:ab2c023a9432, Oct  5 2014, 20:42:22)"
    "[GCC 4.2.1 (Apple Inc. build 5666) (dot 3)]"))
 #(numpy "1.9.1")
 #(scipy "0.14.0"))
```

lsci comes with [py](https://github.com/lfex/py), so you can make calls
with that library:

```cl
> (py:func 'os 'getpwd)
"/Users/yourname/lab/erlang/lsci"
```

And then of course, math, NumPy, etc.:

```cl
> (lsci-math:pow 2 32)
4294967296.0
> (set array (lsci-np:array '((1 2 3) (4 5 6) (7 8 9))))
#($erlport.opaque python
  #B(128 2 99 110 117 109 112 121 46 99 111 114 101 46 109 117 108 ...))
> (lsci-np:size array)
9
> (lsci-np:shape array)
#(3 3)
```


### From Erlang [&#x219F;](#table-of-contents)

Yes, we can do the same thing from Erlang:

```bash
$ make shell-no-deps
```

```erlang
1> 'lsci-util':'get-versions'().
[{erlang,"17"},
 {emulator,"6.2"},
 {'driver-version',"3.1"},
 {lfe,"0.9.0"},
 {erlport,"0.9.8"},
 {py,"0.0.2"},
 {lsci,"0.0.1"},
 {python,["3.4.2 (v3.4.2:ab2c023a9432, Oct  5 2014, 20:42:22)",
          "[GCC 4.2.1 (Apple Inc. build 5666) (dot 3)]"]},
 {numpy,"1.9.1"},
 {scipy,"0.14.0"}]
2> py:func(os, getcwd).
"/Users/yourname/lab/erlang/lsci"
3> 'lsci-math':pow(2, 32).
4294967296.0
4> Array = 'lsci-np':array([[1,2,3], [4,5,6],[7,8,9]]).
{'$erlport.opaque',python,
                   <<128,2,99,110,117,109,112,121,46,99,111,114,101,46,109,
                     117,108,116,105,97,114,114,97,121,10,95,...>>}
5> 'lsci-np':size(Array).
9
6> 'lsci-np':shape(Array).
{3,3}
```


### Wrapped Library Docs [&#x219F;](#table-of-contents)

More detailed usage information in separate docs, per-wrapped library:

* [lsci-math & lsci-cmath](doc/math.md) - The ``math`` and ``cmath`` Python
  Standard library modules in LFE
* [lsci-stats](doc/stats.md) - The ``statistics`` Python 3 Standard library
  module in LFE
* [lsci-frac](doc/frac.md) - The ``fractions`` Python 3 Standard library
  module in LFE
* [lsci-np](doc/numpy.md) - NumPy in LFE
* [lsci-sp](doc/scipy.md) - SciPy in LFE
* lsci-pd - Pandas in LFE (TBD)
* lsci-mpl - matplotlib in LFE (TBD)
* lsci-sym - SymPy in LFE (TBD)


## Development [&#x219F;](#table-of-contents)

Features waiting to be implemented are
[created as issues](https://github.com/lfex/lsci/issues); check them out
to see how you can contribute.

Read up on [py](https://github.com/lfex/py) to get a feeling for how lsci works.

To understand how the wrapping is done in lsci, check out the
[kla project](https://github.com/billosys/kla) and
[some](https://github.com/billosys/kanin)
[libraries](https://github.com/billosys/lric) that use it.

For insight on how lsci, LFE, and Erlang can interface with Python, see the
[ErlPort docs](http://erlport.org/docs/python.html).
