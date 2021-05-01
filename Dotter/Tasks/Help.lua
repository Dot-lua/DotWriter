return function (Args)
    
    Logger.Error("ERROR - You gave no command to the dotter!")
    Logger.Error("Usage: `./Dotter [Task] [Options]`")
    Logger.Error("You can use the following commands:")

    for i, v in pairs(Tasks) do
        Logger.Error("- " .. i)
    end

end