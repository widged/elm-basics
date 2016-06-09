import Html exposing (Html, button, div, text)
import Html.App as Html
import Html.Events exposing (onClick)
import Style exposing (..)

main = Html.beginnerProgram { model = 0, view = view, update = update }

-- MODEL

type alias CurrentCount = Int

-- UPDATE

type Msg = Increment | Decrement

incrementCount : Int -> CurrentCount -> CurrentCount
incrementCount qty x = x + qty

update : Msg -> CurrentCount -> CurrentCount
update msg clickCount =
  case msg of
    Increment ->
      incrementCount 1 clickCount
    Decrement ->
      incrementCount -1 clickCount


-- VIEW

view : CurrentCount -> Html Msg
view clickCount =
  div [ myStyle ]
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString clickCount) ]
    , button [ onClick Increment ] [ text "+" ]
    ]
