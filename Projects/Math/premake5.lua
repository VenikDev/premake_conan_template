project "math"
    kind "StaticLib"
    language "C++"

    files { "./**.h", "./**.cpp" }

    SetTargetDir()
