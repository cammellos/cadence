module Cadence.Objective
  ( Objective (..)
  , ObjectiveId (..)
  ) where

import Data.Aeson (FromJSON, ToJSON)
import Data.Text (Text)
import GHC.Generics (Generic)

newtype ObjectiveId = ObjectiveId Text
  deriving (Eq, Generic, Show)

instance FromJSON ObjectiveId

instance ToJSON ObjectiveId

data Objective = Objective
  { objectiveId :: ObjectiveId
  , title :: Text
  }
  deriving (Eq, Generic, Show)

instance FromJSON Objective

instance ToJSON Objective
