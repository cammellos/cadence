module Cadence.CurrentPlanSpec (spec) where

import Cadence.Constraint (Minutes (..))
import Cadence.CurrentPlan
  ( CurrentPlan (..)
  , CurrentPlanId (..)
  , CurrentPlanStatus (PlanActive)
  , RoutineBlock (..)
  , RoutineBlockId (..)
  )
import Cadence.Goal (GoalId (..))
import Data.Aeson (decode, encode)
import Data.Text (pack)
import Data.Time.Calendar (fromGregorian)
import Test.Hspec (Spec, describe, it, shouldBe)

spec :: Spec
spec =
  describe "CurrentPlan" $ do
    it "captures a daily routine made of actionable blocks" $
      sampleCurrentPlan `shouldBe` sampleCurrentPlan

    it "round-trips through JSON" $
      decode (encode sampleCurrentPlan) `shouldBe` Just sampleCurrentPlan

sampleCurrentPlan :: CurrentPlan
sampleCurrentPlan =
  CurrentPlan
    { currentPlanId = CurrentPlanId (pack "2026-05-09-jazz-practice")
    , day = fromGregorian 2026 5 9
    , summary = pack "Spend 25 minutes on Stella and fretboard work"
    , status = PlanActive
    , routineBlocks =
        [ RoutineBlock
            { routineBlockId = RoutineBlockId (pack "warm-up")
            , title = pack "Warm up with note finding on one string"
            , duration = Minutes 5
            , goalIds = [ GoalId (pack "learn-fretboard") ]
            , instructions = pack "Play and name notes up the string without rushing"
            }
        , RoutineBlock
            { routineBlockId = RoutineBlockId (pack "stella-melody")
            , title = pack "Play Stella melody slowly in time"
            , duration = Minutes 10
            , goalIds = [ GoalId (pack "learn-stella") ]
            , instructions = pack "Keep steady time and prioritize pitch accuracy"
            }
        , RoutineBlock
            { routineBlockId = RoutineBlockId (pack "walking-bass")
            , title = pack "Walk through the form"
            , duration = Minutes 5
            , goalIds = [ GoalId (pack "learn-stella") ]
            , instructions = pack "Outline the harmony with simple quarter notes"
            }
        , RoutineBlock
            { routineBlockId = RoutineBlockId (pack "fretboard-drill")
            , title = pack "Targeted fretboard drill"
            , duration = Minutes 5
            , goalIds = [ GoalId (pack "learn-fretboard") ]
            , instructions = pack "Map note locations around the positions used today"
            }
        ]
    }
