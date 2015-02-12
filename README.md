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
benchmarking stream/integral of sinus for 1 second at 48 khz
time                 10.23 ms   (9.935 ms .. 10.53 ms)
                     0.996 R²   (0.994 R² .. 1.000 R²)
mean                 10.46 ms   (10.33 ms .. 10.53 ms)
std dev              247.3 μs   (147.7 μs .. 350.4 μs)

benchmarking signal/integral of sinus for 1 second at 48 khz
time                 18.99 ms   (18.96 ms .. 19.02 ms)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 19.05 ms   (19.03 ms .. 19.17 ms)
std dev              100.7 μs   (31.85 μs .. 198.3 μs)

benchmarking signal/strict/integral of sinus for 1 second at 48 khz
time                 2.775 ms   (2.773 ms .. 2.776 ms)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 2.790 ms   (2.786 ms .. 2.793 ms)
std dev              10.52 μs   (10.05 μs .. 11.48 μs)

benchmarking automaton/integral of sinus for 1 second at 48 khz
time                 1.384 s    (1.372 s .. 1.392 s)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 1.387 s    (1.384 s .. 1.389 s)
std dev              2.692 ms   (0.0 s .. 2.910 ms)
variance introduced by outliers: 19% (moderately inflated)

benchmarking coroutine/integral of sinus for 1 second at 48 khz
time                 117.7 ms   (117.4 ms .. 118.3 ms)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 118.0 ms   (117.7 ms .. 118.4 ms)
std dev              492.5 μs   (301.3 μs .. 710.1 μs)
variance introduced by outliers: 11% (moderately inflated)

benchmarking coroutine/strict/integral of sinus for 1 second at 48 khz
time                 84.98 ms   (83.68 ms .. 87.42 ms)
                     0.998 R²   (0.995 R² .. 1.000 R²)
mean                 86.01 ms   (85.01 ms .. 87.18 ms)
std dev              1.803 ms   (1.418 ms .. 2.257 ms)

```

The used compiler and libraries:

 * ghc 7.8.3
 * arrows 0.4.4.1
 * stream 0.4.7.1
