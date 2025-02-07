include("../Conan/conandeps.premake5")

ConanReleaseX64Label = "release_x86_64"
ConanDebugX64Label = "debug_x86_64"

function IncludeLib(name)
    filter "configurations:Debug"
        conan_setup(ConanDebugX64Label, name)

    filter "configurations:Profile"
        conan_setup(ConanReleaseX64Label, name)

    filter "configurations:Shipping"
        conan_setup(ConanReleaseX64Label, name)

    filter {}
end

function IncludeFmt()
    IncludeLib("fmt")
end

function IncludeZlib()
    IncludeLib("zlib")
end

function IncludeGTest()
    IncludeLib("gtest")
end

function IncludePix()
    includedirs { _MAIN_SCRIPT_DIR .. "/Libraries/Pix/Include" }
    libdirs { _MAIN_SCRIPT_DIR .. "/Libraries/Pix/bin/x64" }
    links { "WinPixEventRuntime.lib" }

    defines { "_PIX_USED" }
end

function IncludeAngelScript()
    includedirs { _MAIN_SCRIPT_DIR .. "/Libraries/AngelScript/Include" }
    libdirs { _MAIN_SCRIPT_DIR .. "/Libraries/AngelScript/Lib" }

    filter "configurations:Debug"
        links { "angelscript64d.lib" }

    filter "configurations:Profile"
        links { "angelscript64.lib" }

    filter "configurations:Shipping"
        links { "angelscript64.lib" }

    filter {}

    defines { "_ANGEL_SCRIPT_USED" }
end
