module Cadence.Goal
  ( Goal (..)
  , GoalId (..)
  , GoalStatus (..)
  ) where

import Cadence.Objective (ObjectiveId)
import Data.Text (Text)
import Data.Time.Calendar (Day)

newtype GoalId = GoalId Text
  deriving (Eq, Show)

data GoalStatus
  = GoalActive
  | GoalPaused
  | GoalCompleted
  deriving (Eq, Show)

data Goal = Goal
  { goalId :: GoalId
  , objectiveId :: ObjectiveId
  , title :: Text
  , targetDate :: Maybe Day
  , status :: GoalStatus
  , focusAreas :: [Text]
  }
  deriving (Eq, Show)
