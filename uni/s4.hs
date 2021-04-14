
data MyEnum = Option1 | Option2 | Option3 deriving (Enum)

data IntVector2D = IntVector2D {
    intVec2DX :: Int,
    intVec2DY :: Int
} deriving (Bounded)

data Vector2D a = Vector2D {
    vec2DX :: a,
    vec2DY :: a
} deriving (Bounded)
