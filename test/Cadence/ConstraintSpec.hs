module Cadence.ConstraintSpec (spec) where

import Cadence.Constraint
  ( Constraint (..)
  , ConstraintId (..)
  , ConstraintRule (DailyTimeBudget)
  , Minutes (..)
  , MinutesRange (..)
  )
import Cadence.Objective (ObjectiveId (..))
import Data.Text (pack)
import Test.Hspec (Spec, describe, it, shouldBe)

spec :: Spec
spec =
  describe "Constraint" $
    it "captures a scoped daily time budget" $
      Constraint
        { constraintId = ConstraintId (pack "jazz-daily-practice")
        , objectiveId = ObjectiveId (pack "learn-jazz")
        , title = pack "Practice jazz for 20-30 minutes per day"
        , rule =
            DailyTimeBudget
              MinutesRange
                { minimumMinutes = Minutes 20
                , maximumMinutes = Minutes 30
                }
        }
        `shouldBe` Constraint
          { constraintId = ConstraintId (pack "jazz-daily-practice")
          , objectiveId = ObjectiveId (pack "learn-jazz")
          , title = pack "Practice jazz for 20-30 minutes per day"
          , rule =
              DailyTimeBudget
                MinutesRange
                  { minimumMinutes = Minutes 20
                  , maximumMinutes = Minutes 30
                  }
          }
