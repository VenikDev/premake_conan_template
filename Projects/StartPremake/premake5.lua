project "start_premake"
    kind "ConsoleApp"
    language "C++"

    files { "./**.h", "./**.cpp" }

    includedirs {
        PROJECT_DIR .. "/Ds",
        PROJECT_DIR .. "/Math",
    }

    dependson {
        "ds",
        "math"
    }

    IncludeFmt()
    IncludeZlib()

    SetTargetDir()
