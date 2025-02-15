include("../Conan/conandeps.premake5")

CONAN_RELEASE_X_64_LABEL = "release_x86_64"
CONAN_DEBUG_X_64_LABEL = "debug_x86_64"

function IncludeLib(name)
    filter "configurations:Debug"
        conan_setup(CONAN_DEBUG_X_64_LABEL, name)

    filter "configurations:Profile"
        conan_setup(CONAN_RELEASE_X_64_LABEL, name)

    filter "configurations:Shipping"
        conan_setup(CONAN_RELEASE_X_64_LABEL, name)

    filter {}
end

function IncludeFmt()
    IncludeLib("fmt")

    defines { "_FMT_USED" }
end

function IncludeZlib()
    IncludeLib("zlib")

    defines { "_ZLIB_USED" }
end

function IncludeGTest()
    IncludeLib("gtest")

    defines { "_GTEST_USED" }
end

function IncludePix()
    includedirs { _MAIN_SCRIPT_DIR .. "/Libraries/Pix/Include" }
    libdirs { _MAIN_SCRIPT_DIR .. "/Libraries/Pix/bin/x64" }
    links { "WinPixEventRuntime.lib" }

    defines { "_PIX_USED" }
end


function IncludeLLVM()
    local llvmInstallDir = _MAIN_SCRIPT_DIR ..  "/Libraries/llvm"
    local llvmToolVer = 19

    includedirs {
        path.join(llvmInstallDir, "include"),
        path.join(llvmInstallDir, "lib", "clang", llvmToolVer, "include")
    }

    -- Specify the directory where the LLVM libraries are located.
    libdirs { path.join(llvmInstallDir, "lib") }

    -- Connect the LLVM libraries directly.
    -- The list of libraries may vary depending on which LLVM components are used.
    links { "LLVM", "LLVMSupport", "LLVMCore", "LLVMPasses", "LLVMIRReader" }

    defines { "_LLVM_USED" }
end