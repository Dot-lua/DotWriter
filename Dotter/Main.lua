coroutine.wrap(function ()

    print()

    local Args = args
    table.remove(Args, 0)
    table.remove(Args, 1)

    _G.WorkingOS = Args[1]
    table.remove(Args, 1)

    _G.GitLib = require("Github-Lib")
    _G.Logger = require("Logger")
    _G.BuildHelper = require("BuildHelper")
    _G.FS = require("fs")
    _G.Json = require("json")
    _G.Watch = require("discordia").Stopwatch()
    Watch:start()

    if not GitLib.IsLatest() then
        Logger.Warn("You are running an older version of Dotter!")
        Logger.Warn("Reinstall Dotter! - View how to do so at http://Dotter.cubicinc.ga/reinstall")
        Logger.Warn("Your version: " .. GitLib.GetVersion() .. " Remote version: " .. GitLib.GetRemoteVersion())
        print()
    end
    
    _G.Tasks = {
        run = require("./Tasks/Run.lua"),
        build = require("./Tasks/Build.lua"),
        help = require("./Tasks/Help.lua"),
        init = require("./Tasks/Init.lua")
    }
    
    if not Args[1] then
        Tasks.help(Args)
    else
        local Command = string.lower(Args[1])

        if Tasks[Command] then
            Tasks[Command]()
        else
            BuildHelper.Fail("Command '" .. Command .. "' Does not exist!")
        end

    end


    
    print()
    
end)()
    