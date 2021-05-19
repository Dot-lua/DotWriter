$Folder = './Dotter'
if (Test-Path -Path $Folder) {
    Write-Host "Dotter folder already exists remove it and try again" -ForegroundColor Red
    exit
}
else {
    Write-Output "Downloading"
}

$msg = 'Do you want to Install dotter to this folder and download luvit with it (http://luvit.io - Envoirment)? [Y/N]'
$response = Read-Host -Prompt $msg
if ($response -eq 'y') {
    Write-Host "okay"
}
else {
    Write-Host "Install canceled" -ForegroundColor Red
    exit
}

$Tag = [Net.ServicePointManager]::SecurityProtocol = 'Tls12'; Invoke-Expression ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/Dot-lua/Dotter/main/Scripts/Functions/GetLatest.ps1'))

Invoke-WebRequest -O Installer.zip "https://github.com/Dot-lua/Dotter/archive/refs/tags/$Tag.zip"

Expand-Archive -LiteralPath ./Installer.Zip -DestinationPath ./

Write-Host "Removing ZIP"
Remove-Item Installer.zip

Write-Host "Renaming"
Move-Item "Dotter-$Tag/" Dotter-Installer

Move-Item ./Dotter-Installer/Dotter ./Dotter
Move-Item ./Dotter-Installer/Scripts/Launchers/Dotter.bat ./Dotter.bat
Move-Item ./Dotter-Installer/Scripts/Launchers/Dotter.sh ./Dotter.sh

Remove-Item Dotter-Installer -Recurse

Set-Location Dotter

mkdir Output
Set-Location Output
mkdir Cache
mkdir Libraries
mkdir Data
mkdir Build
Set-Location ..

mkdir Run
mkdir deps

mkdir Envoirment
Set-Location Envoirment

mkdir ResourceHacker
Set-Location ResourceHacker

Invoke-WebRequest -O ResourceHacker.zip "http://www.angusj.com/resourcehacker/resource_hacker.zip"
Expand-Archive -LiteralPath ./ResourceHacker.Zip -DestinationPath ./
Write-Host "Removing ZIP"
Remove-Item ResourceHacker.zip


Move-Item ./ResourceHacker/* ./

Set-Location ..

mkdir Luvit
Set-Location Luvit


PowerShell -NoProfile -ExecutionPolicy unrestricted -Command "[Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iex ((new-object net.webclient).DownloadString('https://github.com/luvit/lit/raw/master/get-lit.ps1'))"

Set-Location ..
Set-Location ..

./Envoirment/Luvit/lit install creationix/coro-http
./Envoirment/Luvit/lit install luvit/secure-socket
./Envoirment/Luvit/lit install SinisterRectus/discordia



mkdir Config

$Value = ""
$Value += '{"Tag-Version": "'
$Value += $Tag
$Value += '", "_comment": "DONT CHANGE THIS!!!"}'
Set-Content -Path ./Config/VersionData.json -Value $Value

Set-Location ..

Write-Host "also done!"

Clear-Host

Write-Host "Done installing Dotter"
Write-Host ""

Start-Sleep 3

./Dotter.bat