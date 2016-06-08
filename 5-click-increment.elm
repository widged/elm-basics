import Html exposing (Html, button, div, text)
import Html.App as Html
import Html.Events exposing (onClick)
import Style exposing (..)

main = Html.beginnerProgram { model = clickCount, view = view, update = update }

-- MODEL

type alias ClickCount = Int

clickCount : ClickCount
clickCount = 0

-- UPDATE

type Msg = Increment | Decrement

update : Msg -> ClickCount -> ClickCount
update msg clickCount =
  case msg of
    Increment ->
      clickCount + 1
    Decrement ->
      clickCount - 1


-- VIEW

view : ClickCount -> Html Msg
view clickCount =
  div [ myStyle ]
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString clickCount) ]
    , button [ onClick Increment ] [ text "+" ]
    ]
