{-# LANGUAGE DataKinds       #-}
{-# LANGUAGE TypeOperators   #-}
module Todo.Web.Todo
  (
    TodoAPI
  ) where

import Servant

type TodoAPI = "todos" :> Get '[JSON] [Todo]
