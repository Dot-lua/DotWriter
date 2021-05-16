$output = $args[0]


echo "Generating output to $output.dua"
sleep 1

echo "Cleaning output folder.."
rm ./Dotter/Output/ -Recurse
mkdir ./Dotter/Output/ > $null
mkdir ./Dotter/Output/Cache > $null
mkdir ./Dotter/Output/Libraries > $null 
mkdir ./Dotter/Output/Data > $null 
mkdir ./Dotter/Output/Build > $null


echo "Cloning src folder..."
Copy-Item ./src -Recurse -Destination ./Dotter/Output/Data

echo "Unpacking main folder to src..."
mv ./Dotter/Output/Data/src/main/* ./Dotter/Output/Data/src/

echo "Unpacking lua folder"
mv ./Dotter/Output/Data/src/lua/* ./Dotter/Output/Data/src/

echo "Removing lua and main folder"
rm ./Dotter/Output/Data/src/lua/ -Recurse
rm ./Dotter/Output/Data/src/main/ -Recurse

echo "Compressing dua"
Compress-Archive -path ./Dotter/Output/Data/src/* -DestinationPath ./Dotter/Output/Cache/Out.zip
sleep 1

echo "Cleaning archive"
mv ./Dotter/Output/Cache/Out.zip ./Dotter/Output/Cache/$output.dua

echo "Moving archive"
Copy-Item ./Dotter/Output/Cache/$output.dua  -Destination ./Dotter/Output/build/$output.dua

echo "Done!"
sleep 1

#"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -open Project.exe -save Project.exe -action addoverwrite -res "./ProgramIcon.ico" -mask ICONGROUP,MAINICON,
#ie4uinit.exe -show 
#ie4uinit.exe -ClearIconCache 