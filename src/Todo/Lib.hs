{-# LANGUAGE DataKinds       #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeOperators   #-}
module Todo.Lib
    ( startApp
    , app
    ) where

import Data.Aeson
import Data.Aeson.TH
import Network.Wai
import Network.Wai.Handler.Warp
import Servant

import Todo.API

data Todo = Todo
  { id          :: Int
  , description :: [Char]
  , created     :: Integer
  , completed   :: Bool
  } deriving (Eq, Show)

$(deriveJSON defaultOptions ''Todo)

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
