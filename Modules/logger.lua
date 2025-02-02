local logger = {
    levels = {
        INFO = "INFO",
        WARN = "WARN",
        ERROR = "ERROR",
        DEBUG = "DEBUG"
    }
}

local function log(level, message)
    print(string.format("-- [%s] %s", level, message))
end

function logger.info(message)
    log(logger.levels.INFO, message)
end

function logger.warn(message)
    log(logger.levels.WARN, message)
end

function logger.error(message)
    log(logger.levels.ERROR, message)
end

return logger
