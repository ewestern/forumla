{-# LANGUAGE DataKinds       #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeOperators   #-}
module Lib
    ( startApp
    ) where

import Data.Aeson
import Data.Aeson.TH
import Network.Wai
import Network.Wai.Handler.Warp
import Servant
import Types

{-data User = User-}
  {-{ userId        :: Int-}
  {-, userFirstName :: String-}
  {-, userLastName  :: String-}
  {-} deriving (Eq, Show)-}

{-$(deriveJSON defaultOptions ''User)-}



type API = "forms" :> Get '[JSON] [Form]

startApp :: IO ()
startApp = run 8080 app

app :: Application
app = serve api server

api :: Proxy API
api = Proxy

server :: Server API
server = return forms

$(deriveJSON options ''FieldType)
$(deriveJSON options ''Form)
$(deriveJSON options ''Field)
$(deriveJSON options ''FieldValue)
{-users :: [User]-}
{-users = [ User 1 "Isaac" "Newton"-}
        {-, User 2 "Albert" "Einstein"-}
        {-]-}
