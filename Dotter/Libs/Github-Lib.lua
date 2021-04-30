local Lib = {}
local Json = require("json")
local Http = require("coro-http")

local Repro = "https://api.github.com/repos/Dot-lua/Dotter/releases"

local FS = require('fs')
local Read, Write, ReadDir = FS.readFileSync, FS.writeFileSync, FS.readdirSync

_G.RemoteVersion = RemoteVersion or GetRemote()

function GetRemote()
    local WebRequest, WebBody
    local Running = true
    local Times = 0
    
    WebRequest, WebBody = Http.request("GET", Repro, {{"User-Agent", "Dotter Compiler"}})

    local Decode = Json.decode(WebBody)

    _G.RemoteVersion = Decode[1].tag_name

    return Decode[1].tag_name
end

function Lib.GetVersion()
    local FileData = Read("./Dotter/Config/VersionData.json")
    local Decode = Json.decode(FileData)

    return Decode["Tag-Version"]
end

function Lib.GetRemoteVersion()
    if RemoteVersion then
        return RemoteVersion
    else
        return GetRemote()
    end
end

function Lib.IsLatest()
    local ThisVersion = Lib.GetVersion()
    local ThatVersion = Lib.GetRemoteVersion()

    return ThisVersion == ThatVersion
end

return Lib