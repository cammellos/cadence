module Main (main) where

import qualified Cadence.GoalSpec as GoalSpec
import qualified Cadence.ObjectiveSpec as ObjectiveSpec
import qualified CadenceSpec
import Test.Hspec (hspec)

main :: IO ()
main = hspec $ do
  CadenceSpec.spec
  ObjectiveSpec.spec
  GoalSpec.spec
