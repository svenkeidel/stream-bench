README
======

This project contains benchmarks for streaming datatypes in haskell. The
objective of this datatypes are to

1. continuously consume and produce values
2. maintain state

These datatypes can be used for audio processing, games, FRP, etc. This areas
have soft real-time requirements and demand a fast streaming datatype.

Build Instructions
------------------

To run the benchmarks execute the following commands:

```shell
cabal update
cabal sandbox init
cabal install --dependencies-only --enable-benchmarks
cabal configure --enable-benchmarks
cabal build -j4
./dist/build/bench/bench
```

Results
-------

The numbers on my PC are:

```
benchmarking c/baseline/integral of sinus for 1 second at 48 khz
time                 1.856 ms   (1.854 ms .. 1.857 ms)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 1.857 ms   (1.857 ms .. 1.857 ms)
std dev              279.0 ns   (233.2 ns .. 346.5 ns)

benchmarking automaton/integral of sinus for 1 second at 48 khz
time                 1.430 s    (1.401 s .. 1.492 s)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 1.432 s    (1.424 s .. 1.438 s)
std dev              9.857 ms   (0.0 s .. 10.97 ms)
variance introduced by outliers: 19% (moderately inflated)

benchmarking coroutine/lazy/integral of sinus for 1 second at 48 khz
time                 117.0 ms   (116.5 ms .. 118.0 ms)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 117.9 ms   (117.6 ms .. 118.3 ms)
std dev              471.2 μs   (340.4 μs .. 601.5 μs)
variance introduced by outliers: 11% (moderately inflated)

benchmarking coroutine/strict/integral of sinus for 1 second at 48 khz
time                 86.22 ms   (83.67 ms .. 88.77 ms)
                     0.999 R²   (0.998 R² .. 1.000 R²)
mean                 84.65 ms   (83.88 ms .. 85.85 ms)
std dev              1.432 ms   (648.3 μs .. 2.493 ms)

benchmarking signal/lazy/integral of sinus for 1 second at 48 khz
time                 54.15 ms   (53.39 ms .. 55.22 ms)
                     0.999 R²   (0.999 R² .. 1.000 R²)
mean                 54.20 ms   (53.68 ms .. 54.65 ms)
std dev              839.1 μs   (577.4 μs .. 1.166 ms)

benchmarking signal/strict/integral of sinus for 1 second at 48 khz
time                 2.767 ms   (2.766 ms .. 2.768 ms)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 2.766 ms   (2.766 ms .. 2.767 ms)
std dev              1.310 μs   (1.125 μs .. 1.596 μs)

benchmarking stream/lazy/integral of sinus for 1 second at 48 khz
time                 10.71 ms   (10.63 ms .. 10.76 ms)
                     1.000 R²   (0.999 R² .. 1.000 R²)
mean                 10.61 ms   (10.52 ms .. 10.67 ms)
std dev              186.2 μs   (127.0 μs .. 260.3 μs)

benchmarking stream/strict/integral of sinus for 1 second at 48 khz
time                 6.481 ms   (6.398 ms .. 6.542 ms)
                     0.999 R²   (0.998 R² .. 0.999 R²)
mean                 6.311 ms   (6.272 ms .. 6.353 ms)
std dev              118.5 μs   (104.2 μs .. 132.0 μs)
```

The used compiler and libraries:

 * ghc 7.8.3
 * arrows 0.4.4.1
 * stream 0.4.7.1
