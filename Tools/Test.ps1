
Copy-Item ../Dotter -Recurse -Destination ./

Copy-Item ../Scripts/Launchers/Dotter.bat -Recurse -Destination ./
Copy-Item ../Scripts/Launchers/Dotter.sh -Recurse -Destination ./

cd Dotter


mkdir Output
cd Output
mkdir Cache
mkdir Libraries
mkdir Data
mkdir Build
cd ..

mkdir Run
mkdir deps

mkdir Envoirment
cd Envoirment
mkdir Luvit
cd Luvit


PowerShell -NoProfile -ExecutionPolicy unrestricted -Command "[Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iex ((new-object net.webclient).DownloadString('https://github.com/luvit/lit/raw/master/get-lit.ps1'))"

cd ..
cd ..

./Envoirment/Luvit/lit install creationix/coro-http
./Envoirment/Luvit/lit install luvit/secure-socket


$Value = ""
$Value += '{"Tag-Version": "'
$Value += '69.69.69'
$Value += '", "_comment": "DONT CHANGE THIS!!!"}'
Set-Content -Path ./Config/VersionData.json -Value $Value

clear
echo "Done"