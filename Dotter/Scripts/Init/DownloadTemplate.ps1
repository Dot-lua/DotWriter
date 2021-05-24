Write-Output "Getting ready for download..."

Start-Sleep 1

Write-Output "Downloading"

Invoke-WebRequest -O DotterTemplate.zip "https://github.com/Dot-lua/Dotter-Project-Template/archive/refs/heads/main.zip"

Start-Sleep 1

Write-Output "Unpacking"

Expand-Archive -LiteralPath ./DotterTemplate.Zip -DestinationPath ./

Write-Output "Removing ZIP"
Remove-Item DotterTemplate.zip

Write-Output "Renaming Dotter-Project-Template-main to Project-Template"
Move-Item "./Dotter-Project-Template-main" Project-Template

Write-Output "Creating src folder"
Move-Item "./Project-Template/src" "./src"

Write-Output "Cleaning..."
Remove-Item Project-Template -Recurse

Start-Sleep 1
Write-Output "Done!"