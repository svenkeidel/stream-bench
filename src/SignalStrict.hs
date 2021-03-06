module SignalStrict where

import Prelude hiding ((!!),(>>))

data Signal s a b = Signal !((a,s) -> (b,s)) !s

scan :: (s -> a -> s) -> s -> Signal s a s
scan f = Signal (\(a,s) -> let s' = f s a in (s',s'))

unfold :: (s -> (b,s)) -> s -> Signal s a b
unfold f = Signal (\(_,s) -> f s)

(!!) :: Signal s () b -> Int -> b
Signal f s !! 0 = fst $ f ((),s)
Signal f s !! n = Signal f (snd (f ((),s))) !! (n-1)
infixl 9 !!

(>>) :: Signal s a b -> Signal t b c -> Signal (s,t) a c
Signal f s0 >> Signal g t0 = Signal go (s0,t0)
  where
    go (a,(s,t)) =
      let (b,s') = f (a,s)
          (c,t') = g (b,t)
      in (c,(s',t'))
infixl 1 >>
{-# INLINE (>>) #-}

integral :: Int -> Signal Double Double Double
integral rate = scan (\x i -> i + x * dt) 0
  where
    dt = 1 / fromIntegral rate
{-# INLINE integral #-}

nthIntegral :: Int -> (Double -> Double) -> Int -> Double
nthIntegral rate fun n =
  (unfold (\t -> (fun (t / fromIntegral rate),t+1)) 0
    >> integral rate)
    !! n
{-# INLINE nthIntegral #-}
