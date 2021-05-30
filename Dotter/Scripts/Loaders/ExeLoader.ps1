$Stage = $args[0]

If ($Stage -Match "StageTwo")
{
    Write-Output "DOT-LUA"
    Write-Output ""
    Write-Output "Copyright (C) 2021 CoreByte"
    Write-Output "Copyright (C) 2021 Dot-lua"
    Write-Output "Copyright (C) 2021 Cubic inc"

    Write-Output "Loading file..."
}
Else
{
    $shell = New-Object -ComObject WScript.Shell
    $shortcut = $shell.CreateShortcut("./Loading.lnk")
    $shortcut.IconLocation = "$PSScriptRoot/Icon.ico"
    $shortcut.TargetPath = "Powershell.exe"
    $shortcut.Arguments = "-NoProfile -ExecutionPolicy unrestricted -File $PSScriptRoot/ExeLoader.ps1 StageTwo"
    $shortcut.Save()

    #Start-Process ./Loading.lnk
    ./Loading.lnk
    Write-Output "Started!"
    Write-Output "This window will now terminate!"
    
}
Start-Sleep 1
If ($Stage -Match "StageTwo")
{
    Pause
}
