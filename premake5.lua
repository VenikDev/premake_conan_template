Logger = require("Modules/logger")
-- include conan
include("Modules/include_libs")

Logger.info("_PREMAKE_VERSION = " .. _PREMAKE_VERSION)
Logger.info("_WORKING_DIR = " .. _WORKING_DIR)
Logger.info("_MAIN_SCRIPT_DIR = " .. _MAIN_SCRIPT_DIR)
Logger.info("_MAIN_SCRIPT = " .. _MAIN_SCRIPT)

OUTPUT_DIR = "%{cfg.buildcfg}/%{cfg.system}/%{cfg.architecture}"
PROJECT_DIR = _MAIN_SCRIPT_DIR .. "/Projects"
BYNARY_DIR = _MAIN_SCRIPT_DIR .. "/Build/Bin/" .. OUTPUT_DIR

function SetTargetDir()
    targetdir(BYNARY_DIR .. "/%{prj.name}")
    objdir(BYNARY_DIR .. "/%{prj.name}")
end

workspace "start_premake"
    -- We set the location of the files Premake will generate
    --location "Generated"

    -- We indicate that all the projects are C++ only
    language "C++"
    cppdialect "C++20"

    -- Configurations are often used to store some compiler / linker settings together.
    -- The Debug configuration will be used by us while debugging.
    -- The optimized Release configuration will be used when shipping the app.
    configurations { "Debug", "Profile", "Shipping" }

    -- We will compile for x86_64. You can change this to x86 for 32 bit builds.
    architecture "x64"
    platforms "Win64"

    toolset "clang"

    filter "configurations:Debug"
        defines {
            "_DEBUG",
            "_ASSERTS_USED"
        }

        symbols "On"
        optimize "Off"
        rtti "On"

        IncludePix()

    filter "configurations:Profile"
        defines {
            "_PROFILE",
            "_ASSERTS_USED"
        }

        symbols "On"
        optimize "Speed"
        rtti "Off"

        IncludePix()

    filter "configurations:Shipping"
        defines { "_SHIPPING" }
        symbols "off"
        optimize "Speed"
        rtti "Off"

        buildoptions {
            -- Polyhedral Optimizations
            "-mllvm -polly",
            -- Autovectorization
            "-fvectorize"
        }

    filter "platforms:Win64"
        defines { "_PLATFORM_WINDOW" }
        staticruntime "on"

    filter {}


include("Projects/Ds")
include("Projects/Math")
include("Projects/StartPremake")
include("Projects/Autotests")
include("Projects/JitLLVM")
