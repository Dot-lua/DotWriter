$RuntimePath = $args[0]
$LocalPath = $args[0]

"PowerShell -NoProfile -ExecutionPolicy unrestricted -Command '$RuntimePath/Envoirment/luvit.exe $RuntimePath/Main.lua run $LocalPath/Dotter/Output/Build/RunArchive.dua -nogui'"
Pause