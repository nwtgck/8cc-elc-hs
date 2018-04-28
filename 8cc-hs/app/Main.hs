{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE Strict #-}

module Main where

import Data.Array.IO
import Data.IORef
import Control.Monad.Trans.Identity

import X8cc

main :: IO ()
main = runIdentityT (generalMain @IOUArray @IdentityT @IO @IORef)
