module Main exposing (..)

import Html exposing (Html, div, text)
import Html.App
import Mouse
import Style exposing (..)

main = Html.App.program { init = init, view = view, update = update , subscriptions = subscriptions }

-- MODEL

type alias Status = String

init : (Status, Cmd Msg)
init = ((toString {x = 0, y = 0}) , Cmd.none)

-- MESSAGES

type Msg = MouseMsg Mouse.Position

-- VIEW

view : Status -> Html Msg
view model =
  div [ myStyle ]
    [ text model]

-- UPDATE

update : Msg -> Status -> (Status, Cmd Msg)
update msg model =
  case msg of
    MouseMsg position ->
      ((toString position), Cmd.none)


-- SUBSCRIPTIONS

subscriptions : Status -> Sub Msg
subscriptions model =
  Sub.batch [
    Mouse.moves MouseMsg
  ]
