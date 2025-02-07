Logger = require("logger")

function RunConan()
    Logger.info("Starting download all dependencies from conan")

    local pathToConanReleaseBat = _MAIN_SCRIPT_DIR .. "/conan_gen_release.bat";
    local pathToConanDebugBat = _MAIN_SCRIPT_DIR .. "/conan_gen_debug.bat";

    local r1 = os.execute(pathToConanReleaseBat)
    local r2 = os.execute(pathToConanDebugBat)

    if r1 and r2 then
        Logger.info("Dependencies download is complete")
    else
        Logger.error("Dependency loading failed with the following error")
    end

    return r1 and r2
end