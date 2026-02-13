module Helper exposing (..)

import Html
import Html.Attributes exposing (download, name)


add2 : Int -> Int -> Int
add2 int1 int2 =
    int1 + int2


add3 : Float -> Float -> Float -> Float
add3 float1 float2 float3 =
    float1 + float2 + float3


calc : Int -> Int -> (Int -> Int -> Int) -> Int
calc int1 int2 operator =
    operator int1 int2


langs : List { name : String, releaseYear : Int, currentVersion : String }
langs =
    [ { name = "java"
      , releaseYear = 1991
      , currentVersion = "23.0"
      }
    , { name = "Elm"
      , releaseYear = 2012
      , currentVersion = "0.19.1"
      }
    ]


languageNames : List { name : String, releaseYear : Int, currentVersion : String } -> List String
languageNames inData =
    List.map .name inData


users : List { name : String, uType : String }
users =
    [ { name = "David"
      , uType = "Student"
      }
    , { name = "Mitsiu"
      , uType = "Professor"
      }
    , { name = "Yeros"
      , uType = "Student"
      }
    ]


type alias User =
    { name : String, uType : String }


getStudentName : User -> String
getStudentName user =
    case .uType user of
        "Student" ->
            .name user

        _ ->
            ""


onlyStudents : List User -> List String
onlyStudents students =
    List.map getStudentName students


videogames : List { title : String, releaseYear : Int, available : Bool, downloads : Int, genres : List String }
videogames =
    [ { title = "Super Mario Bros"
      , releaseYear = 1985
      , available = True
      , downloads = 380000000
      , genres =
            [ "Plataformas"
            , "Retro"
            ]
      }
    , { title = "The leyend of Zelda"
      , releaseYear = 1986
      , available = True
      , downloads = 380000000
      , genres =
            [ "Aventuras"
            , "Retro"
            , "Exploracion"
            ]
      }
    ]


type alias Videogame =
    { title : String, releaseYear : Int, available : Bool, downloads : Int, genres : List String }


getVideogameGenres : List Videogame -> List (List String)
getVideogameGenres videogameList =
    List.map .genres videogameList


type alias Computer =
    { ram : String, model : String, brand : String, screenSize : String }


myLaptop : Computer
myLaptop =
    { ram = "32", model = "ThinkPad", brand = "Lenovo", screenSize = "13" }


main : Html.Html msg
main =
    Html.div []
        [ Html.h1 []
            [ Html.text "My laptop" ]
        , Html.div []
            [ Html.ul []
                [ Html.li [] [ Html.text ("Ram: " ++ .ram myLaptop) ]
                , Html.li [] [ Html.text ("Modelo: " ++ .model myLaptop) ]
                , Html.li [] [ Html.text ("Marca: " ++ .brand myLaptop) ]
                , Html.li [] [ Html.text ("Pulgadas: " ++ .screenSize myLaptop) ]
                ]
            ]
        ]


aList : List String -> Html.Html msg
aList listaContent =
    Html.ul
        []
        (List.map anItem listaContent)


anItem : String -> Html.Html msg
anItem content =
    Html.li [] [ Html.text content ]
