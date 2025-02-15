Logger = require("logger")

local LLVM_INSTALL_DIR = os.getenv("LLVMInstallDir") or "C:/Program Files/LLVM"
Logger.info("LLVM_INSTALL_DIR = " .. LLVM_INSTALL_DIR)

local LLVM_TOOL_VER = os.getenv("LLVMToolsVersion") or "19"
Logger.info("LLVM_TOOL_VER = " .. LLVM_TOOL_VER)

function IncludeLLVM()
    includedirs {
        path.join(LLVM_INSTALL_DIR, "include"),
        path.join(LLVM_INSTALL_DIR, "lib", "clang", LLVM_TOOL_VER, "include")
    }

    -- Specify the directory where the LLVM libraries are located.
    libdirs { path.join(LLVM_INSTALL_DIR, "lib") }

    -- Connect the LLVM libraries directly.
    -- The list of libraries may vary depending on which LLVM components are used.
    links { "LLVM", "LLVMSupport", "LLVMCore", "LLVMPasses", "LLVMIRReader" }
end