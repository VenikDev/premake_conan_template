project "logger"
    kind "StaticLib"
    language "C++"

    files { "./**.h", "./**.cpp" }

    SetTargetDir()
