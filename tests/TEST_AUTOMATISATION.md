# Test d'automatisation

## Objectif du test

Vérifier que la tâche planifiée Windows peut lancer automatiquement le script `backup.ps1`.

## Tâche planifiée

Nom de la tâche :

- `SauvegardeAutomatiqueProjet`

## Commande de test

```powershell
Start-ScheduledTask -TaskName "SauvegardeAutomatiqueProjet"

Vérification
Commande utilisée :

Get-ScheduledTaskInfo -TaskName "SauvegardeAutomatiqueProjet"