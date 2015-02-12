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
time                 10.91 ms   (10.84 ms .. 11.01 ms)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 10.66 ms   (10.54 ms .. 10.74 ms)
std dev              265.8 μs   (159.2 μs .. 361.7 μs)

benchmarking signal/integral of sinus for 1 second at 48 khz
time                 2.754 ms   (2.746 ms .. 2.766 ms)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 2.796 ms   (2.786 ms .. 2.804 ms)
std dev              29.66 μs   (26.10 μs .. 33.18 μs)

benchmarking automaton/integral of sinus for 1 second at 48 khz
time                 1.381 s    (1.354 s .. 1.395 s)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 1.389 s    (1.383 s .. 1.392 s)
std dev              5.116 ms   (0.0 s .. 5.483 ms)
variance introduced by outliers: 19% (moderately inflated)

benchmarking coroutine/integral of sinus for 1 second at 48 khz
time                 118.0 ms   (117.1 ms .. 118.9 ms)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 118.1 ms   (117.8 ms .. 118.4 ms)
std dev              452.7 μs   (308.9 μs .. 606.8 μs)
variance introduced by outliers: 11% (moderately inflated)
```

The used compiler and libraries:

 * ghc 7.8.3
 * arrows 0.4.4.1
 * stream 0.4.7.1
