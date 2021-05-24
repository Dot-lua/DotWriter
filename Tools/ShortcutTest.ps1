$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut("./shortcut.lnk")
$shortcut.IconLocation = "C:\Users\Huiswerk\Desktop\Rickroll\ProgramIcon.ico"
$shortcut.TargetPath = "C:\Windows\System32\cmd.exe"
$shortcut.Arguments = "/c pause"
$shortcut.Save()