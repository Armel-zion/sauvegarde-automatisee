$configPath = "config/backup-config.json"

$config = Get-Content $configPath | ConvertFrom-Json


Write-Host "Source : $($config.source)"

Write-Host "Destination : $($config.destination)"