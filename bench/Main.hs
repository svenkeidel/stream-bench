{-# LANGUAGE Arrows #-}
module Main where

import Criterion.Main

import qualified Automaton
import qualified Baseline
import qualified CoroutineLazy
import qualified CoroutineStrict
import qualified SignalLazy
import qualified SignalStrict
import qualified StreamLazy
import qualified StreamStrict

main :: IO ()
main = defaultMain
  [ bgroup "c/baseline" $
    [ bench "integral of sinus for 1 second at 48 khz" $
       whnf (Baseline.nthIntegral 48000) 48000
    ]
  , benchmark "automaton" Automaton.nthIntegral
  , benchmark "coroutine/lazy" CoroutineLazy.nthIntegral
  , benchmark "coroutine/strict" CoroutineStrict.nthIntegral
  , benchmark "signal/lazy" SignalLazy.nthIntegral
  , benchmark "signal/strict" SignalStrict.nthIntegral
  , benchmark "stream/lazy" StreamLazy.nthIntegral
  , benchmark "stream/strict" StreamStrict.nthIntegral
  ]
  where
    benchmark name f = 
      bgroup name $
       [ bench "integral of sinus for 1 second at 48 khz" $
           whnf (f 48000 sin) 48000
       ]
