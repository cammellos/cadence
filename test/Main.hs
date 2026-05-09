module Main (main) where

import Cadence (helloMessage)
import Test.Hspec (describe, hspec, it, shouldBe)

main :: IO ()
main = hspec $
  describe "helloMessage" $
    it "returns the scaffold greeting" $
      helloMessage `shouldBe` "Hello, Haskell!"
