return function (Args)

    if FS.existsSync("./src") then
        Logger.Error("The folder 'src' does already exist")
        Logger.Error("If you want to create a new project please do it in a new folder or remove the src folder!")
        
        BuildHelper.Fail()
        
        return false
    end

    --local Command = "PowerShell -NoProfile -ExecutionPolicy unrestricted -Command \"[Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/Dot-lua/Dotter/main/Scripts/Functions/DownloadTemplate.ps1'))\""

    local CommandWindows = "PowerShell -NoProfile -ExecutionPolicy unrestricted -File ./Dotter/Scripts/DownloadTemplate.ps1"
    local CommandMac = "./Dotter/Scripts/DownloadTemplate.sh"

    local Handle

    if WorkingOS == "Windows" then
        Handle = io.popen(CommandWindows)
    elseif WorkingOS == "Mac" then
        FS.chmodSync(CommandMac, 744)
        Handle = io.popen(CommandMac, "r")
        Logger.Info("done odeon odneon")
    end

    for Line in Handle:lines() do
        Logger.Info(Line)
    end

    Handle:close()

    print()

    Logger.Info("Done, you now have a 'src' folder, but you might want to change some names!")
    Logger.Info("Check the template repro at the github organisation!")

    BuildHelper.Complete()

end