coroutine.wrap(function ()


    local Args = args
    table.remove(Args, 0)
    table.remove(Args, 1)
    local GitLib = require("./Libs/Github-Lib.lua")

    if not GitLib.IsLatest() then
        print("WARNING - You are running an older version of Dotter!")
        print("Reinstall Dotter! - View how to do so at http://Dotter.cubicinc.ga/reinstall")
        print("Your version: " .. GitLib.GetVersion() .. " Remote version: " .. GitLib.GetRemoteVersion())
    end
    
    _G.Tasks = {
        Run = require("./Tasks/Run.lua"),
        Build = require("./Tasks/Build.lua"),
        Help = require("./Tasks/Help.lua")
    }
    
    if not Args[1] then
        Tasks.Help(Args)
    end
    
    
    
    
end)()
    