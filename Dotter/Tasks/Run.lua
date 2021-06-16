return function (Args)
    
    if not FS.existsSync("./src") then
        Logger.Error("The folder 'src' does not exist")
        Logger.Error("please create it using './Dotter init'!")
        
        BuildHelper.Fail()
        
        return false
    end

    local PathLibrary = require("path")

    require("Clean")()

    local CommandWindows = "PowerShell -NoProfile -ExecutionPolicy unrestricted -File ./Dotter/Scripts/Builders/Build.ps1 " .. "RunArchive"
    local CommandMac = "sh ./Dotter/Scripts/Builders/Build.sh " .. "RunArchive" 

    local Handle

    if WorkingOS == "Windows" then
        Handle = io.popen(CommandWindows)
    elseif WorkingOS == "Mac" then
        Handle = io.popen(CommandMac)
    end

    for Line in Handle:lines() do
        Logger.Info(Line)
    end

    Handle:close()

    local OpenHandle

    if WorkingOS == "Windows" then
        local Read = FS.readFileSync
        local RuntimePath = Read(_G.process.env.appdata .. "\\Dot-Lua.RuntimePath")
        

        local LocalPath = PathLibrary.resolve("./") .. "/"
        
        print("runtime", RuntimePath)
        print("local", LocalPath)

        local OpenCommand = RuntimePath .. "Envoirment/Luvit/luvit " .. RuntimePath .. "Main.lua Windows run " .. LocalPath .. "Dotter/Output/Build/RunArchive.dua -nogui -simplelog" -- "PowerShell -NoProfile -ExecutionPolicy unrestricted -File \"./Dotter/Scripts/Run/Run.ps1\" " .. RuntimePath .. " " .. LocalPath
        print("Command", OpenCommand)
        OpenHandle = io.popen(OpenCommand)
        print(OpenHandle)
    elseif WorkingOS == "Mac" then
        print("This is not supported at the moment for mac")
    end

    for Line in OpenHandle:lines() do
        print("runtimeout", Line)
    end

    OpenHandle:close()

end