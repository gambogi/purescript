module Main where

import Control.Monad.Eff

data List a = Cons a (List a) | Nil

class Sequence t where
  sequence :: forall m a. (Monad m) => t (m a) -> m (t a)

instance sequenceList :: Sequence List where
  sequence Nil = pure Nil
  sequence (Cons x xs) = Cons <$> x <*> sequence xs

main = sequence $ Cons (Debug.Trace.trace "Done") Nil
