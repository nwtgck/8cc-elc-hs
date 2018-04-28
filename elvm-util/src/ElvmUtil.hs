{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE NamedFieldPuns #-}


module ElvmUtil where

import Data.IORef
import Data.Char
import Data.Bits
import System.Exit
import Control.Monad.Catch

import qualified Data.Array.MArray as MArray
import Data.Array.MArray (MArray)
import qualified Data.Array.IO as Array.IO
import qualified Data.Array.ST as Array.ST
import Data.Ix
import Data.Char
import Data.IORef
import Data.STRef
import Control.Monad.Trans
import Control.Monad.Trans.Identity
import Control.Monad.Trans.State
import Control.Monad.ST


class Monad m => GetPutInt m where
  getInt :: m Int
  putInt :: Int -> m ()

class Monad m => MRef m r where
  newRef    :: a -> m (r a)
  readRef   :: r a -> m a
  writeRef  :: r a -> a -> m ()
  modifyRef :: r a -> (a -> a) -> m ()

class (Ix i, MArray a e m)  => MArrayWithIx a i e m where
  newArray :: (i, i) -> e -> m (a i e)
  newArray = MArray.newArray

  newArray_ :: (i, i) -> m (a i e)
  newArray_ = MArray.newArray_

  readArray :: a i e -> i -> m e
  readArray = MArray.readArray

  writeArray :: a i e -> i -> e -> m ()
  writeArray = MArray.writeArray

data InOut = InOut {input :: [Int], output :: [Int]} deriving (Show, Eq)

defaultInOut :: InOut
defaultInOut = InOut{input=[], output=[]}

instance GetPutInt IO where
  getInt =
    catch (do
        a <- fmap ord getChar
        return a
     )
     (\(SomeException e) -> return 0)
  putInt = putChar . chr

instance GetPutInt m => GetPutInt (IdentityT m) where
  getInt = lift getInt
  putInt = lift . putInt

instance Monad m => GetPutInt (StateT InOut m) where
  getInt = do
    xs <- gets input
    case xs of
      [] -> return 0
      x:xs -> do
       modify (\inOut -> inOut{input=xs})
       return x
  putInt i = do
    modify (\inOut@InOut{output} -> inOut{output=output ++ [i]})

instance MRef IO IORef where
  newRef = newIORef
  readRef = readIORef
  writeRef = writeIORef
  modifyRef = modifyIORef

instance MRef (ST s) (STRef s) where
  newRef = newSTRef
  readRef = readSTRef
  writeRef = writeSTRef
  modifyRef = modifySTRef

instance MArrayWithIx Array.IO.IOUArray Int Int IO
instance MArrayWithIx (Array.ST.STArray s) Int Int (ST s)
