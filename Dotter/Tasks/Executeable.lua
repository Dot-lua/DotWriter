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

    local PathLib = require("path")
    local CurrentPath = PathLib.getRoot() .. PathLib.relative(PathLib.getRoot(), "./")
    --print(CurrentPath)

    local CommandWindows = "PowerShell -NoProfile -ExecutionPolicy unrestricted -File ./Dotter/Scripts/Executeable/Executeable.ps1 " .. ArchiveName

    local Handle

    require("Clean")()

    if WorkingOS == "Windows" then

        local ExeJson = FS.readFileSync("./Dotter/Config/ExeInfo.json")
        local ExeInfo = Json.decode(ExeJson)

        local ExeData = {
            "TargetName=" .. CurrentPath .. "\\Dotter\\Output\\Cache\\Out.exe",
            "FriendlyName=" .. ArchiveName,
            "AppLaunched=Powershell -ExecutionPolicy unrestricted -File .\\ExeLoader.ps1",
            "FILE0=\"Exeloader.ps1\"",
            "FILE1=\"" .. ArchiveName .. ".dua" .. "\"",
            "[SourceFiles]",
            "SourceFiles0=" .. CurrentPath .. "\\Dotter\\Scripts\\Loaders\\",
            "SourceFiles1=" .. CurrentPath .. "\\Dotter\\Output\\Build\\"
        }

        for i, v in pairs(ExeData) do
            table.insert(ExeInfo.Data, v)
        end

        local ExeString = table.concat(ExeInfo.Data, "\n")

        FS.writeFileSync("./Dotter/Output/Cache/ExeData.sed", ExeString)

        Handle = io.popen(CommandWindows)
    elseif WorkingOS == "Mac" then

    end

    for Line in Handle:lines() do
        Logger.Info(Line)
    end
    Handle:close()
    print()
    BuildHelper.Complete()
end