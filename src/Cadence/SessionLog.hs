module Cadence.SessionLog
  ( MinutesPracticed (..)
  , SessionLog (..)
  , SessionLogId (..)
  ) where

import Cadence.Goal (GoalId)
import Data.Text (Text)
import Data.Time.Calendar (Day)

newtype SessionLogId = SessionLogId Text
  deriving (Eq, Show)

newtype MinutesPracticed = MinutesPracticed Int
  deriving (Eq, Show)

data SessionLog = SessionLog
  { sessionLogId :: SessionLogId
  , day :: Day
  , minutesPracticed :: MinutesPracticed
  , goalIds :: [GoalId]
  , note :: Maybe Text
  }
  deriving (Eq, Show)
