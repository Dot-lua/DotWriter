$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut("./Open.lnk")
$shortcut.IconLocation = "C:\Users\Huiswerk\Desktop\Rickroll\ProgramIcon.ico"
$shortcut.TargetPath = "./ExeLoader.ps1"
$shortcut.Arguments = "StageTwo"
$shortcut.Save()