$output = $args[0]

PowerShell -ExecutionPolicy unrestricted -File ./Dotter/Scripts/Builders/Build.ps1 $output

Write-Output "Getting ready to create executeable"

Write-Output "Creating exe"
iexpress.exe /N ./Dotter/Output/Cache/ExeData.sed


Write-Output "Compiling rc"
.\Dotter\Envoirment\ResourceHacker\ResourceHacker.exe -log CON -open .\Dotter\Config\ExecuteableInfo.rc -save .\Dotter\Output\Cache\Information.res -action compile 

Write-Output "Resizing icon"
.\Dotter\Envoirment\ffmpeg\ffmpeg -hide_banner -loglevel error -i .\Dotter\Config\Icon.png -vf scale=256:256 .\Dotter\Output\Cache\Icon.ico

Write-Output "Adding ico to EXE"
.\Dotter\Envoirment\ResourceHacker\ResourceHacker.exe -log CON -open .\Dotter\Output\Cache\Out.exe -save .\Dotter\Output\Cache\Out.exe -action addoverwrite -res .\Dotter\Output\Cache\Icon.ico -mask ICONGROUP,MAINICON

Write-Output "Adding res to EXE"
.\Dotter\Envoirment\ResourceHacker\ResourceHacker.exe -log CON -open .\Dotter\Output\Cache\Out.exe -save .\Dotter\Output\Cache\Out.exe -res .\Dotter\Output\Cache\Information.res -action addoverwrite -mask "VERSIONINFO,1,1033"
.\Dotter\Envoirment\ResourceHacker\ResourceHacker.exe -log CON -open .\Dotter\Output\Cache\Out.exe -save .\Dotter\Output\Cache\Out.exe -res .\Dotter\Output\Cache\Information.res -action addoverwrite -mask "VERSIONINFO,1,1043"


Write-Output "Refreshing icons"
cmd /c ie4uinit.exe -show
cmd /c ie4uinit.exe -ClearIconCache

Write-Output Done