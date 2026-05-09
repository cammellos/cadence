module Cadence.Constraint
  ( Constraint (..)
  , ConstraintId (..)
  , ConstraintRule (..)
  , Minutes (..)
  , MinutesRange (..)
  ) where

import Cadence.Objective (ObjectiveId)
import Data.Aeson (FromJSON, ToJSON)
import Data.Text (Text)
import GHC.Generics (Generic)

newtype ConstraintId = ConstraintId Text
  deriving (Eq, Generic, Show)

instance FromJSON ConstraintId

instance ToJSON ConstraintId

newtype Minutes = Minutes Int
  deriving (Eq, Generic, Show)

instance FromJSON Minutes

instance ToJSON Minutes

data MinutesRange = MinutesRange
  { minimumMinutes :: Minutes
  , maximumMinutes :: Minutes
  }
  deriving (Eq, Generic, Show)

instance FromJSON MinutesRange

instance ToJSON MinutesRange

newtype ConstraintRule
  = DailyTimeBudget MinutesRange
  deriving (Eq, Generic, Show)

instance FromJSON ConstraintRule

instance ToJSON ConstraintRule

data Constraint = Constraint
  { constraintId :: ConstraintId
  , objectiveId :: ObjectiveId
  , title :: Text
  , rule :: ConstraintRule
  }
  deriving (Eq, Generic, Show)

instance FromJSON Constraint

instance ToJSON Constraint
