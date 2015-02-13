module StreamStrict where

import Prelude hiding ((!!))

data Stream a = Cons !a (Stream a)

scan :: (a -> b -> a) -> a -> Stream b -> Stream a
scan f a (Cons b bs) =
  let a' = f a b
  in Cons a' (scan f a' bs)

unfold :: (s -> (a,s)) -> s -> Stream a
unfold f s0 =
  let (a,s) = f s0
  in Cons a (unfold f s)

(!!) :: Stream a -> Int -> a
Cons a _ !! 0 = a
Cons _ s !! n = s !! (n-1)
infixl 9 !!

integral :: Int -> Stream Double -> Stream Double
integral rate = scan (\i x -> i + x * dt) 0
  where
    dt = 1 / fromIntegral rate

nthIntegral :: Int -> (Double -> Double) -> Int -> Double
nthIntegral rate fun n = integral rate (unfold (\t -> (fun (t / fromIntegral rate),t+1)) 0) !! n
