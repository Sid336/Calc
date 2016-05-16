{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}


import           Yesod
import           Prelude                (IO)
import           GHC.Generics
import           ClassyPrelude
import           Control.Applicative

data App = App

mkYesod "App" [parseRoutes|
     
/add/#Int/#Int AddR GET
/sub/#Int/#Int SubR GET
/mul/#Int/#Int MulR GET
/di/#Int/#Int DivR GET
|]

instance Yesod App 

getAddR x y = do
  let result = x + y
  defaultLayout [whamlet|
  <p> input is #{x} + #{y} the answer is = #{result}
  |]

getSubR x y = do
  let result = x - y
  defaultLayout [whamlet|
  <p> input is #{x} - #{y} the answer is = #{result}
  |]

getMulR x y = do
  let result = x * y
  defaultLayout [whamlet|
  <p> input is #{x} * #{y} the answer is = #{result}
  |] 

getDivR x y = do
  let result = x `div` y
  defaultLayout [whamlet|
  <p> input is #{x} / #{y} the answer is = #{result}
  |] 

main :: IO ()
main = warp 3000 App