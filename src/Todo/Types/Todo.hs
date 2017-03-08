{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric  #-}
module Todo.Types.Todo where

import Data.Aeson
import Data.Typeable (Typeable)
import GHC.Generics

data Todo = Todo
  { id          :: Int
  , description :: [Char]
  , created     :: Integer
  , completed   :: Bool
  } deriving (Show, Generic, Typeable)
