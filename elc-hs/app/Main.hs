{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE Strict #-}

module Main where

import Elc

main :: IO ()
main = runIdentityT (generalMain @Array.IO.IOUArray @IdentityT @IO @IORef)
