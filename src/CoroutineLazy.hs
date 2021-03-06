module CoroutineLazy where

import Prelude hiding ((!!),(>>))

newtype Coroutine a b = Coroutine (a -> (b, Coroutine a b))

scan :: (s -> a -> s) -> s -> Coroutine a s
scan f = go
  where
    go s = Coroutine $ \a -> let s' = f s a in (s',go s')

unfold :: (s -> (b,s)) -> s -> Coroutine a b
unfold f = go
  where
    go s = Coroutine $ const $ let (b,s') = f s in (b,go s')

(!!) :: Coroutine () a -> Int -> a
Coroutine f !! 0 = fst $ f ()
Coroutine f !! n = snd (f ()) !! (n-1)
infixl 9 !!

(>>) :: Coroutine a b -> Coroutine b c -> Coroutine a c
Coroutine f >> Coroutine g = Coroutine $ \a ->
  let (b,f') = f a
      (c,g') = g b
  in (c,f' >> g')
infixl 1 >>

integral :: Int -> Coroutine Double Double
integral rate = scan (\x i -> i + x * dt) 0
  where
    dt = 1 / fromIntegral rate

nthIntegral :: Int -> (Double -> Double) -> Int -> Double
nthIntegral rate fun n = (unfold (\t -> (fun (t / fromIntegral rate),t+1)) 0 >> integral rate) !! n
