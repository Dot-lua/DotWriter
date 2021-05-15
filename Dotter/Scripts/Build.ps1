param (
[string]$outputname = "Unknown"
)

echo "Generating output to $outputname"
sleep 1

echo "Cloning src folder..."
Copy-Item ./src -Recurse -Destination ./Dotter/Output/Data

echo "Unpacking main folder to src..."
mv ./Dotter/Output/Data/src/main/* ./Dotter/Output/Data/src/

echo "Unpacking lua folder"
mv ./Dotter/Output/Data/src/lua/* ./Dotter/Output/Data/src/

echo "Removing lua and main folder"
rm ./Dotter/Output/Data/src/lua/ -Recurse
rm ./Dotter/Output/Data/src/main/ -Recurse