module Cadence.CurrentPlan
  ( CurrentPlan (..)
  , CurrentPlanId (..)
  , CurrentPlanStatus (..)
  , RoutineBlock (..)
  , RoutineBlockId (..)
  ) where

import Cadence.Constraint (Minutes)
import Cadence.Goal (GoalId)
import Data.Text (Text)
import Data.Time.Calendar (Day)

newtype CurrentPlanId = CurrentPlanId Text
  deriving (Eq, Show)

data CurrentPlanStatus
  = PlanActive
  | PlanCompleted
  | PlanStale
  deriving (Eq, Show)

newtype RoutineBlockId = RoutineBlockId Text
  deriving (Eq, Show)

data RoutineBlock = RoutineBlock
  { routineBlockId :: RoutineBlockId
  , title :: Text
  , duration :: Minutes
  , goalIds :: [GoalId]
  , instructions :: Text
  }
  deriving (Eq, Show)

data CurrentPlan = CurrentPlan
  { currentPlanId :: CurrentPlanId
  , day :: Day
  , summary :: Text
  , status :: CurrentPlanStatus
  , routineBlocks :: [RoutineBlock]
  }
  deriving (Eq, Show)
