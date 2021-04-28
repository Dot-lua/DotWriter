$Folder = './Dotter'
if (Test-Path -Path $Folder) {
    Write-Host "Dotter folder already exists remove it and try again" -ForegroundColor Red
    exit
} else {
    echo "Downloading"
}

$msg = 'Do you want to Install dotter to this folder and download luvit with it (http://luvit.io - Envoirment)? [Y/N]'
$response = Read-Host -Prompt $msg
if ($response -eq 'y') {
    echo "okay"
} else {
    Write-Host "Install canceled" -ForegroundColor Red
    exit
}

$Tag = [Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/Dot-lua/Dotter/main/Scripts/Functions/GetLatest.ps1'))

wget -O Installer.zip "https://github.com/Dot-lua/Dotter/archive/refs/tags/$Tag.zip"

Expand-Archive -LiteralPath ./Installer.Zip -DestinationPath ./

echo "Removing ZIP"
rm Installer.zip

echo "Renaming"
mv "Dotter-$Tag/" Dotter-Installer

mv ./Dotter-Installer/Dotter ./Dotter
mv ./Dotter-Installer/Scripts/Launchers/Dotter.bat ./Dotter.bat
mv ./Dotter-Installer/Scripts/Launchers/Dotter.sh ./Dotter.sh

rm Dotter-Installer -Recurse

cd Dotter

mkdir Output
cd Output
mkdir Cache
mkdir Libraries
mkdir Data
mkdir Build
cd ..

mkdir Run

mkdir Envoirment
cd Envoirment
mkdir Luvit
mkdir deps
cd Luvit


PowerShell -NoProfile -ExecutionPolicy unrestricted -Command "[Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iex ((new-object net.webclient).DownloadString('https://github.com/luvit/lit/raw/master/get-lit.ps1'))"

cd ..

./Luvit/lit install creationix/coro-http

cd ..
cd ..

echo "also done!"

clear

echo "Done installing Dotter"
echo ""

./Dotter.bat