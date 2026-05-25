$configPath = "config/backup-config.json"

$config = Get-Content $configPath | ConvertFrom-Json

Write-Host "Source : $($config.source)"
Write-Host "Destination : $($config.destination)"

$robocopyPath = "C:\Windows\System32\Robocopy.exe"

$logPath = "C:\Logs\Sauvegarde\backup.log"

& $robocopyPath $config.source $config.destination /E /R:3 /W:5 /TEE /LOG:$logPath