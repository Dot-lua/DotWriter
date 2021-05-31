OUTPUT=${1?ERROR}


echo "Generating output to $OUTPUT.dua"
sleep 1

echo "Cloning src folder..."
cp -R ./src ./Dotter/Output/Data/

echo "Unpacking main folder to src..."
mv ./Dotter/Output/Data/src/main/* ./Dotter/Output/Data/src/

echo "Unpacking lua folder"
mv ./Dotter/Output/Data/src/lua/* ./Dotter/Output/Data/src/

echo "Removing lua and main folder"
rm -R ./Dotter/Output/Data/src/lua/
rm -R ./Dotter/Output/Data/src/main/
rm -R ./Dotter/Output/Data/src/src/

echo "Compressing dua"
cd ./Dotter/Output/Data/src/
zip -r ../../Cache/Out ./
cd ../../../../
sleep 1

echo "Cleaning archive"
mv ./Dotter/Output/Cache/Out.zip ./Dotter/Output/Cache/$OUTPUT.dua

echo "Moving archive"
cp -R ./Dotter/Output/Cache/$OUTPUT.dua ./Dotter/Output/build/$OUTPUT.dua

echo "Done!"
sleep 1
