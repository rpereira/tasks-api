{-# LANGUAGE DataKinds       #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeOperators   #-}
module Lib
    ( startApp
    , app
    ) where

import Data.Aeson
import Data.Aeson.TH
import Network.Wai
import Network.Wai.Handler.Warp
import Servant

-- newtype Description = Description Text
--    deriving (Show, Eq, ToJSON, FromJSON, Arbitrary)
--
-- newtype Created = Created Integer
--    deriving (Show, Eq, ToJSON, FromJSON, Arbitrary)
--
-- newtype Completed = Completed Bool
--    deriving (Show, Eq, ToJSON, FromJSON, Arbitrary, FromText, ToText)

data Todo = Todo
  { id          :: Int
  , description :: [Char]
  , created     :: Integer
  , completed   :: Bool
  } deriving (Eq, Show)

$(deriveJSON defaultOptions ''Todo)

type API = "todos" :> Get '[JSON] [Todo]

startApp :: IO ()
startApp = run 8080 app

app :: Application
app = serve api server

api :: Proxy API
api = Proxy

server :: Server API
server = return todos

todos :: [Todo]
todos = [ Todo 1 "This is my first task" 1488878317 False
        , Todo 2 "Buy milk" 1488878382 False
        ]
