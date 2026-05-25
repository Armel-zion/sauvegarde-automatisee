$taskName = "SauvegardeAutomatiqueProjet"
$backupScriptPath = Join-Path $PSScriptRoot "backup.ps1"
$powershellPath = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"

$action = New-ScheduledTaskAction `
    -Execute $powershellPath `
    -Argument "-NoProfile -NonInteractive -ExecutionPolicy Bypass -File `"$backupScriptPath`"" `
    -WorkingDirectory (Split-Path $PSScriptRoot -Parent)

$trigger = New-ScheduledTaskTrigger -Daily -At 07:26

Register-ScheduledTask `
    -TaskName $taskName `
    -Action $action `
    -Trigger $trigger `
    -Description "Sauvegarde automatique du projet" `
    -Force

Write-Host "Tache planifiee creee ou mise a jour : $taskName"