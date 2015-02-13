module StreamLazy where

import           Data.Stream (Stream)
import qualified Data.Stream as S

integral :: Int -> Stream Double -> Stream Double
integral rate = S.scan' (\i x -> i + x * dt) 0
  where
    dt = 1 / fromIntegral rate

nthIntegral :: Int -> (Double -> Double) -> Int -> Double
nthIntegral rate fun n = integral rate (S.unfold (\t -> (fun (t / fromIntegral rate),t+1)) 0) S.!! n
