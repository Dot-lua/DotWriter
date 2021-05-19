$output = $args[0]


Write-Output "Generating output to $output.dua"
Start-Sleep 1

Write-Output "Cleaning output folder.."
Remove-Item ./Dotter/Output/ -Recurse
mkdir ./Dotter/Output/ > $null
mkdir ./Dotter/Output/Cache > $null
mkdir ./Dotter/Output/Libraries > $null 
mkdir ./Dotter/Output/Data > $null 
mkdir ./Dotter/Output/Build > $null


Write-Output "Cloning src folder..."
Copy-Item ./src -Recurse -Destination ./Dotter/Output/Data

Write-Output "Unpacking main folder to src..."
Move-Item ./Dotter/Output/Data/src/main/* ./Dotter/Output/Data/src/

Write-Output "Unpacking lua folder"
Move-Item ./Dotter/Output/Data/src/lua/* ./Dotter/Output/Data/src/

Write-Output "Removing lua and main folder"
Remove-Item ./Dotter/Output/Data/src/lua/ -Recurse
Remove-Item ./Dotter/Output/Data/src/main/ -Recurse

Write-Output "Compressing dua"
Compress-Archive -path ./Dotter/Output/Data/src/* -DestinationPath ./Dotter/Output/Cache/Out.zip
Start-Sleep 1

Write-Output "Cleaning archive"
Move-Item ./Dotter/Output/Cache/Out.zip ./Dotter/Output/Cache/$output.dua

Write-Output "Moving archive"
Copy-Item ./Dotter/Output/Cache/$output.dua  -Destination ./Dotter/Output/build/$output.dua

Write-Output "Done!"
Start-Sleep 1

#"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -open Project.exe -save Project.exe -action addoverwrite -res "./ProgramIcon.ico" -mask ICONGROUP,MAINICON,
#ie4uinit.exe -show 
#ie4uinit.exe -ClearIconCache 