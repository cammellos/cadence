module Cadence.ObjectiveSpec (spec) where

import Cadence.Objective (Objective (..), ObjectiveId (..))
import Data.Text (pack)
import Test.Hspec (Spec, describe, it, shouldBe)

spec :: Spec
spec =
  describe "Objective" $
    it "captures an objective id and title" $
      Objective
        { objectiveId = ObjectiveId (pack "learn-jazz")
        , title = pack "Learn jazz on double bass"
        }
        `shouldBe` Objective
          { objectiveId = ObjectiveId (pack "learn-jazz")
          , title = pack "Learn jazz on double bass"
          }
