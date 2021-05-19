$output = $args[0]

PowerShell -ExecutionPolicy unrestricted -File ./Dotter/Scripts/Build.ps1 $output

Write-Output "Getting ready to create executeable"