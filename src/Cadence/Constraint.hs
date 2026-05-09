module Cadence.Constraint
  ( Constraint (..)
  , ConstraintId (..)
  , ConstraintRule (..)
  , Minutes (..)
  , MinutesRange (..)
  ) where

import Cadence.Objective (ObjectiveId)
import Data.Text (Text)

newtype ConstraintId = ConstraintId Text
  deriving (Eq, Show)

newtype Minutes = Minutes Int
  deriving (Eq, Show)

data MinutesRange = MinutesRange
  { minimumMinutes :: Minutes
  , maximumMinutes :: Minutes
  }
  deriving (Eq, Show)

newtype ConstraintRule
  = DailyTimeBudget MinutesRange
  deriving (Eq, Show)

data Constraint = Constraint
  { constraintId :: ConstraintId
  , objectiveId :: ObjectiveId
  , title :: Text
  , rule :: ConstraintRule
  }
  deriving (Eq, Show)
