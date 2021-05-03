return function (Args)
   
    local FS = require("fs")

    if FS.existsSync("./src") then
        Logger.Error("The folder 'src' does already exist")
        Logger.Error("If you want to create a new project please do it in a new folder or remove the src folder!")
        
        BuildHelper.Fail()
        
        return false
    end

    --os.execute("PowerShell -NoProfile -ExecutionPolicy unrestricted -Command \"[Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/Dot-lua/Dotter/main/Scripts/Functions/DownloadTemplate.ps1'))\"")

    local Command = "PowerShell -NoProfile -ExecutionPolicy unrestricted -Command \"[Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/Dot-lua/Dotter/main/Scripts/Functions/DownloadTemplate.ps1'))\""

    --print(os.execute(Command))

    local Commands = {
        Windows = {
            "wget -O DotterTemplate.zip https://github.com/Dot-lua/Dotter-Project-Template/archive/refs/heads/main.zip",
            "Expand-Archive -LiteralPath ./DotterTemplate.Zip -DestinationPath ./",
            "rm DotterTemplate.zip",
            "mv \"./Dotter-Project-Template-main\" Project-Template",
            "mv \"./Project-Template/src\" \"./src\"",
            "rm Project-Template -Recurse",
            "pwd"
        }
    }

    local File = assert(io.popen(Command))
    local Out = File:read('*a')
    File:close()
    --print(Out)

    --[[
    if WorkingOS == "Windows" then
        Logger.Info("Getting ready to download!")
        
        for i, v in pairs(Commands.Windows) do
            Logger.Info("Running command " .. i .. " " .. v)
            --print(os.execute())

            local Command = "cmd /c PowerShell -Command '" .. v .. "'"

            local File = assert(io.popen(Command))
            local Out = File:read('*a')
            File:close()
            print(Out)
        end
    end]]

end