Write-Output "Cleaning output folder.."
Remove-Item ./Dotter/Output/ -Recurse
mkdir ./Dotter/Output/ > $null
mkdir ./Dotter/Output/Cache > $null
mkdir ./Dotter/Output/Libraries > $null 
mkdir ./Dotter/Output/Data > $null 
mkdir ./Dotter/Output/Build > $null