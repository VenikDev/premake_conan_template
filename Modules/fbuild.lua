Logger = require("logger")

premake.modules.lua = {}

local modules = premake.modules.lua
local premake = premake

newaction {
    trigger = "fbuild",
    description = "Generate fbuild files",

    onStart = function()
        Logger.info("Starting fbuild generation")
    end,

    onWorkspace = function(wks)
        Logger.info("Generating fbuild for workspace " .. wks.name)
    end,

    onProject = function(prj)
        Logger.info("Generating fbuild for project " .. prj.name)
    end,

    execute = function()
        Logger.info("Executing fbuild action")
    end,

    onEnd = function()
        Logger.info("Fbuild generation complete")
    end
}

return modules
