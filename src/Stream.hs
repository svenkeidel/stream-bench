module Stream where

import           Data.Stream (Stream)
import qualified Data.Stream as S

integral :: Double -> Stream Double -> Stream Double
integral dt = S.scan' (\i x -> i + x * dt) 0

nthIntegral :: Double -> (Double -> Double) -> Int -> Double
nthIntegral dt fun n = integral dt (S.unfold (\t -> (fun (t / dt),t+1)) 0) S.!! n
