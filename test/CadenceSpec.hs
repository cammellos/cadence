module CadenceSpec (spec) where

import Cadence (helloMessage)
import Test.Hspec (Spec, describe, it, shouldBe)

spec :: Spec
spec =
  describe "helloMessage" $
    it "returns the scaffold greeting" $
      helloMessage `shouldBe` "Hello, Haskell!"
