PowerShell -NoProfile -ExecutionPolicy unrestricted -Command "[Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/Dot-lua/Dotter/0.0.3/Installers/Install.ps1'))"

echo "Download finished! You can now delete the Installer!"