local Lib = {}
local Json = require("json")

local FS = require('fs')
local Read, Write = fs.readFileSync, fs.writeFileSync

function Lib.GetVersion()
    local FileData = Read("../Config/VersionData.json")
    local Decode = Json.decode(FileData)

    return Decode["Tag-Version"]
end

return Github