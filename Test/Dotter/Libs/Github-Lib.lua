local Lib = {}
local Json = require("json")
local Http = require("../Envoirment/deps/coro-http.lua")

local Repro = "https://api.github.com/repos/Dot-lua/Dotter/releases"

local FS = require('fs')
local Read, Write, ReadDir = FS.readFileSync, FS.writeFileSync, FS.readdirSync

function Lib.GetVersion()
    local FileData = Read("./Dotter/Config/VersionData.json")
    local Decode = Json.decode(FileData)

    return Decode["Tag-Version"]
end

function Lib.GetRemoteVersion()
    
    local WebRequest, WebBody

    local CT = coroutine.wrap(function ()
        WebRequest, WebBody = Http.request("GET", Repro)
    end)()

    print(coroutine.status(CT))

    local Decode = Json.decode(WebData)

    return Decode["Tag-Version"]
end

return Lib