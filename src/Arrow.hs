{-# LANGUAGE Arrows #-}
module Arrow where

import Control.Arrow
import Control.Arrow.Operations

integral :: ArrowCircuit a => Double -> a Double Double
integral dt = proc x -> do
  rec let i' = i + x * dt
      i <- delay 0 -< i'
  returnA -< i
