module Cadence.CurrentPlan
  ( CurrentPlan (..)
  , CurrentPlanId (..)
  , CurrentPlanStatus (..)
  , RoutineBlock (..)
  , RoutineBlockId (..)
  ) where

import Cadence.Constraint (Minutes)
import Cadence.Goal (GoalId)
import Data.Aeson (FromJSON, ToJSON)
import Data.Text (Text)
import Data.Time.Calendar (Day)
import GHC.Generics (Generic)

newtype CurrentPlanId = CurrentPlanId Text
  deriving (Eq, Generic, Show)

instance FromJSON CurrentPlanId

instance ToJSON CurrentPlanId

data CurrentPlanStatus
  = PlanActive
  | PlanCompleted
  | PlanStale
  deriving (Eq, Generic, Show)

instance FromJSON CurrentPlanStatus

instance ToJSON CurrentPlanStatus

newtype RoutineBlockId = RoutineBlockId Text
  deriving (Eq, Generic, Show)

instance FromJSON RoutineBlockId

instance ToJSON RoutineBlockId

data RoutineBlock = RoutineBlock
  { routineBlockId :: RoutineBlockId
  , title :: Text
  , duration :: Minutes
  , goalIds :: [GoalId]
  , instructions :: Text
  }
  deriving (Eq, Generic, Show)

instance FromJSON RoutineBlock

instance ToJSON RoutineBlock

data CurrentPlan = CurrentPlan
  { currentPlanId :: CurrentPlanId
  , day :: Day
  , summary :: Text
  , status :: CurrentPlanStatus
  , routineBlocks :: [RoutineBlock]
  }
  deriving (Eq, Generic, Show)

instance FromJSON CurrentPlan

instance ToJSON CurrentPlan
