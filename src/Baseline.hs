{-# LANGUAGE ForeignFunctionInterface #-}
module Baseline where

import Foreign.C

foreign import ccall unsafe "nthIntegral" c_nthIntegral :: CDouble -> CInt -> CDouble

nthIntegral :: Double -> Int -> Double
nthIntegral rate n = realToFrac $ c_nthIntegral (realToFrac rate) (fromIntegral n)
