wget -O DotterTemplate.zip "https://github.com/Dot-lua/Dotter-Project-Template/archive/refs/heads/main.zip"

Expand-Archive -LiteralPath ./DotterTemplate.Zip -DestinationPath ./

echo "Removing ZIP"
rm DotterTemplate.zip

echo "Renaming"
mv "./Dotter-Project-Template-main" Project-Template

mv "./Project-Template/src" "./src"

rm Project-Template -Recurse