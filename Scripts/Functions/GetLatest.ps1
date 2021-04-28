$repo = "Dot-lua/Dotter"
$file = "CodeFormatter.zip"

$releases = "https://api.github.com/repos/$repo/releases"

Write-Host Determining latest release
$tag = (Invoke-WebRequest $releases | ConvertFrom-Json)[0].tag_name

return $tag