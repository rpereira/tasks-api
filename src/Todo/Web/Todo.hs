{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE DeriveAnyClass    #-}
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators     #-}
module Todo.Web.Todo
  (
    TodoAPI
  ) where

import Data.Aeson
import Data.Aeson.TH
import Data.Typeable (Typeable)
import GHC.Generics
import Servant

import Todo.Types.Todo

type TodoAPI
     = "todos" :> Get '[JSON] [Todo]
  :<|> "todos" :> Capture "id" Id :> Get '[JSON] Todo
  :<|> "todos" :> ReqBody '[JSON] Todo :> Post '[JSON] Id
  :<|> "todos" :> Capture "id" Id :> ReqBody '[JSON] Todo :> Put '[JSON] Id

data Id = Id Int
  deriving (Show, Generic, Typeable, ToJSON, FromHttpApiData)
