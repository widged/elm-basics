module Main exposing (..)

import Html exposing (Html, div, text)
import Html.App
import Time exposing (..)

main : Program Never
main = Html.App.program { init = ({ currentTime = 0 }, Cmd.none), view = view, update = update, subscriptions = subscriptions }


type alias Model =
  { currentTime : Time }

type Msg =
  SetCurrentTime Time |
  NoOp

update : Msg -> Model -> (Model, Cmd Msg)
update action model =
    case action of

        NoOp ->
            ( model, Cmd.none)

        SetCurrentTime time ->
            ( { model | currentTime = time }
            , Cmd.none
            )

view : Model -> Html Msg
view model = div []
              [ text <| toString <| model.currentTime]

-- Each time a second goes by, it will wrap the time with SetCurrentTime
-- and then send this message to the update loop
subscriptions : Model -> Sub Msg
subscriptions model = Time.every Time.second SetCurrentTime
