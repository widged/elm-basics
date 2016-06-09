import Html exposing (..)
import Html.App
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Random
import Style exposing (..)
import Task
import Http
import Json.Decode as Json

main = Html.App.program { init = init, view = view, update = update, subscriptions = \ m -> Sub.none }

-- MODEL

type alias Model =
  { topic : String
  , gifUrl : String
  }

init : (Model, Cmd Msg)
init =
  (Model "cats" "waiting.gif", Cmd.none)


-- UPDATE

type Msg
  = MorePlease
  | FetchSucceed String
  | FetchFail Http.Error


update : Msg -> Model -> (Model, Cmd Msg)
update action model =
  case action of
    MorePlease ->
      (model, getRandomGif model.topic)

    FetchSucceed newUrl ->
      (Model model.topic newUrl, Cmd.none)

    FetchFail _ ->
      (model, Cmd.none)


getRandomGif : String -> Cmd Msg
getRandomGif topic =
  let
    url = "http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=" ++ topic
  in
    Task.perform FetchFail FetchSucceed (Http.get decodeGifUrl url)

decodeGifUrl : Json.Decoder String
decodeGifUrl =
  Json.at ["data", "image_url"] Json.string

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ h2 [] [text model.topic]
    , img [src model.gifUrl] []
    , button [ onClick MorePlease ] [ text "More Please!" ]
    ]
