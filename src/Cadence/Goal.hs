module Cadence.Goal
  ( Goal (..)
  , GoalId (..)
  , GoalStatus (..)
  ) where

import Cadence.Objective (ObjectiveId)
import Data.Aeson (FromJSON, ToJSON)
import Data.Text (Text)
import Data.Time.Calendar (Day)
import GHC.Generics (Generic)

newtype GoalId = GoalId Text
  deriving (Eq, Generic, Show)

instance FromJSON GoalId

instance ToJSON GoalId

data GoalStatus
  = GoalActive
  | GoalPaused
  | GoalCompleted
  deriving (Eq, Generic, Show)

instance FromJSON GoalStatus

instance ToJSON GoalStatus

data Goal = Goal
  { goalId :: GoalId
  , objectiveId :: ObjectiveId
  , title :: Text
  , targetDate :: Maybe Day
  , status :: GoalStatus
  , focusAreas :: [Text]
  }
  deriving (Eq, Generic, Show)

instance FromJSON Goal

instance ToJSON Goal
