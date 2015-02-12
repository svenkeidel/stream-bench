{-# LANGUAGE Arrows #-}
module Main where

import Criterion.Main

import qualified Stream as Stream
import qualified Signal as Signal
import qualified SignalStrict as SignalStrict
import qualified Automaton as Automaton
import qualified Coroutine as Coroutine
import qualified CoroutineStrict as CoroutineStrict

main :: IO ()
main = defaultMain
  [ benchmark "stream" Stream.nthIntegral
  , benchmark "signal" Signal.nthIntegral
  , benchmark "signal/strict" SignalStrict.nthIntegral
  , benchmark "automaton" Automaton.nthIntegral
  , benchmark "coroutine" Coroutine.nthIntegral
  , benchmark "coroutine/strict" CoroutineStrict.nthIntegral
  ]
  where
    benchmark name f = 
      bgroup name $
       [ bench "integral of sinus for 1 second at 48 khz" $
           whnf (f 48000 sin) 48000
       ]
