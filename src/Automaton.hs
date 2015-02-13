{-# LANGUAGE Arrows #-}
module Automaton where

import Prelude hiding ((!!))

import Arrow

import Control.Arrow
import Control.Arrow.Transformer.Automaton
import Control.Arrow.Operations

(!!) :: Automaton (->) () b -> Int -> b
Automaton f !! 0 = fst $ f ()
Automaton f !! n = snd (f ()) !! (n-1)
infixl 9 !!

nthIntegral :: Int -> (Double -> Double) -> Int -> Double
nthIntegral rate fun n = (samples >>> arr fun >>> integral rate) !! n
  where
    samples = proc () -> do
      rec n <- delay 0 -< n + 1
      returnA -< n / fromIntegral rate
