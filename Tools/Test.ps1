
Copy-Item ../Dotter -Recurse -Destination ./

Copy-Item ../Scripts/Launchers/Dotter.bat -Recurse -Destination ./
Copy-Item ../Scripts/Launchers/Dotter.sh -Recurse -Destination ./

Set-Location Dotter


mkdir Output
Set-Locationt Output
mkdir Cache
mkdir Libraries
mkdir Data
mkdir Build
Set-Location ..

mkdir Run
mkdir deps

mkdir Envoirment
Set-Location Envoirment

Copy-Item "C:\Program Files (x86)\Resource Hacker" -Recurse -Destination ./ResourceHacker

mkdir Luvit
Set-Location Luvit

Copy-Item ../../../../ -Recurse -Destination ./ResourceHacker

Set-Location ..
Set-Location ..

./Envoirment/Luvit/lit install creationix/coro-http
./Envoirment/Luvit/lit install luvit/secure-socket
./Envoirment/Luvit/lit install SinisterRectus/discordia


$Value = ""
$Value += '{"Tag-Version": "'
$Value += '69.69.69'
$Value += '", "_comment": "DONT CHANGE THIS!!!"}'
Set-Content -Path ./Config/VersionData.json -Value $Value

Clear-Host
Write-Output "Done"