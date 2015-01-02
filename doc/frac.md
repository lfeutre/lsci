# Python ``fractions`` Module in LFE

## Instantiation

```cl
> (lsci-frac:new 0.5)
#("fraction" #(1 2))
> (lsci-frac:new 0.75)
#("fraction" #(3 4))
> (lsci-frac:new "0.875")
#("fraction" #(7 8))
> (lsci-frac:new 1 3)
#("fraction" #(1 3))
> (lsci-frac:from-float 0.125)
#("fraction" #(1 8))
```

## Attributes

```cl
> (set frac (lsci-frac:new 0.75))
#("fraction" #(3 4))
> (lsci-frac:num frac)
3
> (lsci-frac:den frac)
4
> (lsci-frac:numerator frac)
3
> (lsci-frac:denominator frac)
4
```

## Methods

```cl
> (set frac (lsci-frac:new "3.1415926535897932"))
#("fraction" #(7853981633974483 2500000000000000))
> (lsci-frac:limit-den frac 1000)
#("fraction" #(355 113))
```

```cl
> (set frac (lsci-frac:new (lsci-math:cos (/ (lsci-math:pi) 3))))
#("fraction" #(4503599627370497 9007199254740992))
> (lsci-frac:limit-den frac)
#("fraction" #(1 2))
> (lsci-frac:limit-den (lsci-frac:new 1.1))
#("fraction" #(11 10))
```

```cl
> (lsci-frac:floor (lsci-frac:new 355 113))
3
> (lsci-frac:ceil (lsci-frac:new 355 113))
4
> (lsci-frac:round (lsci-frac:new 355 113))
3
> (lsci-frac:round (lsci-frac:new 355 113) 5)
#("fraction" #(314159 100000))
```

## Functions

```cl
> (lsci-frac:->float (lsci-frac:new 1 3))
0.3333333333333333
> (set frac-1 (lsci-frac:new 0.75))
#("fraction" #(3 4))
> (set frac-2 (lsci-frac:new 0.5))
#("fraction" #(1 2))
> (lsci-frac:gcd frac-1 frac-2)
#("fraction" #(1 4))
```
