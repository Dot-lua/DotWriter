echo "Getting ready for download..."

sleep 1

echo "Downloading"

curl -0 -L "https://github.com/Dot-lua/Dotter-Project-Template/archive/refs/heads/main.zip" -o DotterTemplate.zip 

sleep 1

echo "Unpacking"

unzip ./DotterTemplate.zip

echo "Removing ZIP"
rm DotterTemplate.zip

echo "Renaming Dotter-Project-Template-main to Project-Template"
mv "./Dotter-Project-Template-main" Project-Template

echo "Creating src folder"
mv "./Project-Template/src" "./src"

echo "Cleaning..."
rm -r ./Project-Template

sleep 1
echo "Done!"