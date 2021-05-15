echo "Getting ready for download..."

sleep 1

echo "Downloading"

wget -O DotterTemplate.zip "https://github.com/Dot-lua/Dotter-Project-Template/archive/refs/heads/main.zip"

sleep 1

echo "Unpacking"

Expand-Archive -LiteralPath ./DotterTemplate.Zip -DestinationPath ./

echo "Removing ZIP"
rm DotterTemplate.zip

echo "Renaming Dotter-Project-Template-main to Project-Template"
mv "./Dotter-Project-Template-main" Project-Template

echo "Creating src folder"
mv "./Project-Template/src" "./src"

echo "Cleaning..."
rm Project-Template -Recurse

sleep 1
echo "Done!"