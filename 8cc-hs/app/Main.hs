{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE Strict #-}

module Main where

import X8cc

main :: IO ()
main = runIdentityT (generalMain @Array.IO.IOUArray @IdentityT @IO @IORef)
