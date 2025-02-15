project "jit"
    kind "StaticLib"
    language "C++"

    files { "./**.h", "./**.cpp" }

    includedirs {
        PROJECT_DIR .. "/Ds",
    }

    dependson {
        "ds",
    }

    IncludeFmt()
    IncludeLLVM()

    SetTargetDir()
