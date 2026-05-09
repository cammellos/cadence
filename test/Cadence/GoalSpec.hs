module Cadence.GoalSpec (spec) where

import Cadence.Goal
  ( Goal (..)
  , GoalId (..)
  , GoalStatus (GoalActive)
  )
import Cadence.Objective (ObjectiveId (..))
import Data.Text (pack)
import Data.Time.Calendar (fromGregorian)
import Test.Hspec (Spec, describe, it, shouldBe)

spec :: Spec
spec =
  describe "Goal" $
    it "captures an actionable practice goal under an objective" $
      Goal
        { goalId = GoalId (pack "learn-stella")
        , objectiveId = ObjectiveId (pack "learn-jazz")
        , title = pack "Learn Stella By Starlight"
        , targetDate = Just (fromGregorian 2026 5 16)
        , status = GoalActive
        , focusAreas =
            [ pack "walking"
            , pack "melody"
            , pack "chords"
            , pack "improvising"
            ]
        }
        `shouldBe` Goal
          { goalId = GoalId (pack "learn-stella")
          , objectiveId = ObjectiveId (pack "learn-jazz")
          , title = pack "Learn Stella By Starlight"
          , targetDate = Just (fromGregorian 2026 5 16)
          , status = GoalActive
          , focusAreas =
              [ pack "walking"
              , pack "melody"
              , pack "chords"
              , pack "improvising"
              ]
          }
