
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

$Tag = "0.0.1"

wget -O Installer.zip "https://github.com/Dot-lua/Dotter/archive/refs/tags/$Tag.zip"

Expand-Archive -LiteralPath ./Installer.Zip -DestinationPath ./

sleep 1

echo "Removing ZIP"
rm Installer.zip

echo "Renaming"
mv "Dotter-$Tag/" Dotter-Installer

sleep 1

mv ./Dotter-Installer/Dotter ./Dotter

sleep 1

echo "Done"

echo "cd up"
#cd ..

echo "also done!"

sleep 2

echo "starting"

