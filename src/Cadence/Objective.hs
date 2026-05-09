module Cadence.Objective
  ( Objective (..)
  , ObjectiveId (..)
  ) where

import Data.Text (Text)

newtype ObjectiveId = ObjectiveId Text
  deriving (Eq, Show)

data Objective = Objective
  { objectiveId :: ObjectiveId
  , title :: Text
  }
  deriving (Eq, Show)
