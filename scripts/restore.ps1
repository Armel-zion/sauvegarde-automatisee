$configPath = "config/backup-config.json"

$config = Get-Content $configPath | ConvertFrom-Json

$robocopyPath = "C:\Windows\System32\Robocopy.exe"
$logPath = "C:\Logs\Sauvegarde\restore.log"
$restoreRoot = "C:\RestaurationTest"

$hasError = $false

foreach ($job in $config.jobs) {
    $restoreDestination = Join-Path $restoreRoot $job.name

    Write-Host "Restauration : $($job.name)"
    Write-Host "Source sauvegarde : $($job.destination)"
    Write-Host "Destination restauration : $restoreDestination"

    & $robocopyPath $job.destination $restoreDestination /E /R:3 /W:5 /TEE /LOG+:$logPath

    $exitCode = $LASTEXITCODE

    if ($exitCode -ge 8) {
        Write-Host "Erreur pendant la restauration $($job.name). Code Robocopy : $exitCode"
        $hasError = $true
    }
    else {
        Write-Host "Restauration $($job.name) terminee avec succes. Code Robocopy : $exitCode"
    }
}

if ($hasError) {
    exit 1
}
else {
    exit 0
}