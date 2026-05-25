$configPath = Join-Path $PSScriptRoot "..\config\backup-config.json"

$config = Get-Content $configPath | ConvertFrom-Json

$robocopyPath = "C:\Windows\System32\Robocopy.exe"
$logPath = "C:\Logs\Sauvegarde\backup.log"

$hasError = $false

foreach ($job in $config.jobs) {
    Write-Host "Sauvegarde : $($job.name)"
    Write-Host "Source : $($job.source)"
    Write-Host "Destination : $($job.destination)"

    & $robocopyPath $job.source $job.destination /E /R:3 /W:5 /TEE /LOG+:$logPath

    $exitCode = $LASTEXITCODE

    if ($exitCode -ge 8) {
        Write-Host "Erreur pendant la sauvegarde $($job.name). Code Robocopy : $exitCode"
        $hasError = $true
    }
    else {
        Write-Host "Sauvegarde $($job.name) terminee avec succes. Code Robocopy : $exitCode"
    }
}

if ($hasError) {
    exit 1
}
else {
    exit 0
}