module Main (main) where

import qualified Cadence.ConstraintSpec as ConstraintSpec
import qualified Cadence.CurrentPlanSpec as CurrentPlanSpec
import qualified Cadence.GoalSpec as GoalSpec
import qualified Cadence.ObjectiveSpec as ObjectiveSpec
import qualified Cadence.SessionLogSpec as SessionLogSpec
import qualified CadenceSpec
import Test.Hspec (hspec)

main :: IO ()
main = hspec $ do
  CadenceSpec.spec
  ObjectiveSpec.spec
  GoalSpec.spec
  ConstraintSpec.spec
  SessionLogSpec.spec
  CurrentPlanSpec.spec
