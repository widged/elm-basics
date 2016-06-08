module Main exposing (..)

import Html exposing (Html, div, text)
import Html.App
import Time exposing (..)

type alias Model =
    { currentTime : Time
    }

type Msg
    = SetCurrentTime Time
    | NoOp

-- Every now takes a "tagger" function.
-- Each time a second goes by, it will wrap the time with SetCurrentTime
-- and then send this message to the update loop
setCurrentTime : Sub Msg
setCurrentTime = Time.every Time.second SetCurrentTime

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
view model =
    div
        []
        [ text <| toString <| model.currentTime]

-- Here, we use the model to figure out what we are currently subscribed to
-- We will use this more in the future
handleSubs : Model -> Sub Msg
handleSubs model = setCurrentTime

main : Program Never
main = Html.App.program { init = ({ currentTime = 0 }, Cmd.none), view = view, update = update, subscriptions = handleSubs }
