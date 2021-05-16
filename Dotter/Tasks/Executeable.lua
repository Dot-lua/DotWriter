return function (Args)
    
    if not FS.existsSync("./src") then
        Logger.Error("The folder 'src' does not exist")
        Logger.Error("please create it using './Dotter init'!")
        
        BuildHelper.Fail()
        
        return false
    end

    local JsonData = FS.readFileSync("./Dotter/Config/Output.json")
    local Data = Json.decode(JsonData)

    local ArchiveName = ""

    if Data.Version == "0.0.0" then
        ArchiveName = Data.BaseName
    else
        ArchiveName = Data.BaseName .. Data.Version
    end

    local CommandWindows = "PowerShell -NoProfile -ExecutionPolicy unrestricted -File ./Dotter/Scripts/Executeable.ps1 " .. ArchiveName

    if WorkingOS == "Windows" then
        local Handle = io.popen(CommandWindows)

        for Line in Handle:lines() do
            Logger.Info(Line)
        end

        Handle:close()

        print()

        BuildHelper.Complete()
    end

end