module Cadence.SessionLogSpec (spec) where

import Cadence.Goal (GoalId (..))
import Cadence.SessionLog
  ( MinutesPracticed (..)
  , SessionLog (..)
  , SessionLogId (..)
  )
import Data.Text (pack)
import Data.Time.Calendar (fromGregorian)
import Test.Hspec (Spec, describe, it, shouldBe)

spec :: Spec
spec =
  describe "SessionLog" $
    it "captures what was practiced on a given day" $
      SessionLog
        { sessionLogId = SessionLogId (pack "2026-05-09-evening-practice")
        , day = fromGregorian 2026 5 9
        , minutesPracticed = MinutesPracticed 25
        , goalIds =
            [ GoalId (pack "learn-stella")
            , GoalId (pack "learn-fretboard")
            ]
        , note = Just (pack "Worked on melody and fretboard mapping")
        }
        `shouldBe` SessionLog
          { sessionLogId = SessionLogId (pack "2026-05-09-evening-practice")
          , day = fromGregorian 2026 5 9
          , minutesPracticed = MinutesPracticed 25
          , goalIds =
              [ GoalId (pack "learn-stella")
              , GoalId (pack "learn-fretboard")
              ]
          , note = Just (pack "Worked on melody and fretboard mapping")
          }
