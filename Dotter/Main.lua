coroutine.wrap(function ()


    local Args = args
    table.remove(Args, 0)
    table.remove(Args, 1)
    
    _G.Tasks = {
        Run = require("./Tasks/Run.lua"),
        Build = require("./Tasks/Build.lua"),
        Help = require("./Tasks/Help.lua")
    }
    
    if not Args[1] then
        Tasks.Help(Args)
    end
    
    print(require("./Libs/Github-Lib.lua").IsLatest())
    
    
end)()
    