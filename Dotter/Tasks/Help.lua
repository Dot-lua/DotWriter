return function (Args)
    
    print("ERROR - You gave no command to the dotter!")
    print("Usage: `./Dotter [Task] [Options]")
    print("You can use the following commands:")

    for i, v in pairs(Tasks) do
        print("- " .. i)
    end

end