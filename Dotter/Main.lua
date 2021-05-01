coroutine.wrap(function ()

    print()

    local Args = args
    table.remove(Args, 0)
    table.remove(Args, 1)
    local GitLib = require("./Libs/Github-Lib.lua")
    _G.Logger = require("Logger")

    if not GitLib.IsLatest() then
        Logger.Warn("WARNING - You are running an older version of Dotter!")
        Logger.Warn("Reinstall Dotter! - View how to do so at http://Dotter.cubicinc.ga/reinstall")
        Logger.Warn("Your version: " .. GitLib.GetVersion() .. " Remote version: " .. GitLib.GetRemoteVersion())
        print()
    end
    
    _G.Tasks = {
        Run = require("./Tasks/Run.lua"),
        Build = require("./Tasks/Build.lua"),
        Help = require("./Tasks/Help.lua")
    }
    
    if not Args[1] then
        Tasks.Help(Args)
    end
    
    print()
    
end)()
    