{-# LANGUAGE DataKinds       #-}
{-# LANGUAGE TypeOperators   #-}
module Todo.API
  (
    API
  ) where

import Servant

import Todo.Web.Todo

type API = TodoAPI
