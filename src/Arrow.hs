{-# LANGUAGE Arrows #-}
module Arrow where

import Control.Arrow
import Control.Arrow.Operations

integral :: ArrowCircuit a => Int -> a Double Double
integral rate = proc x -> do
  rec let i' = i + x * dt
      i <- delay 0 -< i'
  returnA -< i
  where
    dt = 1 / fromIntegral rate
