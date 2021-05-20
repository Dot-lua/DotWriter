$output = "${1}"


echo "Generating output to $output.dua"
sleep 1

echo "Cleaning output folder.."
rm ./Dotter/Output/
mkdir ./Dotter/Output/
mkdir ./Dotter/Output/Cache
mkdir ./Dotter/Output/Libraries
mkdir ./Dotter/Output/Data
mkdir ./Dotter/Output/Build

pwd > echo

echo "Cloning src folder..."
cp ./src ./Dotter/Output/Data

echo "Unpacking main folder to src..."
cp ./Dotter/Output/Data/src/main/* ./Dotter/Output/Data/src/

echo "Unpacking lua folder"
cp ./Dotter/Output/Data/src/lua/* ./Dotter/Output/Data/src/

echo "Removing lua and main folder"
rm ./Dotter/Output/Data/src/lua/
rm ./Dotter/Output/Data/src/main/

echo "Compressing dua"
zip ./Dotter/Output/Data/src/ ./Dotter/Output/Cache/Out.zip
sleep 1

echo "Cleaning archive"
mv ./Dotter/Output/Cache/Out.zip ./Dotter/Output/Cache/$output.dua

echo "Moving archive"
cp ./Dotter/Output/Cache/$output.dua  -Destination ./Dotter/Output/build/$output.dua

echo "Done!"
sleep 1
