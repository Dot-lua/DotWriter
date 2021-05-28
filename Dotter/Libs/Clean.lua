return function()

    local CommandWindows = "PowerShell -NoProfile -ExecutionPolicy unrestricted -File ./Dotter/Scripts/Cleaners/Cleaner.ps1"
    local CommandMac = "sh ./Dotter/Scripts/Cleaners/Cleaner.sh"

    local Handle

    if WorkingOS == "Windows" then
        Handle = io.popen(CommandWindows)
    elseif WorkingOS == "Mac" then
        Handle = io.popen(CommandMac, "r")
    end

    for Line in Handle:lines() do
        Logger.Info(Line)
    end

    Handle:close()


end