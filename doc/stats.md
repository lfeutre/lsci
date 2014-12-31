# Python ``statistics`` Module in LFE

## Averages and Measures of Central Location

```cl
> (lsci-stats:mean '(1 2 3 4 4))
2.8
> (lsci-stats:mean '(-1.0 2.5 3.25 5.75))
2.625
```

```cl
> (lsci-stats:median '(1 3 5))
3
> (lsci-stats:median '(1 3 5 7))
4.0
```

```cl
> (lsci-stats:median_low '(1 3 5))
3
> (lsci-stats:median_low '(1 3 5 7))
3
```

```cl
> (lsci-stats:median_high '(1 3 5))
3
> (lsci-stats:median_high '(1 3 5 7))
5
```

```cl
> (lsci-stats:median_grouped '(52 52 53 54))
52.5
> (lsci-stats:median_grouped '(1 2 2 3 4 4 4 4 4 5))
3.7
> (set interval 1)
1
> (lsci-stats:median_grouped '(1 3 3 5 7) interval)
3.25
> (set interval 2)
2
> (lsci-stats:median_grouped '(1 3 3 5 7) interval)
3.5
```

```cl
> (lsci-stats:mode '(1 1 2 3 3 3 3 4))
3
> (lsci-stats:mode '(red blue blue red green red red))
red
```


## Measures of Spread

```cl
> (lsci-stats:pstdev '(1.5 2.5 2.5 2.75 3.25 4.75))
0.986893273527251
```

```cl
> (set data '(0.0 0.25 0.25 1.25 1.5 1.75 2.75 3.25))
(0.0 0.25 0.25 1.25 1.5 1.75 2.75 3.25)
> (lsci-stats:pvariance data)
1.25
> (set mu (lsci-stats:mean data))
1.375
> (lsci-stats:pvariance data mu)
1.25
```

```cl
> (lsci-stats:stdev '(1.5 2.5 2.5 2.75 3.25 4.75))
1.0810874155219827
```

```cl
> (set data '(2.75 1.75 1.25 0.25 0.5 1.25 3.5))
(2.75 1.75 1.25 0.25 0.5 1.25 3.5)
> (lsci-stats:variance data)
1.3720238095238095
> (set xbar (lsci-stats:mean data))
1.6071428571428572
> (lsci-stats:variance data xbar)
1.3720238095238095
```
