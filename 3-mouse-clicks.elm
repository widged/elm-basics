module Main exposing (..)

import Html exposing (Html, div, text)
import Html.App
import Mouse
import Keyboard
import Style exposing (..)

main = Html.App.program { init = init, view = view, update = update, subscriptions = subscriptions }

-- MODEL

type alias ClickCount = Int

init : (ClickCount, Cmd Msg)
init = (0 , Cmd.none)

-- MESSAGES

type Msg
  = MouseMsg Mouse.Position
  | KeyMsg Keyboard.KeyCode

-- VIEW

view : ClickCount -> Html Msg
view clickCount =
  div [ myStyle ]
    [ text (toString clickCount) ]

-- UPDATE

update : Msg -> ClickCount -> (ClickCount, Cmd Msg)
update msg clickCount =
  case msg of
    MouseMsg position ->
      (clickCount + 1, Cmd.none)
    KeyMsg code ->
      (clickCount + 2, Cmd.none)

-- SUBSCRIPTIONS

subscriptions : ClickCount -> Sub Msg
subscriptions clickCount =
  Sub.batch
    [ Mouse.clicks MouseMsg
    , Keyboard.presses KeyMsg
    ]
