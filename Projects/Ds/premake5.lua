project "ds"
    kind "StaticLib"
    language "C++"

    files { "./**.h", "./**.cpp" }

    SetTargetDir()
